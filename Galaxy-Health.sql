-- Fact Tables
CREATE TABLE Fact_Visits (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    DepartmentID INT,
    VisitDate DATE,
    Diagnosis VARCHAR(255),
    TreatmentCost DECIMAL(15, 2)
);

CREATE TABLE Fact_Medications (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    MedicationID INT,
    PrescriptionDate DATE,
    Dosage VARCHAR(50),
    MedicationCost DECIMAL(15, 2)
);

-- Dimension Tables
CREATE TABLE Dim_Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Gender CHAR(1),
    Age INT,
    AddressID INT
);

CREATE TABLE Dim_Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    Specialty VARCHAR(100),
    DepartmentID INT
);

CREATE TABLE Dim_Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    HospitalWing VARCHAR(50)
);

CREATE TABLE Dim_Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(100),
    Manufacturer VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE Dim_Address (
    AddressID INT PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    PostalCode VARCHAR(20)
);

CREATE TABLE Dim_Time (
    Date DATE PRIMARY KEY,
    Day INT,
    Month INT,
    Year INT,
    Quarter VARCHAR(10)
);

-- Relationships
ALTER TABLE Fact_Visits
ADD FOREIGN KEY (PatientID) REFERENCES Dim_Patients(PatientID);

ALTER TABLE Fact_Visits
ADD FOREIGN KEY (DoctorID) REFERENCES Dim_Doctors(DoctorID);

ALTER TABLE Fact_Visits
ADD FOREIGN KEY (DepartmentID) REFERENCES Dim_Departments(DepartmentID);

ALTER TABLE Fact_Visits
ADD FOREIGN KEY (VisitDate) REFERENCES Dim_Time(Date);

ALTER TABLE Fact_Medications
ADD FOREIGN KEY (PatientID) REFERENCES Dim_Patients(PatientID);

ALTER TABLE Fact_Medications
ADD FOREIGN KEY (DoctorID) REFERENCES Dim_Doctors(DoctorID);

ALTER TABLE Fact_Medications
ADD FOREIGN KEY (MedicationID) REFERENCES Dim_Medications(MedicationID);

ALTER TABLE Fact_Medications
ADD FOREIGN KEY (PrescriptionDate) REFERENCES Dim_Time(Date);

ALTER TABLE Dim_Patients
ADD FOREIGN KEY (AddressID) REFERENCES Dim_Address(AddressID);

ALTER TABLE Dim_Doctors
ADD FOREIGN KEY (DepartmentID) REFERENCES Dim_Departments(DepartmentID);
