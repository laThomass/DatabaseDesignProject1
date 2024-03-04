{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- This query counts the number of tenants with a lease for each property type.\
-- It joins the Property, Property_Type, Lease, Tenant_Lease, and Tenant tables to access information about properties, property types, leases, tenants, and lease-tenant relationships.\
-- The count of distinct tenant IDs is calculated for each property type.\
-- The results are grouped by property type name and ordered in descending order by the number of tenants with a lease.\
-- Ranks property type based on the number of tenants each one has\
\
SELECT pt.name AS property_type,\
       COUNT(DISTINCT lt.tenant_id) AS num_tenants_with_lease\
FROM Property p\
JOIN Property_Type pt ON p.property_type_id = pt.property_type_id\
JOIN Lease l ON p.property_id = l.property_id\
JOIN Tenant_Lease lt ON l.lease_id = lt.lease_id\
JOIN Tenant t ON lt.tenant_id = t.tenant_id\
GROUP BY pt.name\
ORDER BY num_tenants_with_lease DESC;\
\
/*\
EXAMPLE Output:\
\
| property_type | num_tenants_with_lease |\
|---------------|------------------------|\
| Residential_Property   | 295                    |\
| Commercial_Property    | 301                     |\
| Vacant_Land    | 317                     |\
*/\
}