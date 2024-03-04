{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Client_User Table\
CREATE TABLE "Client_User" (\
    "user_id" INTEGER PRIMARY KEY,\
    "first_name" TEXT,\
    "last_name" TEXT,\
    "email" TEXT,\
    "last_login" DATE\
);\
-- Attributes:\
-- user_id: INTEGER (Primary Key)\
-- first_name: TEXT\
-- last_name: TEXT\
-- email: TEXT\
-- last_login: DATE\
\
-- Financial_Report Table\
CREATE TABLE "Financial_Report" (\
    "report_id" INTEGER PRIMARY KEY,\
    "report_type_id" INTEGER,\
    "property_id" INTEGER,\
    "portfolio_id" INTEGER,\
    "period_end_date" DATE,\
    "period_start_date" DATE,\
    "expenses" INTEGER,\
    "income" INTEGER,\
    FOREIGN KEY("report_type_id") REFERENCES "Report_Type"("report_type_id"),\
    PRIMARY KEY("report_id")\
);\
-- Attributes:\
-- report_id: INTEGER (Primary Key)\
-- report_type_id: INTEGER (Foreign Key referencing Report_Type(report_type_id))\
-- property_id: INTEGER (Foreign Key referencing Property(property_id))\
-- portfolio_id: INTEGER (Foreign Key referencing Property_Portfolio(portfolio_id))\
-- period_end_date: DATE\
-- period_start_date: DATE\
-- expenses: INTEGER\
-- income: INTEGER\
\
-- Lease Table\
CREATE TABLE "Lease" (\
    "lease_id" INTEGER PRIMARY KEY,\
    "lease_start_date" DATE,\
    "lease_end_date" DATE,\
    "rent_amount" INTEGER,\
    "renewal_date" DATE,\
    "summary" TEXT,\
    "property_id" INTEGER,\
    "portfolio_id" INTEGER,\
    FOREIGN KEY("portfolio_id") REFERENCES "Property_Portfolio"("portfolio_id"),\
    FOREIGN KEY("property_id") REFERENCES "Property"("property_id")\
);\
-- Attributes:\
-- lease_id: INTEGER (Primary Key)\
-- lease_start_date: DATE\
-- lease_end_date: DATE\
-- rent_amount: INTEGER\
-- renewal_date: DATE\
-- summary: TEXT\
-- property_id: INTEGER (Foreign Key referencing Property(property_id))\
-- portfolio_id: INTEGER (Foreign Key referencing Property_Portfolio(portfolio_id))\
\
-- Property Table\
CREATE TABLE "Property" (\
    "property_id" INTEGER PRIMARY KEY,\
    "property_type_id" INTEGER,\
    "portfolio_id" INTEGER,\
    "value" INTEGER,\
    "address" TEXT,\
    "acquisition_date" DATE,\
    "square_footage" INTEGER,\
    FOREIGN KEY("property_type_id") REFERENCES "Property_Type"("property_type_id"),\
    FOREIGN KEY("portfolio_id") REFERENCES "Property_Portfolio"("portfolio_id")\
);\
-- Attributes:\
-- property_id: INTEGER (Primary Key)\
-- property_type_id: INTEGER (Foreign Key referencing Property_Type(property_type_id))\
-- portfolio_id: INTEGER (Foreign Key referencing Property_Portfolio(portfolio_id))\
-- value: INTEGER\
-- address: TEXT\
-- acquisition_date: DATE\
-- square_footage: INTEGER\
\
-- Property_Portfolio Table\
CREATE TABLE "Property_Portfolio" (\
    "portfolio_id" INTEGER PRIMARY KEY,\
    "user_id" INTEGER,\
    "name" TEXT,\
    "total_value" REAL,\
    "status" TEXT,\
    FOREIGN KEY("user_id") REFERENCES "Client_User"("user_id")\
);\
-- Attributes:\
-- portfolio_id: INTEGER (Primary Key)\
-- user_id: INTEGER (Foreign Key referencing Client_User(user_id))\
-- name: TEXT\
-- total_value: REAL\
-- status: TEXT\
\
-- Property_Type Table\
CREATE TABLE "Property_Type" (\
    "property_type_id" INTEGER PRIMARY KEY,\
    "name" TEXT\
);\
-- Attributes:\
-- property_type_id: INTEGER (Primary Key)\
-- name: TEXT\
\
-- Report_Type Table\
CREATE TABLE "Report_Type" (\
    "report_type_id" INTEGER PRIMARY KEY,\
    "name" TEXT\
);\
-- Attributes:\
-- report_type_id: INTEGER (Primary Key)\
-- name: TEXT\
\
-- Tenant Table\
CREATE TABLE "Tenant" (\
    "tenant_id" INTEGER PRIMARY KEY,\
    "first_name" TEXT,\
    "last_name" TEXT,\
    "email" TEXT,\
    "age" INTEGER\
);\
-- Attributes:\
-- tenant_id: INTEGER (Primary Key)\
-- first_name: TEXT\
-- last_name: TEXT\
-- email: TEXT\
-- age: INTEGER\
\
-- Tenant_Lease Table\
CREATE TABLE "Tenant_Lease" (\
    "tenant_id" INTEGER,\
    "lease_id" INTEGER,\
    FOREIGN KEY("tenant_id") REFERENCES "Tenant"("tenant_id"),\
    FOREIGN KEY("lease_id") REFERENCES "Lease"("lease_id")\
);\
-- Attributes:\
-- tenant_id: INTEGER (Foreign Key referencing Tenant(tenant_id))\
-- lease_id: INTEGER (Foreign Key referencing Lease(lease_id))\
\
-- Transaction_Type Table\
CREATE TABLE "Transaction_Type" (\
    "transaction_type_id" INTEGER PRIMARY KEY,\
    "name" TEXT\
);\
-- Attributes:\
-- transaction_type_id: INTEGER (Primary Key)\
-- name: TEXT\
\
-- Transactions Table\
CREATE TABLE "Transactions" (\
    "transaction_id" INTEGER PRIMARY KEY,\
    "transaction_type_id" INTEGER,\
    "user_id" INTEGER,\
    "amount" INTEGER,\
    "transaction_date" DATE,\
    "description" TEXT,\
    "portfolio_id" INTEGER,\
    FOREIGN KEY("transaction_type_id") REFERENCES "Transaction_Type"("transaction_type_id"),\
    FOREIGN KEY("user_id") REFERENCES "Client_User"("user_id"),\
    FOREIGN KEY("portfolio_id") REFERENCES "Property_Portfolio"("portfolio_id")\
);\
-- Attributes:\
-- transaction_id: INTEGER (Primary Key)\
-- transaction_type_id: INTEGER (Foreign Key referencing Transaction_Type(transaction_type_id))\
-- user_id: INTEGER (Foreign Key referencing Client_User(user_id))\
-- amount: INTEGER\
-- transaction_date: DATE\
-- description: TEXT\
-- portfolio_id: INTEGER (Foreign Key referencing Property_Portfolio(portfolio_id))\
}