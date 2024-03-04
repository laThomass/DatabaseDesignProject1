{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- This query calculates the average square footage of residential properties with names matching '%Residential_Property%' \
-- by joining the Property and Property_Type tables based on property type IDs. It filters for residential properties \
-- with an average square footage greater than 22000 and groups the results by property address.\
\
SELECT p.address AS property_name, AVG(p.square_footage) AS avg_sq_footage\
FROM Property p\
JOIN Property_Type pt ON p.property_type_id = pt.property_type_id\
WHERE pt.name LIKE '%Residential_Property%'\
GROUP BY p.address\
HAVING AVG(p.square_footage) > 22000;\
\
/*\
EXAMPLE Output:\
\
| property_name | avg_sq_footage |\
|---------------|----------------|\
| 123 Main St   | 25000          |\
| 456 Elm St    | 28000          |\
| ...           | ...            |\
*/\
}