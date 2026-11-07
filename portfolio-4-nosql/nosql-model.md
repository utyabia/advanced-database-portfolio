# Portfolio 4: NoSQL and Advanced Data Models Evaluation

## 1. Document Model vs. Relational Model
For this clinic scenario, a **Document Data Model (JSON / MongoDB format)** was selected to complement the relational SQL schema.

* **Relational Approach:** Requires joining five distinct tables (`Patients`, `Doctors`, `Appointments`, `Prescriptions`, `LaboratoryRecords`) to render a patient's medical history.
* **Document Approach:** Denormalizes data by embedding medical history, appointments, prescriptions, and laboratory records directly within a single patient document.

## 2. Suitability & Justification
1. **High Read Performance:** Retrieving a patient's entire medical chart requires a single primary key fetch by `_id` (`PAT-2026-001`), eliminating expensive multi-table `JOIN` operations across millions of rows.
2. **Schema Flexibility:** Clinical data varies significantly per patient. A general checkup document requires minimal fields, whereas a complex surgical patient can store nested arrays of medications and lab tests without altering the database schema for other records.
3. **Horizontal Scalability:** Document databases easily shard across clusters using the patient ID as a shard key, supporting massive scale across regional hospital networks.
