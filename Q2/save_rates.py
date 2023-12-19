import os
import requests

from sqlalchemy import create_engine
from sqlalchemy import text

XE_USERNAME = ""
XE_PASSWORD = ""
DB_USERNAME = ""
DB_PASSWORD = ""
DB_HOST = "127.0.0.1"
DB_PORT = "3306"
DB_SCHEMA = "autochek"

BASE_CURRENCY = "USD"

currency_codes = {
    "Nigeria": "NGN",
    "Ghana": "GHS",
    "Kenya": "KES",
    "Uganda": "UGX",
    "Morocco": "MAD",
    "CotedIvore": "XOF",
    "Egypt": "EGP",
}


def get_db_connection():
    """Get a DB connection object"""
    connection_string = f"mysql+mysqlconnector://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_SCHEMA}"
    engine = create_engine(connection_string, echo=True)
    return engine


def create_currencies_table():
    """Create a table to store currency data. Ignore if table already exists"""
    engine = get_db_connection()
    with engine.connect() as connection:
        sql = """CREATE TABLE IF NOT EXISTS `currencies` (
                    `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                    `currency_from` varchar(10),
                    `USD_to_currency_rate` double,
                    `currency_to_USD_rate` double,
                    `currency_to` varchar(10)
                )"""
        connection.execute(text(sql))


def get_available_currencies():
    """API call to get all provider supported currencies"""
    response = requests.get(
        "https://xecdapi.xe.com/v1/currencies", auth=(XE_USERNAME, XE_PASSWORD)
    )
    if response.status_code == 200:
        print("Get available currencies:")
        print(response.json())
        return response.json()
    else:
        print(f"Error getting available currencies => {response.text}")
        return {}


def convert_USD_to_currency(currency):
    """API call to get USD to local currecy exchange rate"""
    response = requests.get(
        f"https://xecdapi.xe.com/v1/convert_from?from={BASE_CURRENCY}&to={currency}&amount=1",
        auth=(XE_USERNAME, XE_PASSWORD),
    )
    if response.status_code == 200:
        print(f"Convert USD to {currency} :")
        print(response.json())
        return response.json()
    else:
        print(f"Error converting USD to {currency} => {response.text}")
        return {}


def convert_currency_to_USD(currency):
    """API call to get local currency to USD exchange rate"""
    response = requests.get(
        f"https://xecdapi.xe.com/v1/convert_to?to={currency}&from={BASE_CURRENCY}&amount=1",
        auth=(XE_USERNAME, XE_PASSWORD),
    )
    if response.status_code == 200:
        print(f"Convert {currency} to USD:")
        print(response.json())
        return response.json()
    else:
        print(f"Error converting {currency} to USD => {response.text}")
        return {}


def push_to_db(currency, USD_to_currency_rate, currency_to_USD_rate):
    """Save exchange rate data to database"""
    print(
        f"Saving: {BASE_CURRENCY} {USD_to_currency_rate} {currency_to_USD_rate} {currency}"
    )
    # Create table if it doesn't already exist
    create_currencies_table()
    engine = get_db_connection()
    with engine.connect() as connection:
        # To prevent duplicates remove any earlier records
        connection.execute(
            text(
                f"DELETE FROM currencies WHERE DATE(`timestamp`)=DATE(NOW()) AND currency_to='{currency}'"
            )
        )
        # Insert the new rate
        connection.execute(
            text(
                f"INSERT INTO currencies (`timestamp`,`currency_from`,`USD_to_currency_rate`,`currency_to_USD_rate`,`currency_to`) VALUES (NOW(),'{BASE_CURRENCY}','{USD_to_currency_rate}','{currency_to_USD_rate}','{currency}')"
            )
        )
        connection.commit()


def get_and_save_rates_for_all_currencies():
    """Get exchange rates for all configured currecies and save data to database"""
    for currency in currency_codes.values():
        USD_to_currency_rate_response = convert_USD_to_currency(currency)
        USD_to_currency_rate = USD_to_currency_rate_response.get("to")[0].get("mid")

        currency_to_USD_rate_response = convert_currency_to_USD(currency)
        currency_to_USD_rate = currency_to_USD_rate_response.get("from")[0].get("mid")

        push_to_db(currency, USD_to_currency_rate, currency_to_USD_rate)


if __name__ == "__main__":
    get_and_save_rates_for_all_currencies()
