CREATE VIEW StudentMentorDetails AS
SELECT 
    s.StudentID,
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    t.TeacherID AS MentorTeacherID,
    t.FirstName AS MentorFirstName,
    t.LastName AS MentorLastName,
    t.SubjectSpecialization AS MentorSubjectSpecialization
FROM 
    Students s
JOIN 
    Teachers t ON s.MentorTeacherID = t.TeacherID;

CREATE VIEW ClassTeacherDetails AS
SELECT 
    c.ClassID,
    c.ClassName,
    t.TeacherID,
    t.FirstName AS TeacherFirstName,
    t.LastName AS TeacherLastName,
    t.SubjectSpecialization
FROM 
    Classes c
JOIN 
    Teachers t ON c.TeacherID = t.TeacherID;

CREATE VIEW EnrollmentDetails AS
SELECT 
    e.EnrollmentID,
    s.StudentID,
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName,
    c.ClassID,
    c.ClassName,
    sub.SubjectID,
    sub.SubjectName,
    t.TeacherID AS SubjectTeacherID,
    t.FirstName AS SubjectTeacherFirstName,
    t.LastName AS SubjectTeacherLastName
FROM 
    Enrollments e
JOIN 
    Students s ON e.StudentID = s.StudentID
JOIN 
    Classes c ON e.ClassID = c.ClassID
JOIN 
    Subjects sub ON e.SubjectID = sub.SubjectID
JOIN 
    Teachers t ON sub.TeacherID = t.TeacherID;
