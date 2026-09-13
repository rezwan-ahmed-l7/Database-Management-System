CREATE DATABASE research;

DROP TABLE IF EXISTS event_participants;
DROP TABLE IF EXISTS event_details;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS groups;

-- 1. Engineering Research Groups
CREATE TABLE groups (
    group_id VARCHAR(10) PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    budget DECIMAL(12, 2) NOT NULL
);

-- 2. Engineering Events
CREATE TABLE events (
    event_id VARCHAR(10) PRIMARY KEY,
    group_id VARCHAR(10) NOT NULL,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    FOREIGN KEY (group_id) REFERENCES groups(group_id)
);

-- 3. Detailed Event Metadata & Funding
CREATE TABLE event_details (
    event_id VARCHAR(10) PRIMARY KEY,
    location VARCHAR(100) NOT NULL,
    allocated_funding DECIMAL(10, 2) NOT NULL,
    max_capacity INT NOT NULL,
    session_rating DECIMAL(3, 2) NULL, -- NULL indicates rating pending/cancelled
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- 4. Event Participants & Feedback
CREATE TABLE event_participants (
    participant_id VARCHAR(10) PRIMARY KEY,
    event_id VARCHAR(10) NOT NULL,
    participant_name VARCHAR(100) NOT NULL,
    role VARCHAR(30) NOT NULL, -- e.g., Keynote, Speaker, Attendee
    feedback_score DECIMAL(3, 1) NULL, -- NULL represents missing survey response
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Populate GROUPS (6 rows)
INSERT INTO groups (group_id, group_name, department, budget) VALUES
('G101', 'AI & Robotics Research Lab', 'Computer Science', 150000.00),
('G102', 'Quantum Computing Group', 'Physics & EEE', 200000.00),
('G103', 'Structural Dynamics Unit', 'Civil Engineering', 80000.00),
('G104', 'Renewable Energy Systems', 'Electrical Eng', 120000.00),
('G105', 'VLSI & Microelectronics', 'Electrical Eng', 95000.00),
('G106', 'Autonomous Systems Consortium', 'Computer Science', 180000.00);

-- Populate EVENTS (8 rows)
INSERT INTO events (event_id, group_id, event_name, event_date) VALUES
('E201', 'G101', 'International Robotics Summit', '2026-03-15'),
('E202', 'G101', 'Computer Vision Workshop', '2026-04-10'),
('E203', 'G102', 'Quantum Algorithms Symposium', '2026-05-20'),
('E204', 'G103', 'Bridge Vibration Analysis Seminar', '2026-06-12'),
('E205', 'G104', 'Solar Grid Integration Expo', '2026-07-05'),
('E206', 'G105', 'Chip Design Masterclass', '2026-08-18'),
('E207', 'G106', 'Self-Driving Sensor Fusion Conference', '2026-09-22'),
('E208', 'G106', 'Deep Reinforcement Learning Lab', '2026-10-30');

-- Populate EVENT_DETAILS (8 rows)
INSERT INTO event_details (event_id, location, allocated_funding, max_capacity, session_rating) VALUES
('E201', 'Main Auditorium', 25000.00, 200, 4.80),
('E202', 'Robotics Lab 302', 8000.00, 40, 4.50),
('E203', 'Quantum Science Hall', 30000.00, 150, 4.90),
('E204', 'Civil Engineering Block C', 5000.00, 60, NULL),
('E205', 'Expo Convention Center', 18000.00, 300, 4.20),
('E206', 'Cleanroom Facility B', 12000.00, 50, 4.70),
('E207', 'Tech Innovation Hall', 40000.00, 500, 4.60),
('E208', 'CS Seminar Room 101', 7000.00, 35, NULL);

-- Populate EVENT_PARTICIPANTS (10 rows)
INSERT INTO event_participants (participant_id, event_id, participant_name, role, feedback_score) VALUES
('P301', 'E201', 'Dr. Elena Rostova', 'Keynote', 9.5),
('P302', 'E201', 'Marcus Vance', 'Attendee', 8.0),
('P303', 'E202', 'Sarah Jenkins', 'Speaker', 9.0),
('P304', 'E202', 'David Chen', 'Attendee', NULL),
('P305', 'E203', 'Prof. Alan Turing', 'Keynote', 9.8),
('P306', 'E203', 'Marcus Vance', 'Attendee', 8.5),
('P307', 'E205', 'Dr. Aris Thorne', 'Speaker', 7.5),
('P308', 'E206', 'Sarah Jenkins', 'Keynote', 9.2),
('P309', 'E207', 'Dr. Elena Rostova', 'Keynote', 9.7),
('P310', 'E207', 'David Chen', 'Attendee', 6.5);

SELECT * FROM groups;
SELECT * FROM events;
SELECT * FROM event_details;
SELECT * FROM event_participants;