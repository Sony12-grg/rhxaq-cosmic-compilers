-- =============================================
-- Attendance Tracker Schema
-- =============================================

-- Drop tables if exist
IF OBJECT_ID('dbo.Attendance', 'U') IS NOT NULL DROP TABLE dbo.Attendance;
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees;

-- =============================================
-- Employees Table
-- =============================================
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Department NVARCHAR(50),
    JoinDate DATE DEFAULT GETDATE()
);

-- =============================================
-- Attendance Table
-- =============================================
CREATE TABLE Attendance (
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    AttendanceDate DATE,
    Status NVARCHAR(20),           -- Present, Absent, Leave
    Remarks NVARCHAR(200),
    CreatedAt DATETIME DEFAULT GETDATE()
);
