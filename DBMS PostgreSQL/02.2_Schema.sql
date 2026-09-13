CREATE SCHEMA Lab;
CREATE DATABASE library_db;

CREATE TABLE Books(
    Book_ID serial PRIMARY KEY,
    Title text,
    Author text,
    ISBN text UNIQUE,
    Price decimal,
    In_Stock bool DEFAULT 'True',
    Published_Year smallint,
    Added_Date date
);

INSERT INTO Books(Title, Author, ISBN, Price, Published_Year, Added_Date)
VALUES
('Data Structure & Algorithms', 'Rezwan', '1s27', 900, 2005, '2005-03-02'),
('Object Oriented Programming', 'Udoy', '2s38', 570, 2004, '2015-02-05'),
('Theory of Computation', 'Avoy', '1c59', 730, 2006, '2006-04-09'),
('Discrete Math', 'Sacchay', '9r52', 230, 2003, '2005-02-12');

ALTER TABLE Books RENAME COLUMN Title TO Book_Title;

DROP TABLE Books;
SELECT * FROM Books;
