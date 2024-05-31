CREATE INDEX idx_students_lastname ON Students(LastName);

CREATE INDEX idx_teachers_fullname ON Teachers(FirstName, LastName);

CREATE INDEX idx_students_address_prefix ON Students(Address(10));