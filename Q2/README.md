# Currency Rate Extractor

This is a python script for pulling exchange rate data from https://xecdapi.xe.com/ and saving it to a database

## Requirements
Python 3 - recommended to run in virtual environment for libraries seperation
## Installation

```bash
cd project_root
pip install -r requirements.txt
```

## Usage
Put in your XeCurrency and database connection credentials directly in the script
```python
XE_USERNAME = ""
XE_PASSWORD = ""
DB_USERNAME = ""
DB_PASSWORD = ""
DB_HOST = "127.0.0.1"
DB_PORT = "3306"
DB_SCHEMA = "autochek"
```

## Scheduling
Example scheduler using crontab
```crontab
0 1 * * * /path/to/python /path/to/save_rates.py
0 23 * * * /path/to/python /path/to/save_rates.py
``` 

## Authors

Martin Kabachia