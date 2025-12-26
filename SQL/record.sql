-- =============================================
-- Stored Procedure: InsertAttendanceRecord
-- Accepts JSON input and inserts into Employees + Attendance
-- =============================================
IF OBJECT_ID('dbo.InsertAttendanceRecord', 'P') IS NOT NULL
    DROP PROCEDURE dbo.InsertAttendanceRecord;
GO

CREATE PROCEDURE InsertAttendanceRecord
    @AttendanceJSON NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Extract Employee Info from JSON
    DECLARE @FirstName NVARCHAR(50) = JSON_VALUE(@AttendanceJSON, '$.FirstName');
    DECLARE @LastName NVARCHAR(50) = JSON_VALUE(@AttendanceJSON, '$.LastName');
    DECLARE @Email NVARCHAR(100) = JSON_VALUE(@AttendanceJSON, '$.Email');
    DECLARE @Department NVARCHAR(50) = JSON_VALUE(@AttendanceJSON, '$.Department');

    -- Extract Attendance Info
    DECLARE @AttendanceDate DATE = JSON_VALUE(@AttendanceJSON, '$.AttendanceDate');
    DECLARE @Status NVARCHAR(20) = JSON_VALUE(@AttendanceJSON, '$.Status');
    DECLARE @Remarks NVARCHAR(200) = JSON_VALUE(@AttendanceJSON, '$.Remarks');

    -- Check if Employee exists by Email
    DECLARE @EmployeeID INT;
    SELECT @EmployeeID = EmployeeID FROM Employees WHERE Email = @Email;

    -- If not exists, insert new employee
    IF @EmployeeID IS NULL
    BEGIN
        INSERT INTO Employees (FirstName, LastName, Email, Department)
        VALUES (@FirstName, @LastName, @Email, @Department);

        SET @EmployeeID = SCOPE_IDENTITY();
    END

    -- Insert Attendance Record
    INSERT INTO Attendance (EmployeeID, AttendanceDate, Status, Remarks)
    VALUES (@EmployeeID, @AttendanceDate, @Status, @Remarks);

    -- Return inserted AttendanceID
    SELECT SCOPE_IDENTITY() AS AttendanceID;
END;
GO

DECLARE @json NVARCHAR(MAX);

-- Read JSON content directly
SET @json = '{
    "FirstName": "Sambika",
    "LastName": "Gurung",
    "Email": "sambika@example.com",
    "Department": "IT",
    "AttendanceDate": "2025-12-26",
    "Status": "Present",
    "Remarks": "On time"
}';

EXEC InsertAttendanceRecord @AttendanceJSON = @json;

