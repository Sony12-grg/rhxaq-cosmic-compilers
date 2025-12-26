Attendance Tracker Subsystem

Tracks employee attendance in a database. Employees are stored in the Employees table, and their daily attendance is stored in the Attendance table. Attendance is recorded using a JSON input passed to the stored procedure InsertAttendanceRecord.

Rules:

Each employee must have a unique email.

Attendance is recorded per employee per date.

Status can be Present, Absent, or Leave.

How to Test:

Run AttendanceSchema.sql → creates tables.

Run InsertAttendanceRecord.sql → creates the stored procedure.

Run SampleAttendanceInsert.sql → inserts sample data and shows output in VS Code.


#IMPORTANT
-sql is the actual final commit.
-We mistakely selected all the file as 
final commit instead of one single file.  
