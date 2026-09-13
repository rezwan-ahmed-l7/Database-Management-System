SELECT * FROM event_participants;

SELECT COUNT(*) FROM event_participants;
SELECT COUNT(*) FROM event_participants WHERE role = 'Keynote';

SELECT * FROM event_participants WHERE participant_name LIKE '%va%';
SELECT * FROM event_participants WHERE participant_name LIKE '%Ros%';
SELECT * FROM event_participants WHERE participant_name LIKE '%Elena Rostova%';

SELECT distinct role FROM event_participants;

SELECT * FROM event_participants WHERE feedback_score IS NOT NULL;
SELECT * FROM event_participants WHERE feedback_score IS NULL;

SELECT * FROM event_participants WHERE event_id NOT IN ('E201', 'E202', 'E203');

SELECT ROUND(AVG(feedback_score), 2) FROM event_participants;
SELECT MIN(feedback_score) FROM event_participants;

SELECT COALESCE(feedback_score, 10) FROM event_participants;
SELECT COALESCE(feedback_score, -1) FROM event_participants;

select round(avg(feedback_score) - 0.5) from event_participants where feedback_score is NULL;
select min(coalesce(feedback_score, 0)) as min_max_feedback from event_participants;

SELECT MIN(COALESCE(feedback_score, -1)) AS min_feedback,
       MAX(feedback_score) AS max_feed
FROM event_participants;

SELECT e.group_id, e.event_name FROM events e;

SELECT e.*, ep.* FROM events e INNER JOIN event_participants ep ON e.event_id = ep.event_id;