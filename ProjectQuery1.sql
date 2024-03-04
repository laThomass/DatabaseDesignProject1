{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- This query finds the best-performing portfolio with the highest total value.\
-- It selects the first and last name of the user, as well as the portfolio ID and the total value of each portfolio.\
-- The total value is calculated by summing the total values of properties within each portfolio.\
\
SELECT cu.first_name, cu.last_name,\
       pp.portfolio_id, SUM(pp.total_value) AS total_portfolio_value\
FROM Property_Portfolio pp\
JOIN Client_User cu ON pp.user_id = cu.user_id\
GROUP BY pp.portfolio_id\
ORDER BY total_portfolio_value DESC\
LIMIT 1;\
\
/*\
EXAMPLE Output:\
\
| first_name | last_name | portfolio_id | total_portfolio_value |\
|------------|-----------|--------------|-----------------------|\
| Bronny     | Kensit    | 790          | 99,975,511,172        |\
*/\
}