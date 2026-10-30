CREATE DATABASE bank;

DROP TABLE IF EXISTS transations CASCADE;
DROP TABLE IF EXISTS users_stats CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS activity_logs CASCADE;

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

CREATE TABLE transations (
    id SERIAL PRIMARY KEY,
    sender INT,
    receiver INT,
    amount INT
);

CREATE TABLE users_stats (
    user_id INT PRIMARY KEY,
    total_sent INT DEFAULT 0
);

CREATE TABLE activity_logs (
    message TEXT
);

INSERT INTO users
VALUES
(1, 'Rakib', 500),
(2, 'Sad', 1000);

INSERT INTO users
VALUES
(3, 'Rakib', 1500),
(4, 'Sad', 2000);

INSERT INTO users_stats
VALUES
(1, 0),
(2, 0);

INSERT INTO users_stats
VALUES
(3, 0),
(4, 0);

CREATE OR REPLACE FUNCTION transfer_money()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE users
    SET balance = balance - NEW.amount
    WHERE id = NEW.sender;

    UPDATE users
    SET balance = balance + NEW.amount
    WHERE id = NEW.receiver;

    UPDATE users_stats
    SET total_sent = total_sent + NEW.amount
    WHERE user_id = NEW.sender;

    INSERT INTO activity_logs
    VALUES
    ('Money Transfer is starting at ' || CURRENT_TIMESTAMP),
    ('Money Transfer is done at ' || CURRENT_TIMESTAMP),
    ('Money Transfer is successful at ' || CURRENT_TIMESTAMP);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER money_trigger
AFTER INSERT ON transations
FOR EACH ROW
EXECUTE FUNCTION transfer_money();

INSERT INTO transations
VALUES
(DEFAULT, 3, 4, 200),
(DEFAULT, 1, 3, 200),
(DEFAULT, 4, 1, 100),
(DEFAULT, 2, 4, 200);

SELECT * FROM users;
SELECT * FROM users_stats;
SELECT * FROM transations;
SELECT * FROM activity_logs;