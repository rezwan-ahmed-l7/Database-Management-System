CREATE TABLE IF NOT EXISTS student (
    name VARCHAR(50),
    dept VARCHAR(50),
    dob DATE
);

SELECT * FROM student;

SELECT DISTINCT name 
FROM student;

DELETE FROM student 
WHERE name = 'Emon';

DELETE FROM student
WHERE name = 'Emon' AND dob = '2002-02-14';


-- View
CREATE VIEW student_name_dept AS
SELECT name, dept 
FROM student;

SELECT * FROM student_name_dept;

-- Materialized View
CREATE MATERIALIZED VIEW mv_student_name_dept AS
SELECT name, dept 
FROM student;

SELECT * FROM mv_student_name_dept;
REFRESH MATERIALIZED VIEW mv_student_name_dept;