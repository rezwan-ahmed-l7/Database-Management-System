CREATE TABLE University (
    UniversityID INT PRIMARY KEY,
    UniversityName VARCHAR(100),
    City VARCHAR(50),
    Type VARCHAR(30),
    EstablishedYear INT
);
 
INSERT INTO University VALUES
(1, 'Bangladesh University of Engineering and Technology', 'Dhaka', 'Engineering', 1962),
(2, 'University of Dhaka', 'Dhaka', 'General', 1921),
(3, 'Bangladesh Agricultural University', 'Savar', 'Agriculture', 1961),
(4, 'Rajshahi University of Engineering and Technology', 'Dhaka', 'Engineering', 1964),
(5, 'Bangladesh Army University of Science and Technology', 'Dhaka', 'Science & Technology', 2015);
 
 
CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    Location VARCHAR(50),
    Cuisine VARCHAR(50),
    Rating DECIMAL(2,1)
);
 
INSERT INTO Restaurant VALUES
(1, 'Star Kabab', 'Dhaka', 'Bangladeshi', 4.5),
(2, 'Sultan''s Dine', 'Dhaka', 'Kacchi', 4.8),
(3, 'Panshi Restaurant', 'Sylhet', 'Bangladeshi', 4.4),
(4, 'Handi Restaurant', 'Chattogram', 'Indian', 4.3),
(5, 'The Mad Chef', 'Dhaka', 'Fast Food', 4.2);
 
 
CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(120),
    City VARCHAR(50),
    TotalBeds INT,
    Contact VARCHAR(20)
);
 
INSERT INTO Hospital VALUES
(1, 'Dhaka Medical College Hospital', 'Dhaka', 2600, '029665510'),
(2, 'Square Hospital', 'Dhaka', 500, '09610001000'),
(3, 'United Hospital', 'Dhaka', 450, '09666710666'),
(4, 'Chittagong Medical College Hospital', 'Chattogram', 1300, '031630335'),
(5, 'Rajshahi Medical College Hospital', 'Rajshahi', 1000, '0721772500');

 
CREATE TABLE TrainTicket (
    TicketID INT PRIMARY KEY,
    PassengerName VARCHAR(100),
    TrainName VARCHAR(100),
    Source VARCHAR(50),
    Destination VARCHAR(50),
    JourneyDate DATE
);
 
INSERT INTO TrainTicket VALUES
(1, 'Rahim Uddin', 'Subarna Express', 'Dhaka', 'Chattogram', '2026-08-01'),
(2, 'Karim Hasan', 'Sonar Bangla Express', 'Dhaka', 'Chattogram', '2026-08-02'),
(3, 'Nusrat Jahan', 'Ekota Express', 'Dhaka', 'Dinajpur', '2026-08-03'),
(4, 'Sakib Ahmed', 'Parabat Express', 'Dhaka', 'Sylhet', '2026-08-04'),
(5, 'Ayesha Akter', 'Padma Express', 'Dhaka', 'Rajshahi', '2026-08-05');
 
CREATE TABLE Software (
    SoftwareID INT PRIMARY KEY,
    SoftwareName VARCHAR(100),
    Company VARCHAR(100),
    Version VARCHAR(20),
    ReleaseYear INT,
    LicenseType VARCHAR(30),
    Platform VARCHAR(30)
);
 
INSERT INTO Software VALUES
(1, 'Bijoy Bayanno', 'Ananda Computers', '2025', 2025, 'Commercial', 'Windows'),
(2, 'Avro Keyboard', 'OmicronLab', '5.6', 2024, 'Free', 'Windows'),
(3, 'TallyPrime', 'Tally Solutions', '4.1', 2025, 'Commercial', 'Windows'),
(4, 'Visual Studio Code', 'Microsoft', '1.101', 2025, 'Free', 'Cross Platform'),
(5, 'Adobe Photoshop', 'Adobe', '2025', 2025, 'Commercial', 'Windows');
 
 
CREATE TABLE LLM (
    LLMID INT PRIMARY KEY,
    ModelName VARCHAR(100),
    Company VARCHAR(100),
    ReleaseYear INT,
    Parameters VARCHAR(30),
    OpenSource VARCHAR(10),
    SupportsBangla VARCHAR(10),
    MainUse VARCHAR(100)
);
 
INSERT INTO LLM VALUES
(1, 'GPT-5', 'OpenAI', 2025, 'Unknown', 'No', 'Yes', 'General AI Assistant'),
(2, 'Gemini 2.5 Pro', 'Google', 2025, 'Unknown', 'No', 'Yes', 'Multimodal AI'),
(3, 'Claude 4 Opus', 'Anthropic', 2025, 'Unknown', 'No', 'Yes', 'Reasoning'),
(4, 'Llama 4 Scout', 'Meta', 2025, 'Unknown', 'Yes', 'Yes', 'Open AI Model'),
(5, 'DeepSeek V3', 'DeepSeek', 2025, '671B', 'Yes', 'Yes', 'Coding and Chat');
 
 
CREATE TABLE AttendanceSystem (
    AttendanceID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    StudentID VARCHAR(20),
    CourseCode VARCHAR(20),
    AttendanceDate DATE,
    Status VARCHAR(20)
);
 
INSERT INTO AttendanceSystem VALUES
(1, 'Rahim Uddin', '221-15-5001', 'CSE2206', '2026-07-25', 'Present'),
(2, 'Karim Hasan', '221-15-5002', 'CSE2206', '2026-07-25', 'Absent'),
(3, 'Nusrat Jahan', '221-15-5003', 'CSE2206', '2026-07-25', 'Present'),
(4, 'Sakib Ahmed', '221-15-5004', 'CSE2206', '2026-07-25', 'Late'),
(5, 'Ayesha Akter', '221-15-5005', 'CSE2206', '2026-07-25', 'Present');
 
 
CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(120),
    Author VARCHAR(100),
    Category VARCHAR(50),
    Publisher VARCHAR(100),
    AvailableCopies INT
);
 
INSERT INTO Library VALUES
(1, 'Database System Concepts', 'Silberschatz', 'Database', 'McGraw Hill', 6),
(2, 'Computer Networks', 'Andrew Tanenbaum', 'Networking', 'Pearson', 5),
(3, 'Operating System Concepts', 'Silberschatz', 'Operating System', 'Wiley', 4),
(4, 'Introduction to Algorithms', 'Cormen', 'Algorithms', 'MIT Press', 3),
(5, 'Clean Code', 'Robert C. Martin', 'Programming', 'Prentice Hall', 7);
 
 
CREATE TABLE Facebook (
    UserID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    Friends INT,
    Followers INT
);
 
INSERT INTO Facebook VALUES
(1, 'Rahim Uddin', 'rahim@gmail.com', 'Dhaka', 520, 210),
(2, 'Karim Hasan', 'karim@gmail.com', 'Rajshahi', 430, 180),
(3, 'Nusrat Jahan', 'nusrat@gmail.com', 'Sylhet', 680, 420),
(4, 'Sakib Ahmed', 'sakib@gmail.com', 'Khulna', 350, 145),
(5, 'Ayesha Akter', 'ayesha@gmail.com', 'Chattogram', 590, 300);

 
SELECT * FROM University;
SELECT * FROM Restaurant;
SELECT * FROM Hospital;
SELECT * FROM TrainTicket;
SELECT * FROM Software;
SELECT * FROM LLM;
SELECT * FROM AttendanceSystem;
SELECT * FROM Library;
SELECT * FROM Facebook;