
SELECT * FROM bank_loan_data

--Total Loan Applications

SELECT COUNT(ID) AS Total_loan_Applications
FROM bank_loan_data

SELECT 
    Year(issue_date) AS Year,
    Month(issue_date) AS Month,
    COUNT(id) AS Total_Applications
FROM bank_loan_data
GROUP BY Year(issue_date), Month(issue_date)
ORDER BY Year, Month;

--Total Loan Applications in December
SELECT COUNT(id) AS Total_Applications
FROM bank_loan_data
WHERE Month(issue_date) = 12

--Total Loan Applications in November
SELECT COUNT(id) AS Total_Applications
FROM bank_loan_data
WHERE Month(issue_date) = 11





--Total funded Amount
SELECT sum(cast(loan_amount AS DECIMAL(18,2))) AS Total_Funded_Amount
FROM bank_loan_data

SELECT 
    Year(issue_date) AS Year,
    Month(issue_date) AS Month,
    sum(cast(loan_amount AS DECIMAL(18,2))) AS Funded_Amount
FROM bank_loan_data
GROUP BY Year(issue_date), Month(issue_date)
ORDER BY Year, Month;

--Total funded Amount in December
SELECT sum(cast(loan_amount AS DECIMAL(18,2))) AS Total_Funded_Amount_DEC
FROM bank_loan_data
WHERE issue_date >= '2025-12-01'
AND issue_date < '2026-01-01';

--Total funded Amount in November
SELECT sum(loan_amount) AS Total_Funded_Amount_NOV
FROM bank_loan_data
WHERE issue_date >= '2025-11-01'
AND issue_date < '2026-12-01';

--Total Amount Received
SELECT sum(cast(total_payment AS DECIMAL(18,2))) AS Total_Amount_Received
FROM bank_loan_data;

SELECT 
    Year(issue_date) AS Year,
    Month(issue_date) AS Month,
    sum(cast(loan_amount AS DECIMAL(18,2))) AS Received_Amount
FROM bank_loan_data
GROUP BY Year(issue_date), Month(issue_date)
ORDER BY Year, Month;

--Amount Received In December
SELECT sum(cast(total_payment AS DECIMAL(18,2))) AS Amount_Received_DEC
FROM bank_loan_data
WHERE issue_date >= '2025-12-01'
AND issue_date < '2026-01-01';


--Amount Received In November
SELECT sum(cast(total_payment AS DECIMAL(18,2))) AS Amount_Received_DEC
FROM bank_loan_data
WHERE issue_date >= '2025-11-01'
AND issue_date < '2026-12-01';



-- Average Interest Rate
SELECT avg(Interest_Rate)*100 AS Average_Interest_Rate
FROM bank_loan_data


--Average DTI
SELECT avg(dti)*100 AS Average_DTI
FROM bank_loan_data;




--Good Loan Percentage
SELECT (count(case when loan_status = 'Fully Paid' then id end)*100)/count(id) AS Good_Loan_Application_Percentage
FROM bank_loan_data
     
--Good Loan Applications
SELECT count(id)
FROM bank_loan_data
WHERE Loan_Status = 'Fully paid' OR Loan_Status= 'Current'

--Good Loan Funded Amount
SELECT sum(cast(loan_amount AS DECIMAL(18,2))) AS Goodloan_Funded_Amount
FROM bank_loan_data
WHERE Loan_Status = 'Fully paid' OR Loan_Status= 'Current'


--Good Loan Received Amount
SELECT sum(cast(Total_Payment AS DECIMAL(18,2))) AS Goodloan_Received_Amount
FROM bank_loan_data
WHERE Loan_Status = 'Fully paid' OR Loan_Status= 'Current'




--Bad Loan Application Percentage
SELECT (count(case when loan_status = 'Charged Off' then id end)*100)/count(id) AS Badloan_Application_Percentage
FROM bank_loan_data
WHERE Loan_Status= 'Charged Off'

--Bad Loan Application Percentage
SELECT count(id) FROM bank_loan_data where Loan_Status='Charged Off'

--Bad Loan Funded Amount
SELECT sum(cast(loan_amount AS DECIMAL(18,2))) AS Badloan_Funded_Amount
FROM bank_loan_data
WHERE Loan_Status = 'Charged Off'


--Bad Loan Received Amount
SELECT sum(cast(Total_Payment AS DECIMAL(18,2))) AS Badloan_Received_Amount
FROM bank_loan_data
WHERE Loan_Status = 'Charged Off'



--Loan Status
SELECT loan_status,
      count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
GROUP BY loan_status

SELECT month(issue_date) AS Month,
      datename(month,issue_date) AS Month_Name,
      count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
GROUP BY month(issue_date),datename(month,issue_date)
ORDER BY month(issue_date)

SELECT loan_status,
      count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
WHERE issue_date >= '2025-12-01' AND issue_date < '2026-01-01'
GROUP BY loan_status

 --State Overview
SELECT Address_State,
      count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
GROUP BY Address_State
ORDER BY sum(Loan_Amount) DESC;



--Term Overview
SELECT term AS Term, 
	  count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
GROUP BY term
ORDER BY term;


-- employment_length Overview
SELECT employment_length AS Employee_Length, 
	  count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
GROUP BY employment_length
ORDER BY employment_length;

-- Purpose Overview
SELECT purpose AS PURPOSE
      count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
GROUP BY PURPOSE
ORDER BY PURPOSE;
	  


-- Home Ownership Overview
SELECT home_ownership AS Home_Ownership, 
	  count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;


-- Grade A Overview
SELECT purpose AS PURPOSE, 
	   count(id) AS Total_Applications,
      sum(cast(Loan_Amount AS DECIMAL(18,2))) AS Total_Funded_Amount,
      sum(cast(Total_Payment AS DECIMAL(18,2)))AS Total_Received_Amount,
      avg(Interest_Rate)*100 AS Average_Interest_Rate,
      avg(dti)*100 AS Average_DTI
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;

