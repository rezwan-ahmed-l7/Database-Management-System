SELECT group_id FROM groups LIMIT 3;

select * from groups where group_id in ('G101', 'G102', 'G103');

select * from groups where group_id in (SELECT group_id FROM groups LIMIT 3);

select avg(budget) from groups;

select * from groups where budget > (select avg(budget) from groups);

select * from event_participants limit (select count(*) / 2 from event_participants) ;

select * from events;

------------------------------------------------------------------------------------------

update events
set event_name = 'BAUST CSE FEST 2026';

alter table events add column event_type varchar (50);

alter table events drop column event_type ;

update events
set event_type = 'co-curriculum'

update events
set event_name = 'Football Fest'
where event_id in (select event_id from events limit 10);

select event_name, count (*) from events group by event_name ;