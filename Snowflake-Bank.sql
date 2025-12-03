-- Fact Table
CREATE TABLE Fact_Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    TransactionDate DATE,
    TransactionType VARCHAR(50),
    TransactionAmount DECIMAL(15, 2)
);

CREATE TABLE Fact_Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    LoanAmount DECIMAL(15, 2),
    InterestRate DECIMAL(5, 2),
    LoanTenure INT,
    StartDate DATE,
    EndDate DATE
);

-- Dimension Tables
CREATE TABLE Dim_Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
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

CREATE TABLE Dim_Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    RegionID INT
);

CREATE TABLE Dim_Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(100)
);

CREATE TABLE Dim_Time (
    Date DATE PRIMARY KEY,
    Day INT,
    Month INT,
    Year INT,
    Quarter VARCHAR(10)
);

-- Relationships
ALTER TABLE Fact_Transactions
ADD FOREIGN KEY (CustomerID) REFERENCES Dim_Customers(CustomerID);

ALTER TABLE Fact_Transactions
ADD FOREIGN KEY (BranchID) REFERENCES Dim_Branches(BranchID);

ALTER TABLE Fact_Transactions
ADD FOREIGN KEY (TransactionDate) REFERENCES Dim_Time(Date);

ALTER TABLE Fact_Loans
ADD FOREIGN KEY (CustomerID) REFERENCES Dim_Customers(CustomerID);

ALTER TABLE Fact_Loans
ADD FOREIGN KEY (BranchID) REFERENCES Dim_Branches(BranchID);

ALTER TABLE Dim_Customers
ADD FOREIGN KEY (AddressID) REFERENCES Dim_Address(AddressID);

ALTER TABLE Dim_Branches
ADD FOREIGN KEY (RegionID) REFERENCES Dim_Regions(RegionID);
