-- =============================================
-- Sample JSON Insert for Attendance Tracker
-- =============================================
DECLARE @json NVARCHAR(MAX) = '
{
    "FirstName": "Sambika",
    "LastName": "Gurung",
    "Email": "sambika@example.com",
    "Department": "IT",
    "AttendanceDate": "2025-12-26",
    "Status": "Present",
    "Remarks": "On time"
}';

EXEC InsertAttendanceRecord @AttendanceJSON = @json;

-- Check Tables
SELECT * FROM Employees;
SELECT * FROM Attendance;
