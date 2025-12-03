-- Fact Tables
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
    StartDate DATE
);

-- Dimension Tables
CREATE TABLE Dim_Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Gender CHAR(1),
    Age INT,
    Address VARCHAR(255),
    AccountType VARCHAR(50)
);

CREATE TABLE Dim_Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Location VARCHAR(100),
    ManagerName VARCHAR(100)
);

CREATE TABLE Dim_Time (
    Date DATE PRIMARY KEY,
    DayOfWeek VARCHAR(10),
    Month VARCHAR(20),
    Quarter VARCHAR(20),
    Year INT
);

-- Sample Foreign Key Relationships
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
