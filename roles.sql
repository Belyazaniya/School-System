CREATE ROLE dbAdmin;
GRANT ALL PRIVILEGES ON school TO dbAdmin;

CREATE ROLE tableManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Students TO tableManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Teachers TO tableManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Classes TO tableManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Subjects TO tableManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Enrollments TO tableManager;

CREATE ROLE columnReader;
GRANT SELECT (FirstName, LastName) ON Students TO columnReader;
GRANT SELECT (FirstName, LastName) ON Teachers TO columnReader;

CREATE USER dbAdmin IDENTIFIED BY 'password1';
GRANT dbAdmin TO dbAdmin;

CREATE USER user2 IDENTIFIED BY 'password2';
GRANT tableManager TO tableManager;

CREATE USER user3 IDENTIFIED BY 'password3';
GRANT columnReader TO columnReader;