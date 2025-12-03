CREATE DATABASE ass5;
USE ass5;
CREATE TABLE Dim_Patient (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(10),
    Date_Of_Birth DATE,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_Code VARCHAR(10),
    Country VARCHAR(50)
);

CREATE TABLE Dim_Doctor (
    Doctor_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(10),
    Specialty VARCHAR(100),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Dim_Department(Department_ID)
);


CREATE TABLE Dim_Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100),
    Location VARCHAR(100)
);


CREATE TABLE Dim_Treatment (
    Treatment_ID INT PRIMARY KEY,
    Treatment_Name VARCHAR(100),
    Treatment_Type VARCHAR(50)
);


CREATE TABLE Dim_Medication (
    Medication_ID INT PRIMARY KEY,
    Medication_Name VARCHAR(100),
    Medication_Type VARCHAR(50),
    Cost DECIMAL(10, 2)
);


CREATE TABLE Dim_Appointment (
    Appointment_ID INT PRIMARY KEY,
    Appointment_Date DATE,
    Patient_ID INT,
    Doctor_ID INT,
    Department_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Dim_Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Dim_Doctor(Doctor_ID),
    FOREIGN KEY (Department_ID) REFERENCES Dim_Department(Department_ID)
);

CREATE TABLE Fact_Patient_Treatment (
    Treatment_Fact_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Department_ID INT,
    Treatment_ID INT,
    Medication_ID INT,
    Appointment_ID INT,
    Treatment_Date DATE,
    Cost DECIMAL(10, 2),
    Treatment_Result VARCHAR(100),
    FOREIGN KEY (Patient_ID) REFERENCES Dim_Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Dim_Doctor(Doctor_ID),
    FOREIGN KEY (Department_ID) REFERENCES Dim_Department(Department_ID),
    FOREIGN KEY (Treatment_ID) REFERENCES Dim_Treatment(Treatment_ID),
    FOREIGN KEY (Medication_ID) REFERENCES Dim_Medication(Medication_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Dim_Appointment(Appointment_ID)
);

INSERT INTO Dim_Patient (Patient_ID, First_Name, Last_Name, Gender, Date_Of_Birth, Address, City, State, Zip_Code, Country)
VALUES
(1, 'John', 'Doe', 'Male', '1980-05-15', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'Female', '1992-03-22', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Bob', 'Johnson', 'Male', '1978-11-03', '789 Maple St', 'Chicago', 'IL', '60601', 'USA'),
(4, 'Alice', 'Davis', 'Female', '1985-07-19', '101 Pine St', 'Houston', 'TX', '77001', 'USA'),
(5, 'Tom', 'Brown', 'Male', '1990-09-10', '202 Cedar St', 'Phoenix', 'AZ', '85001', 'USA'),
(6, 'Emily', 'Wilson', 'Female', '1975-12-30', '303 Birch St', 'Miami', 'FL', '33101', 'USA');



INSERT INTO Dim_Doctor (Doctor_ID, First_Name, Last_Name, Gender, Specialty, Department_ID)
VALUES
(1, 'Michael', 'Clark', 'Male', 'Cardiology', 1),
(2, 'Sarah', 'Miller', 'Female', 'Neurology', 2),
(3, 'David', 'Taylor', 'Male', 'Orthopedics', 3),
(4, 'Jessica', 'Anderson', 'Female', 'Pediatrics', 4),
(5, 'Robert', 'Moore', 'Male', 'Dermatology', 5),
(6, 'Linda', 'Harris', 'Female', 'Oncology', 6);



-- Insert values into Dim_Department
INSERT INTO Dim_Department (Department_ID, Department_Name, Location)
VALUES
(1, 'Cardiology', 'Building A'),
(2, 'Neurology', 'Building B'),
(3, 'Orthopedics', 'Building C'),
(4, 'Pediatrics', 'Building D'),
(5, 'Dermatology', 'Building E'),
(6, 'Oncology', 'Building F');



INSERT INTO Dim_Treatment (Treatment_ID, Treatment_Name, Treatment_Type)
VALUES
(1, 'Angioplasty', 'Surgical'),
(2, 'Brain Surgery', 'Surgical'),
(3, 'Knee Replacement', 'Surgical'),
(4, 'Vaccination', 'Non-Surgical'),
(5, 'Skin Biopsy', 'Non-Surgical'),
(6, 'Chemotherapy', 'Non-Surgical');


INSERT INTO Dim_Medication (Medication_ID, Medication_Name, Medication_Type, Cost)
VALUES
(1, 'Aspirin', 'Painkiller', 10.00),
(2, 'Amoxicillin', 'Antibiotic', 15.00),
(3, 'Metformin', 'Diabetes Medication', 25.00),
(4, 'Lipitor', 'Cholesterol Medication', 30.00),
(5, 'Advil', 'Painkiller', 8.00),
(6, 'Lisinopril', 'Blood Pressure Medication', 20.00);

INSERT INTO Dim_Appointment (Appointment_ID, Appointment_Date, Patient_ID, Doctor_ID, Department_ID)
VALUES
(1, '2024-01-10', 1, 1, 1),
(2, '2024-01-12', 2, 2, 2),
(3, '2024-01-15', 3, 3, 3),
(4, '2024-01-18', 4, 4, 4),
(5, '2024-01-20', 5, 5, 5),
(6, '2024-01-22', 6, 6, 6);


INSERT INTO Fact_Patient_Treatment (Treatment_Fact_ID, Patient_ID, Doctor_ID, Department_ID, Treatment_ID, Medication_ID, Appointment_ID, Treatment_Date, Cost, Treatment_Result)
VALUES
(1, 1, 1, 1, 1, 1, 1, '2024-01-10', 5000.00, 'Successful'),
(2, 2, 2, 2, 2, 2, 2, '2024-01-12', 12000.00, 'Successful'),
(3, 3, 3, 3, 3, 3, 3, '2024-01-15', 15000.00, 'Unsuccessful'),
(4, 4, 4, 4, 4, 4, 4, '2024-01-18', 200.00, 'Successful'),
(5, 5, 5, 5, 5, 5, 5, '2024-01-20', 300.00, 'Successful'),
(6, 6, 6, 6, 6, 6, 6, '2024-01-22', 8000.00, 'Unsuccessful');

SELECT d.Department_Name, COUNT(pt.Patient_ID) AS Number_Of_Patients
FROM Fact_Patient_Treatment pt
JOIN Dim_Department d ON pt.Department_ID = d.Department_ID
GROUP BY d.Department_Name;


SELECT doc.First_Name, doc.Last_Name, tr.Treatment_Name, 
       SUM(CASE WHEN pt.Treatment_Result = 'Successful' THEN 1 ELSE 0 END) AS Successful_Treatments,
       COUNT(pt.Treatment_ID) AS Total_Treatments,
       (SUM(CASE WHEN pt.Treatment_Result = 'Successful' THEN 1 ELSE 0 END) / COUNT(pt.Treatment_ID)) * 100 AS Success_Rate
FROM Fact_Patient_Treatment pt
JOIN Dim_Doctor doc ON pt.Doctor_ID = doc.Doctor_ID
JOIN Dim_Treatment tr ON pt.Treatment_ID = tr.Treatment_ID
GROUP BY doc.First_Name, doc.Last_Name, tr.Treatment_Name;


SELECT p.First_Name, p.Last_Name, d.Department_Name, SUM(pt.Cost) AS Total_Cost
FROM Fact_Patient_Treatment pt
JOIN Dim_Patient p ON pt.Patient_ID = p.Patient_ID
JOIN Dim_Department d ON pt.Department_ID = d.Department_ID
GROUP BY p.First_Name, p.Last_Name, d.Department_Name;

SELECT d.Department_Name, doc.First_Name, doc.Last_Name, COUNT(a.Appointment_ID) AS Number_Of_Appointments
FROM Dim_Appointment a
JOIN Dim_Doctor doc ON a.Doctor_ID = doc.Doctor_ID
JOIN Dim_Department d ON a.Department_ID = d.Department_ID
GROUP BY d.Department_Name, doc.First_Name, doc.Last_Name;


SELECT med.Medication_Name, COUNT(pt.Medication_ID) AS Prescription_Count, SUM(med.Cost) AS Total_Cost
FROM Fact_Patient_Treatment pt
JOIN Dim_Medication med ON pt.Medication_ID = med.Medication_ID
GROUP BY med.Medication_Name
ORDER BY Prescription_Count DESC;
