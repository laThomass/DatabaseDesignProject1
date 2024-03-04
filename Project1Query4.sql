{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- This query calculates the total income generated by "young adult" tenants (aged between 18 and 35) for each property.\
-- It joins the Tenant, Tenant_Lease, Lease, Property, and Financial_Report tables to access information about tenants, leases, properties, and financial reports.\
-- The income from financial reports is summed for each property, considering only tenants within the specified age range.\
-- The results are grouped by property address and tenant names, and then ordered in descending order by the total income generated by "young adult" tenants.\
\
SELECT p.address AS property_address,\
       t.first_name,\
       t.last_name,\
       SUM(CASE WHEN t.age BETWEEN 18 AND 35 THEN fr.income ELSE 0 END) AS young_adult_income\
FROM Tenant t\
JOIN Tenant_Lease lt ON t.tenant_id = lt.tenant_id\
JOIN Lease l ON lt.lease_id = l.lease_id\
JOIN Property p ON l.property_id = p.property_id\
JOIN Financial_Report fr ON p.property_id = fr.property_id\
GROUP BY p.address, t.first_name, t.last_name\
ORDER BY young_adult_income DESC;\
\
/*\
EXAMPLE Output:\
\
| property_address | first_name | last_name | young_adult_income |\
|------------------|------------|-----------|--------------------|\
| 123 Main St      | John       | Smith     | 5000               |\
| 456 Elm St       | Emily      | Johnson   | 3000               |\
| ...              | ...        | ...       | ...                |\
*/\
}