START TRANSACTION;

INSERT INTO Teachers (TeacherID, FirstName, LastName, SubjectSpecialization)
VALUES (101, 'Alice', 'Smith', 'Mathematics');

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Address, MentorTeacherID)
VALUES (1, 'John', 'Doe', '2005-05-15', 'M', '123 Main St', 101);

INSERT INTO Classes (ClassID, ClassName, TeacherID)
VALUES (201, 'Math 101', 101);

INSERT INTO Subjects (SubjectID, SubjectName, TeacherID)
VALUES (301, 'Algebra', 101);

INSERT INTO Enrollments (EnrollmentID, StudentID, ClassID, SubjectID)
VALUES (1, 1, 201, 301);

COMMIT;