# Portfolio 2: Query Optimisation and Execution Analysis

## 1. Unoptimized Performance Bottlenecks
* **Problem:** Executing multi-table `JOIN` operations across `Patients`, `Appointments`, `Doctors`, `Prescriptions`, and `LaboratoryRecords` without secondary indexes forces full table scans (`SCAN TABLE`).
* **Impact:** As table sizes grow, query performance scales linearly ($O(N)$ complexity), creating severe latency when hospital staff pull patient charts.

## 2. Indexing Strategy & Execution Plan Analysis
To address execution bottlenecks, four targeted indexes were added:
1. **`idx_appointments_patient_date`**: Accelerates filtered lookup of appointments by patient and date.
2. **`idx_appointments_doctor`**: Optimizes doctor schedule aggregations.
3. **`idx_prescriptions_appointment`**: Speeds up prescription joins on foreign keys.
4. **`idx_lab_patient_doctor`**: Optimizes multi-key joins for diagnostic lookups.

## 3. Results & Performance Gains
* **Before Indexing:** `EXPLAIN QUERY PLAN` indicates full `SCAN TABLE Appointments` and `SCAN TABLE LaboratoryRecords`.
* **After Indexing:** `EXPLAIN QUERY PLAN` shifts from full scans to targeted index lookups (`SEARCH TABLE Appointments USING INDEX idx_appointments_patient_date`).
* **Conclusion:** Indexing reduces disk I/O reads and improves search efficiency to logarithmic scale ($O(\log N)$).
