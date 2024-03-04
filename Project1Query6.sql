{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- This query selects the lease ID, rent amount, and property address from the Lease and Property tables.\
-- It joins the Lease and Property tables based on the property ID, filtering for leases with a rent amount greater than the average rent amount across all leases.\
-- The results are ordered in ascending order by the rent amount.\
\
SELECT l.lease_id, l.rent_amount, p.address\
FROM Lease l\
JOIN Property p ON l.property_id = p.property_id\
WHERE l.rent_amount > (SELECT AVG(rent_amount) FROM Lease)\
ORDER BY l.rent_amount ASC;\
\
/*\
EXAMPLE Output:\
\
| lease_id | rent_amount | address    |\
|----------|-------------|------------|\
| 123      | 1500        | 123 Main St|\
| 456      | 1800        | 456 Elm St |\
| ...      | ...         | ...        |\
*/\
}