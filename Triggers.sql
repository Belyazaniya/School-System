
CREATE TRIGGER before_student_insert
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    DECLARE teacher_exists INT;
    SET teacher_exists = (SELECT COUNT(*) FROM Teachers WHERE TeacherID = NEW.MentorTeacherID);

    IF teacher_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'MentorTeacherID does not exist in Teachers table';
    END IF;
END;


CREATE TRIGGER before_enrollment_insert
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    DECLARE enrollment_exists INT;
    SET enrollment_exists = (SELECT COUNT(*) FROM Enrollments WHERE StudentID = NEW.StudentID AND ClassID = NEW.ClassID AND SubjectID = NEW.SubjectID);

    IF enrollment_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student is already enrolled in this class for this subject';
    END IF;
END;


CREATE TRIGGER after_enrollment_insert
AFTER INSERT ON Enrollments
FOR EACH ROW
BEGIN
    UPDATE Students
    SET EnrollmentCount = EnrollmentCount + 1
    WHERE StudentID = NEW.StudentID;
END;


CREATE TRIGGER before_teacher_update
BEFORE UPDATE ON Teachers
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Teachers WHERE TeacherID = NEW.TeacherID AND TeacherID <> OLD.TeacherID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'TeacherID must be unique';
    END IF;
END;



CREATE TRIGGER before_student_update
BEFORE UPDATE ON Students
FOR EACH ROW
BEGIN
    IF NEW.MentorTeacherID IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM Teachers WHERE TeacherID = NEW.MentorTeacherID) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'MentorTeacherID does not exist in Teachers table';
        END IF;
    END IF;
END;





