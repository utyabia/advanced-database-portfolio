=============================================================================
MIT 8103 ADVANCED DATABASE SYSTEMS PORTFOLIO
=============================================================================

Student Name:        Utibe-Abasi Abia Udoh
Student ID:          301896180
Matriculation No:    2026/A/MIT/0541
Email Address:       u.udoh96180@miva.edu.ng
Degree Program:      Master of Information Technology (MIT)
Academic Session:    2026/2027 Session - First Semester Continuous Assessment
Course Code:         MIT 8103 (Advanced Database Systems)
Case Study System:   Hospital / Clinic Management System
GitHub Repository:   https://github.com/utyabia/advanced-database-portfolio

=============================================================================
1. PROJECT OVERVIEW
=============================================================================
This repository contains the complete practical execution evidence and technical 
documentation for the MIT 8103 Advanced Database Systems individual portfolio.

The chosen case study is a comprehensive Hospital / Clinic Management System that 
models and manages healthcare operations across five core domains:
  1. Patients: Demographics, medical history, blood groups, and contact records.
  2. Doctors: Clinical specialties, departments, and contact details.
  3. Appointments: Scheduling, status tracking, and doctor consultations.
  4. Prescriptions: Medication names, dosages, and administration instructions.
  5. Laboratory Records: Diagnostic test orders, dates, and clinical results.

=============================================================================
2. REPOSITORY STRUCTURE & PORTFOLIO CONTENTS
=============================================================================
advanced-database-portfolio/
├── portfolio-1-database-design/
│   ├── schema.sql                 -- 3NF Relational DDL script for hospital system
│   ├── design-explanation.md      -- Normalization and schema design documentation
│   └── er-diagram.png             -- Entity-Relationship Diagram visual artifact
├── portfolio-2-query-optimisation/
│   ├── queries-and-optimization.sql-- Complex multi-table JOINs, aggregations & indexes
│   └── performance-analysis.md    -- EXPLAIN QUERY PLAN analysis & profiling report
├── portfolio-3-transactions-concurrency/
│   ├── transactions.sql           -- ACID transaction scripts (COMMIT, ROLLBACK, LOCK)
│   ├── concurrency-explanation.md -- Concurrency control & isolation level evaluation
│   └── transaction-execution.png  -- Execution screenshot evidence from SQLite/VS Code
├── portfolio-4-nosql/
│   ├── hospital-nosql.json        -- Denormalized NoSQL Document model (JSON format)
│   └── nosql-model.md             -- Document vs Relational comparative evaluation
├── portfolio-5-distributed-cloud/
│   └── distributed-architecture.md-- High availability, sharding, and CAP theorem strategy
└── README.md                       -- Portfolio main overview and system instructions

=============================================================================
3. PORTFOLIO BREAKDOWN & SUMMARY OF ACTIVITIES
=============================================================================

PORTFOLIO 1: DATABASE DESIGN AND MODELLING (7 MARKS)
-----------------------------------------------------------------------------
- Created a Third Normal Form (3NF) relational database schema using SQLite/SQL syntax.
- Enforced Primary Keys (SERIAL/AUTOINCREMENT), Foreign Keys (FK), NOT NULL, and UNIQUE 
  referential constraints across Patients, Doctors, Appointments, Prescriptions, and 
  LaboratoryRecords tables.
- Rendered and committed an Entity-Relationship Diagram (`er-diagram.png`).

PORTFOLIO 2: QUERY PROCESSING AND OPTIMISATION (7 MARKS)
-----------------------------------------------------------------------------
- Developed complex multi-table SQL queries joining up to 5 tables for patient charts 
  and aggregate doctor workload reporting.
- Executed `EXPLAIN QUERY PLAN` profiling to detect unindexed table scans (`SCAN TABLE`).
- Applied composite and secondary indexes (`idx_appointments_patient_date`, 
  `idx_appointments_doctor`, `idx_prescriptions_appointment`, `idx_lab_patient_doctor`) 
  to convert full scans into logarithmic index searches (`SEARCH TABLE`).

PORTFOLIO 3: TRANSACTIONS AND CONCURRENCY CONTROL (7 MARKS)
-----------------------------------------------------------------------------
- Wrote ACID-compliant transactional scripts featuring `BEGIN TRANSACTION`, `COMMIT`, 
  and explicit `ROLLBACK` for multi-step clinical workflows (appointment booking + lab ordering).
- Applied `BEGIN IMMEDIATE TRANSACTION` reserved locking to prevent race conditions and 
  double-booking issues during concurrent consultation scheduling.
- Executed scripts locally against `hospital.db` and saved screenshot evidence 
  (`transaction-execution.png`).

PORTFOLIO 4: NOSQL AND ADVANCED DATA MODELS (7 MARKS)
-----------------------------------------------------------------------------
- Formulated a NoSQL document schema (`hospital-nosql.json`) embedding medical history, 
  appointments, prescriptions, and lab results inside a single patient document.
- Conducted a performance and structural comparison between Relational SQL (3NF) and 
  Document NoSQL (MongoDB/JSON format), highlighting single-read chart retrieval benefits.

PORTFOLIO 5: DISTRIBUTED AND CLOUD DATABASE EXERCISE (6 MARKS)
-----------------------------------------------------------------------------
- Architected an AWS RDS Multi-AZ Primary-Replica replication model to guarantee high 
  availability (99.99% uptime) and offload read-heavy analytics to read replicas.
- Evaluated horizontal hash-based sharding by `PatientID` and evaluated CP system trade-offs 
  under the CAP Theorem to guarantee patient data consistency.

=============================================================================
4. SUBMISSION NAMING COMPLIANCE
=============================================================================
This repository and its exported files comply with MIVA Open University naming rules:
  - Root Submission Folder:  Udoh_UtibeAbasi_301896180
  - Zipped Archive File:     Udoh_UtibeAbasi_301896180.zip
  - ReadME Upload File:       Udoh_UtibeAbasi_README.txt
  - Summary Report PDF:      Udoh_UtibeAbasi_SummaryReport.pdf

=============================================================================
5. ACADEMIC INTEGRITY & AI DECLARATION
=============================================================================
Generative AI tools were utilized as an educational partner to assist with syntax 
structuring, markdown formatting, and comparative technical report drafting. All database 
schemas, indexing operations, transaction scripts, NoSQL documents, and cloud architecture 
plans were fully reviewed, verified, and independently executed by Utibe-Abasi Abia Udoh 
within Visual Studio Code and GitHub environments.
=============================================================================
