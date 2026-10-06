CREATE OR REPLACE FUNCTION getage(dob DATE)
RETURNS INT 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN DATE_PART('year', AGE(dob));
END; 
$$;

SELECT name, getage(dob) 
FROM student;


CREATE OR REPLACE FUNCTION getgrade(m INT)
RETURNS CHAR(2) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN CASE
        WHEN m >= 80 THEN 'A+'
        WHEN m >= 60 THEN 'A'
        ELSE 'F'
    END;
END; 
$$;

SELECT id, getgrade(marks) 
FROM result;