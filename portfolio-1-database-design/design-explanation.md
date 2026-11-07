### Database Design and Modelling Explanation

**Keys and Constraints:**
Primary keys (such as `PatientID` and `DoctorID`) uniquely identify each record in their respective tables, while foreign keys (such as `PatientID` in the Appointments table) maintain strict referential integrity. `NOT NULL` constraints are applied to critical fields like patient names, doctor specialties, and test results to prevent incomplete data entry.

**Normalisation:**
This database design follows the Third Normal Form (3NF) to eliminate data redundancy. For example, instead of duplicating a doctor's name, specialty, and contact details inside every single appointment, prescription, or lab record, that information is stored exactly once in the `Doctors` table and linked using the `DoctorID` foreign key.
