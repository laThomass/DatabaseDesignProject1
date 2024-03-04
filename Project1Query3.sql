{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- This query calculates the total investment deposit amount for each client user (first name and last name).\
-- It joins the Transactions, Client_User, and Transaction_Type tables to access information about transactions, client users, and transaction types.\
-- Transactions are filtered to include only those with the transaction type 'Investment Deposit'.\
-- The total amount of investment deposits is summed for each client user.\
-- The results are grouped by client user first name and last name, and then ordered in descending order by the total investment deposit amount.\
\
SELECT cu.first_name, cu.last_name,\
       SUM(t.amount) AS total_investment_deposit_amount\
FROM Transactions t\
JOIN Client_User cu ON t.user_id = cu.user_id\
JOIN Transaction_Type tt ON t.transaction_type_id = tt.transaction_type_id\
WHERE tt.name = 'Investment Deposit'\
GROUP BY cu.first_name, cu.last_name\
ORDER BY total_investment_deposit_amount DESC;\
\
/*\
EXAMPLE Output:\
\
| first_name | last_name | total_investment_deposit_amount |\
|------------|-----------|---------------------------------|\
| John       | Smith     | 5000                            |\
| Emily      | Johnson   | 3000                            |\
| ...        | ...       | ...                             |\
*/\
}