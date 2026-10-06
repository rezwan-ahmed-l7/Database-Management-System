CREATE OR REPLACE PROCEDURE addstudent(
    p_name VARCHAR(50),
    p_dept VARCHAR(50),
    p_dob DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO student(name, dept, dob)
    VALUES (p_name, p_dept, p_dob);
END; 
$$;

CALL addstudent('Ahnaf', 'ICT', '2000-02-14');
CALL addstudent('Badhon', 'BBA', '2006-02-14');
CALL addstudent('Dalim', 'IT', '2004-02-14');
CALL addstudent('Emon', 'CSE', '2002-02-14');


CREATE OR REPLACE PROCEDURE updatestudent(
    p_name VARCHAR(50),
    p_dept VARCHAR(50),
    p_dob DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE student
    SET dob = p_dob
    WHERE name = p_name;
END; 
$$;

CALL updatestudent('Ahnaf', 'ICT', '2010-02-14');
CALL updatestudent('Badhon', 'BBA', '2016-02-14');
CALL updatestudent('Dalim', 'IT', '2014-02-14');
CALL updatestudent('Emon', 'CSE', '2012-02-14');


CREATE OR REPLACE PROCEDURE updatestudentdepartment(
    p_name VARCHAR(50),
    p_dept VARCHAR(50),
    p_dob DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE student
    SET dept = p_dept
    WHERE name = p_name;
END; 
$$;

CALL updatestudentdepartment('Ahnaf', 'CSE', '2000-02-14');
CALL updatestudentdepartment('Badhon', 'AIS', '2006-02-14');
CALL updatestudentdepartment('Dalim', 'ENG', '2004-02-14');
CALL updatestudentdepartment('Emon', 'SE', '2002-02-14');