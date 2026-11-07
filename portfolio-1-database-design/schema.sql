-- Patients Table
CREATE TABLE Patients (
    PatientID SERIAL PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactNumber VARCHAR(15),
    BloodGroup VARCHAR(3)
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID SERIAL PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15),
    Department VARCHAR(50)
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID SERIAL PRIMARY KEY,
    PatientID INT REFERENCES Patients(PatientID),
    DoctorID INT REFERENCES Doctors(DoctorID),
    AppointmentDate TIMESTAMP NOT NULL,
    Status VARCHAR(20) DEFAULT 'Scheduled',
    Reason TEXT
);

-- Prescriptions Table
CREATE TABLE Prescriptions (
    PrescriptionID SERIAL PRIMARY KEY,
    AppointmentID INT REFERENCES Appointments(AppointmentID),
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    Instructions TEXT
);

-- Laboratory Records Table
CREATE TABLE LaboratoryRecords (
    LabRecordID SERIAL PRIMARY KEY,
    PatientID INT REFERENCES Patients(PatientID),
    DoctorID INT REFERENCES Doctors(DoctorID),
    TestType VARCHAR(100) NOT NULL,
    Result TEXT NOT NULL,
    DateConducted DATE NOT NULL
);
