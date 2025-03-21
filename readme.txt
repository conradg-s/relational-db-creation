# Precision Dental Care Database Project

## Overview
This repository demonstrates designing, populating, and managing a database for a dental clinic. It covers both relational (SQL) and non-relational (MongoDB) databases.  
> **Note:** The core schema file (`pdc-schema-insert.sql`) is owned by Monash University and is not included in this repository.

## Tasks Summary

### Task 2: Data Insert
- **File:** `T2-pdc-insert.sql`
- **Description:**  
  Loads test data into key tables including:
  - **APPOINTMENT:** 10 entries on four specific dates in September 2024 with parallel and follow-up appointments.
  - **APPOINT_SERV:** 15 entries covering a range of services and fee variations.
  - **APPTSERVICE_ITEM:** 20 entries linking items to service entries.
- **Key Points:**  
  - Data is inserted in one transaction.
  - Primary keys are hardcoded (values below 100).
  - Ensures realistic constraints (e.g., no double-booking).

### Task 3: Data Manipulation
- **File:** `T3-pdc-dm.sql`
- **Description:**  
  Performs several data manipulation operations:
  - **Sequence Creation:** Drops and creates three sequences (for emergency contacts, patients, and appointments) starting at 100 and incrementing by 5.
  - **Appointment Management:** Inserts new appointments for Jonathan Robey’s children, sets up follow-up appointments, reschedules one appointment, and cancels a series of appointments.
- **Key Points:**  
  - All operations are done within proper transactions.
  - Changes are based on provided scenarios.

### Task 4: SQL Queries
- **File:** `T4-pdc-queries.sql`
- **Description:**  
  Contains six SQL queries that:
  1. List providers specialising in "PAEDIATRIC DENTISTRY" (sorted by last name, first name, then provider code).
  2. Display services with standard fees above the overall average, formatted as currency.
  3. Show details for the most expensive appointments, including total cost.
  4. Calculate the "Service Fee Differential" for services used.
  5. Compute the percentage of follow-up appointments for each patient.
  6. Summarise, per provider, the number of appointments, total fees, and total item quantities used between specific dates.
- **Key Points:**  
  - Test data ensures output for all queries.
  - Output formatting follows the assignment specifications.

### Task 5: Design Modifications
- **File:** `T5-pdc-mods.sql`
- **Description:**  
  Implements live database modifications:
  - **Patient Appointments Count:** Adds a new column to record the total number of appointments per patient and initializes it.
  - **Multiple Emergency Contacts:** Alters the database structure to allow multiple emergency contacts per patient without data loss.
  - **Nurse Training Logs:** Creates a new table for logging nurse training sessions.
- **Key Points:**  
  - Changes include proper drop statements, column comments, and transaction management.
  - Verification through `SELECT` and `DESC` commands is provided.

### Task 6: Non Relational Database Queries - MongoDB
- **Files:**  
  - `T6a-pdc-json.sql` – Generates a collection of JSON documents from the PDC tables.
  - `T6b-pdc-mongo.mongodb.js` – Contains MongoDB commands.
- **Description:**  
  - **JSON Generation:** Exports appointment documents with provider and item details. Only appointments that used at least one item are included.
  - **MongoDB Operations:**  
    1. Drops any existing collection, creates a new one, and inserts the generated JSON documents.
    2. Lists appointments with more than two items or a total item cost over $50.
    3. Displays and updates an item’s description (changing "Paper tips" to "Paper points"), with verification before and after the change.
    4. Adds three additional items to a selected appointment and verifies the update.
- **Key Points:**  
  - The MongoDB script runs as a single script with one USE statement.
  - No commented-out code remains.

## How to Use

1. **Relational Database Tasks:**  
   - Obtain and run the `pdc-schema-insert.sql` file (from official assignment materials) to set up the schema.
   - Execute the provided SQL scripts (`T2-pdc-insert.sql`, `T3-pdc-dm.sql`, `T4-pdc-queries.sql`, `T5-pdc-mods.sql`) in order to load data, manipulate records, run queries, and apply design modifications.

2. **Non-Relational Database Tasks (MongoDB):**  
   - Run `T6a-pdc-json.sql` to generate the JSON documents.
   - Execute `T6b-pdc-mongo.mongodb.js` in your MongoDB environment to perform the required operations.
