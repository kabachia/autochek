WITH 

loans_enriched AS (
SELECT Loan_id,a.Borrower_id,Date_of_release,Term,LoanAmount,DownPayment,State,City,zip_code,Payment_frequency,
Maturity_date,borrower_credit_score,borrower_name,a.`branch_id` branch_id,branch 
FROM loan_table a 
LEFT JOIN borrower_table b
ON a.`Borrower_id`=b.`Borrower_id`
LEFT JOIN branches c ON
a.`branch_id`=c.`branch_id`),

total_payment_schedule AS
(SELECT loan_id,SUM(Expected_payment_amount) Total_amount_expected FROM `payment_schedule` GROUP BY loan_id),

active_payment_schedule AS
(SELECT loan_id, MAX(Expected_payment_date) last_due_date,SUM(Expected_payment_amount) Total_amount_due FROM `payment_schedule` 
WHERE DATE(Expected_payment_date)<CURDATE() GROUP BY loan_id),

loan_repayments AS
(SELECT loan_id,SUM(Amount_paid) total_amount_paid,MAX(Date_paid) last_payment_date FROM loan_payment GROUP BY loan_id)

SELECT 
loans_enriched.loan_id,
borrower_id,
Date_of_release loan_date_of_release,
term,
LoanAmount,
Downpayment,
state,
city,
zip_code,
payment_frequency,
maturity_date,
CASE WHEN (Total_amount_expected - total_amount_paid >0) THEN DATEDIFF(DATE(NOW()),last_due_date) ELSE 0 END current_days_past_due,
last_due_date,
last_payment_date last_repayment_date,
Total_amount_expected - total_amount_paid amount_at_risk,
borrower_credit_score,
branch,
branch_id,
borrower_name,
ROUND(total_amount_paid,2) total_amount_paid,
ROUND(Total_amount_expected,2) Total_amount_expected
FROM loans_enriched LEFT JOIN total_payment_schedule ON loans_enriched.loan_id = total_payment_schedule.loan_id
LEFT JOIN active_payment_schedule ON loans_enriched.loan_id = active_payment_schedule.loan_id
LEFT JOIN loan_repayments ON loans_enriched.loan_id = loan_repayments.loan_id;