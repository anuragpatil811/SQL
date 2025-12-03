-- Fact Tables
CREATE TABLE Fact_Visits (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    DepartmentID INT,
    VisitDate DATE,
    Diagnosis VARCHAR(255),
    TreatmentCost DECIMAL(10, 2)
);

CREATE TABLE Fact_Medications (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    MedicationID INT,
    PrescriptionDate DATE,
    Dosage VARCHAR(50),
    MedicationCost DECIMAL(10, 2)
);

-- Dimension Tables
CREATE TABLE Dim_Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Gender CHAR(1),
    Age INT,
    AddressID INT
);

CREATE TABLE Dim_Address (
    AddressID INT PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    PostalCode VARCHAR(20)
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
    HospitalID INT
);

CREATE TABLE Dim_Hospitals (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Dim_Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(100),
    Manufacturer VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE Dim_Time (
    Date DATE PRIMARY KEY,
    Day INT,
    Month INT,
    Year INT,
    Quarter VARCHAR(10)
);
-- Insert data into Dim_Address
INSERT INTO Dim_Address VALUES (1, 'New York', 'NY', 'USA', '10001');
INSERT INTO Dim_Address VALUES (2, 'Los Angeles', 'CA', 'USA', '90001');

-- Insert data into Dim_Patients
INSERT INTO Dim_Patients VALUES (1, 'John Doe', 'M', 30, 1);
INSERT INTO Dim_Patients VALUES (2, 'Jane Smith', 'F', 25, 2);

-- Insert data into Dim_Hospitals
INSERT INTO Dim_Hospitals VALUES (1, 'City Hospital', 'Downtown');
INSERT INTO Dim_Hospitals VALUES (2, 'General Hospital', 'Uptown');

-- Insert data into Dim_Departments
INSERT INTO Dim_Departments VALUES (1, 'Cardiology', 1);
INSERT INTO Dim_Departments VALUES (2, 'Neurology', 2);

-- Insert data into Dim_Doctors
INSERT INTO Dim_Doctors VALUES (1, 'Dr. Brown', 'Cardiologist', 1);
INSERT INTO Dim_Doctors VALUES (2, 'Dr. Green', 'Neurologist', 2);

-- Insert data into Dim_Medications
INSERT INTO Dim_Medications VALUES (1, 'Aspirin', 'PharmaCorp', 'Pain Relief');
INSERT INTO Dim_Medications VALUES (2, 'Metformin', 'HealthPharm', 'Diabetes');

-- Insert data into Dim_Time
INSERT INTO Dim_Time VALUES ('2024-11-01', 1, 11, 2024, 'Q4');
INSERT INTO Dim_Time VALUES ('2024-11-02', 2, 11, 2024, 'Q4');

-- Insert data into Fact_Visits
INSERT INTO Fact_Visits VALUES (1, 1, 1, 1, '2024-11-01', 'Chest Pain', 500.00);
INSERT INTO Fact_Visits VALUES (2, 2, 2, 2, '2024-11-02', 'Headache', 300.00);

-- Insert data into Fact_Medications
INSERT INTO Fact_Medications VALUES (1, 1, 1, 1, '2024-11-01', '50mg', 10.00);
INSERT INTO Fact_Medications VALUES (2, 2, 2, 2, '2024-11-02', '500mg', 20.00);

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

ALTER TABLE Dim_Departments
ADD FOREIGN KEY (HospitalID) REFERENCES Dim_Hospitals(HospitalID);
