-- =============================================================================
-- PORTFOLIO 2: QUERY OPTIMISATION AND EXECUTION ANALYSIS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. UNOPTIMIZED COMPLEX QUERIES (EXPLAIN QUERY PLAN)
-- -----------------------------------------------------------------------------

-- Query 1: Retrieve complete medical history for a patient across all tables
EXPLAIN QUERY PLAN
SELECT 
    p.FullName AS PatientName,
    d.FullName AS DoctorName,
    d.Specialty,
    a.AppointmentDate,
    a.Status,
    pr.MedicationName,
    pr.Dosage,
    l.TestType,
    l.Result
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
LEFT JOIN Prescriptions pr ON a.AppointmentID = pr.AppointmentID
LEFT JOIN LaboratoryRecords l ON p.PatientID = l.PatientID AND d.DoctorID = l.DoctorID
WHERE p.PatientID = 1;

-- Query 2: Aggregate doctor workloads and scheduled appointments
EXPLAIN QUERY PLAN
SELECT 
    d.FullName,
    d.Specialty,
    COUNT(a.AppointmentID) AS TotalAppointments,
    MAX(a.AppointmentDate) AS LastAppointment
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
WHERE a.AppointmentDate >= '2026-01-01'
GROUP BY d.DoctorID, d.FullName, d.Specialty
ORDER BY TotalAppointments DESC;


-- -----------------------------------------------------------------------------
-- 2. INDEX CREATION FOR OPTIMIZATION
-- -----------------------------------------------------------------------------

-- Composite index to speed up patient appointment lookups by date filtering
CREATE INDEX idx_appointments_patient_date 
ON Appointments(PatientID, AppointmentDate);

-- Secondary index to optimize doctor lookup joins
CREATE INDEX idx_appointments_doctor 
ON Appointments(DoctorID);

-- Secondary index to optimize foreign key join on prescriptions
CREATE INDEX idx_prescriptions_appointment 
ON Prescriptions(AppointmentID);

-- Composite index for lab record queries
CREATE INDEX idx_lab_patient_doctor 
ON LaboratoryRecords(PatientID, DoctorID);


-- -----------------------------------------------------------------------------
-- 3. PROFILE QUERIES WITH INDEXES APPLIED
-- -----------------------------------------------------------------------------

EXPLAIN QUERY PLAN
SELECT 
    p.FullName AS PatientName,
    d.FullName AS DoctorName,
    a.AppointmentDate,
    a.Status
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE p.PatientID = 1;
