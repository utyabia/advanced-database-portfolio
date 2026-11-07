-- =============================================================================
-- PORTFOLIO 3: TRANSACTIONS AND CONCURRENCY CONTROL
-- =============================================================================

-- -----------------------------------------------------------------------------
-- SCENARIO 1: SUCCESSFUL TRANSACTION WITH COMMIT
-- Atomically books an appointment and creates an initial lab test request.
-- -----------------------------------------------------------------------------
BEGIN TRANSACTION;

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status, Reason)
VALUES (3, 1, '2026-11-20 14:00:00', 'Scheduled', 'Cardiovascular Screening');

-- Capture the newly created AppointmentID (assuming ID 5 in sequence)
INSERT INTO LaboratoryRecords (PatientID, DoctorID, TestType, Result, DateConducted)
VALUES (3, 1, 'Electrocardiogram (ECG)', 'Pending Analysis', '2026-11-20');

-- Save all changes permanently
COMMIT;


-- -----------------------------------------------------------------------------
-- SCENARIO 2: TRANSACTION ROLLBACK ON FAILURE
-- Demonstrates Atomicity: If part of the operation fails, all steps undo.
-- -----------------------------------------------------------------------------
BEGIN TRANSACTION;

-- Step 1: Update appointment status to completed
UPDATE Appointments 
SET Status = 'Completed' 
WHERE AppointmentID = 1;

-- Step 2: Attempting an invalid entry (Simulating a system error/integrity failure)
-- Intentionally referencing a non-existent AppointmentID (e.g., 99999)
INSERT INTO Prescriptions (AppointmentID, MedicationName, Dosage, Instructions)
VALUES (99999, 'Lisinopril', '10mg', 'Daily in the morning');

-- If an error occurs, undo all uncommitted changes to maintain system consistency
ROLLBACK;


-- -----------------------------------------------------------------------------
-- SCENARIO 3: CONCURRENCY CONTROL & ISOLATION LEVEL
-- Explicit row-level locking to prevent double-booking the same doctor.
-- -----------------------------------------------------------------------------
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Lock the target doctor's record for updates to block concurrent bookings
SELECT * FROM Doctors 
WHERE DoctorID = 1 
FOR UPDATE;

-- Safely insert the double-checked appointment slot
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status, Reason)
VALUES (4, 1, '2026-11-20 15:00:00', 'Scheduled', 'Follow-up Consultation');

COMMIT;
