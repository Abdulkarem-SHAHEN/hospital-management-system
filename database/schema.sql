-- Hospital Management System: database schema and demo data (SQL Server)
--
-- Run this script once in SQL Server Management Studio, or with:
--     sqlcmd -S .\SQLEXPRESS -i database\schema.sql
--
-- The script creates the database from scratch. If a database named jrk already
-- exists from an earlier version, drop it first:  DROP DATABASE jrk;
--
-- All names, emails, phone numbers and passwords below are fictional demo data.

CREATE DATABASE jrk;
GO
USE jrk;
GO

-- Session settings required by the computed columns of the accounts table.
-- Management Studio and the application already use them; sqlcmd does not by default.
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;
SET NUMERIC_ROUNDABORT OFF;
GO

-- ===============================================================
-- Tables
-- ===============================================================

CREATE TABLE doctors (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(MAX),
    spec NVARCHAR(MAX),
    full_time BIT
);

CREATE TABLE patients (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(MAX),
    last_name NVARCHAR(MAX),
    age INT CHECK(age >= 0),
    gender CHAR(1) CHECK(gender IN ('m', 'f')),
    email NVARCHAR(MAX) CHECK(email LIKE '%_@__%.__%'),
    phone_number NVARCHAR(20) CHECK(phone_number LIKE '09[0-9]%'),
    image IMAGE
);

-- Top management:  'a' administrator   'h' HR manager
CREATE TABLE topmgmt (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(MAX),
    type CHAR(1) CHECK(type IN ('a', 'h'))
);

-- Staff: three categories, 'e', 'r' and 'n'
CREATE TABLE staff (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(MAX),
    monthly_salary FLOAT CHECK(monthly_salary >= 0),
    type CHAR(1) CHECK(type IN ('e', 'r', 'n')),
    balance FLOAT CHECK(balance >= 0)
);

-- Assets: hospital equipment and rooms
CREATE TABLE assets (
    id INT IDENTITY(1,1) PRIMARY KEY,
    item_name NVARCHAR(255),
    count INT CHECK(count > 0),
    description NVARCHAR(MAX)
);
GO

-- ---------------------------------------------------------------
-- Accounts: one login per user.
--
-- (role, id) points to the row of the user in the table of that role:
--     's' staff   'p' patients   't' topmgmt   'd' doctors
--
-- One column cannot reference four tables, so each role gets a computed
-- column that holds the id only when the account has that role, and a
-- foreign key on it. The database therefore refuses an account whose
-- user does not exist, and deleting a user deletes their account.
--
-- password holds a salted PBKDF2 hash, never the password itself.
-- ---------------------------------------------------------------
CREATE TABLE accounts (
    email NVARCHAR(255) NOT NULL PRIMARY KEY,
    password NVARCHAR(255) NOT NULL,
    id INT NOT NULL,
    role CHAR(1) NOT NULL CHECK(role IN ('s', 'p', 't', 'd')),

    staff_id   AS (CASE WHEN role = 's' THEN id END) PERSISTED,
    patient_id AS (CASE WHEN role = 'p' THEN id END) PERSISTED,
    topmgmt_id AS (CASE WHEN role = 't' THEN id END) PERSISTED,
    doctor_id  AS (CASE WHEN role = 'd' THEN id END) PERSISTED,

    CONSTRAINT UQ_accounts_user UNIQUE (role, id),
    CONSTRAINT FK_accounts_staff   FOREIGN KEY (staff_id)   REFERENCES staff(id)    ON DELETE CASCADE,
    CONSTRAINT FK_accounts_patient FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    CONSTRAINT FK_accounts_topmgmt FOREIGN KEY (topmgmt_id) REFERENCES topmgmt(id)  ON DELETE CASCADE,
    CONSTRAINT FK_accounts_doctor  FOREIGN KEY (doctor_id)  REFERENCES doctors(id)  ON DELETE CASCADE
);
GO

-- ===============================================================
-- Demo data
--
-- The password hashes below were generated with the same algorithm as
-- Security/PasswordHasher.cs. The matching demo passwords are listed in
-- the README. Accounts of the same group share one hash only because
-- this is seed data; the application salts every password separately.
-- ===============================================================

-- 30 doctors built from random combinations of a name, a specialty and a contract type
DECLARE @Names TABLE (name NVARCHAR(MAX));
INSERT INTO @Names (name) VALUES
('John'), ('Alice'), ('Bob'), ('Emily'), ('David'), ('Sophia'), ('Michael'), ('Olivia'), ('Daniel'), ('Emma'),
('Christopher'), ('Ava'), ('Matthew'), ('Mia'), ('Andrew'), ('Isabella'), ('Joshua'), ('Abigail'), ('Ethan'), ('Madison'),
('Nathan'), ('Chloe'), ('Ryan'), ('Ella'), ('Samuel'), ('Grace'), ('Alexander'), ('Sofia'), ('William'), ('Lily');

DECLARE @Specs TABLE (spec NVARCHAR(MAX));
INSERT INTO @Specs (spec) VALUES
('gynecologist'), ('pediatrician'), ('general practitioner'), ('anesthesiologist');

DECLARE @FullTime TABLE (full_time BIT);
INSERT INTO @FullTime (full_time) VALUES (1), (0);

INSERT INTO doctors (name, spec, full_time)
SELECT TOP 30
    n.name,
    s.spec,
    ft.full_time
FROM
    @Names n
    CROSS JOIN @Specs s
    CROSS JOIN @FullTime ft
ORDER BY NEWID();
GO

-- Accounts for 15 of the doctors, chosen at random
INSERT INTO accounts (email, password, id, role)
SELECT
    'randomemail' + CAST(id AS NVARCHAR(10)) + '@example.com' AS email,
    'PBKDF2$100000$oeNiecMQ33Oc0/IcjXRsAw==$glWWeXzoq79m/c4s62v7Vnyvx5jUtc6MFNAoSWmSx60=' AS password,
    id,
    'd' AS role
FROM
    doctors
ORDER BY
    NEWID()
OFFSET 0 ROWS FETCH FIRST 15 ROWS ONLY;
GO

INSERT INTO patients (first_name, last_name, age, gender, email, phone_number)
VALUES
    ('Adam', 'Haddad', 25, 'm', 'adam.haddad@example.com', '0900000001'),
    ('Omar', 'Nasser', 30, 'm', 'omar.nasser@example.com', '0900000002'),
    ('Sami', 'Khoury', 22, 'm', 'sami.khoury@example.com', '0900000003'),
    ('Lina', 'Saleh', 28, 'f', 'lina.saleh@example.com', '0900000004'),
    ('Maya', 'Aziz', 35, 'f', 'maya.aziz@example.com', '0900000005');

INSERT INTO accounts (email, password, id, role)
SELECT
    email,
    'PBKDF2$100000$sCQfOAju1stJd1WDp/d5Jw==$+88JKYDLn4VxbfvnxnxUf5d3TssDjldwl5fjTfk4LDk=' AS password,
    id,
    'p' AS role
FROM
    patients;
GO

INSERT INTO topmgmt (name, type)
VALUES
    ('Kareem', 'a'),
    ('Jalal', 'h'),
    ('Rama', 'h');

INSERT INTO accounts (email, password, id, role)
SELECT
    name + '@topmgmt.com' AS email,
    CASE
        WHEN type = 'a' THEN 'PBKDF2$100000$X3B5dVE9edLCK4k6SeYfhA==$zzQX+5Sv9UL8w28rJCjH5w1MHE3/GG1TJw1zhncNQ2U='
        WHEN type = 'h' THEN 'PBKDF2$100000$U7wWSWBJvvNuljhbtHplZw==$8ssnjoVNRbNU08x+eOX85Dr/gJDinltRy89F+UbU+yQ='
    END AS password,
    id,
    't' AS role
FROM
    topmgmt;
GO

INSERT INTO assets (item_name, count, description)
VALUES
    ('patient bed', 40, 'A patient bed is a specialized bed designed for hospitalized patients or others in need of some form of health care.'),
    ('nursing room', 6, 'A nursing room is a dedicated space for providing medical care and support to patients.'),
    ('electrocardiography device', 4, 'An electrocardiography device is a medical device used to record the electrical activity of the heart over a period of time.'),
    ('electrical radiography device', 3, 'An electrical radiography device is a medical imaging device that uses X-rays to produce images of the inside of a patient'),
    ('recovery tool', 10, 'A recovery tool is a piece of equipment or device used in the rehabilitation and recovery process for patients undergoing medical treatment or surgery.');
GO

INSERT INTO staff (name, monthly_salary, type, balance)
VALUES
    ('Adam', ROUND(RAND() * 400 + 100, 2), 'e', ROUND(RAND() * 1000, 2)),
    ('John', ROUND(RAND() * 400 + 100, 2), 'r', ROUND(RAND() * 1000, 2)),
    ('Sam', ROUND(RAND() * 400 + 100, 2), 'n', ROUND(RAND() * 1000, 2)),
    ('Emily', ROUND(RAND() * 400 + 100, 2), 'e', ROUND(RAND() * 1000, 2)),
    ('Michael', ROUND(RAND() * 400 + 100, 2), 'r', ROUND(RAND() * 1000, 2)),
    ('Jessica', ROUND(RAND() * 400 + 100, 2), 'n', ROUND(RAND() * 1000, 2)),
    ('Daniel', ROUND(RAND() * 400 + 100, 2), 'e', ROUND(RAND() * 1000, 2)),
    ('Sophia', ROUND(RAND() * 400 + 100, 2), 'r', ROUND(RAND() * 1000, 2)),
    ('William', ROUND(RAND() * 400 + 100, 2), 'n', ROUND(RAND() * 1000, 2)),
    ('Olivia', ROUND(RAND() * 400 + 100, 2), 'e', ROUND(RAND() * 1000, 2)),
    ('James', ROUND(RAND() * 400 + 100, 2), 'r', ROUND(RAND() * 1000, 2)),
    ('Ava', ROUND(RAND() * 400 + 100, 2), 'n', ROUND(RAND() * 1000, 2)),
    ('Benjamin', ROUND(RAND() * 400 + 100, 2), 'e', ROUND(RAND() * 1000, 2)),
    ('Emma', ROUND(RAND() * 400 + 100, 2), 'r', ROUND(RAND() * 1000, 2)),
    ('Liam', ROUND(RAND() * 400 + 100, 2), 'n', ROUND(RAND() * 1000, 2));

-- Only staff of category 'r' get a login
INSERT INTO accounts (email, password, id, role)
SELECT
    name + '@staff.com' AS email,
    'PBKDF2$100000$0J0yIgHZmeCXOkhPjOqGgA==$mp0VUURnexdeSYfQ1sovDkD1Jcb7hsAHo5lFxr5m2UY=' AS password,
    id,
    's' AS role
FROM
    staff
WHERE
    type = 'r';
GO
