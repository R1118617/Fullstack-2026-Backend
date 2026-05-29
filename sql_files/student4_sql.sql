-- Drop all tables if they exist
DROP TABLE IF EXISTS fitness.attendants;
DROP TABLE IF EXISTS fitness.grouplessons;
DROP TABLE IF EXISTS fitness.planning;
DROP SCHEMA IF EXISTS fitness;

-- Create new database if it does not exist
CREATE SCHEMA IF NOT EXISTS fitness;

-- Create new tables if they don't exist
CREATE TABLE IF NOT EXISTS fitness.grouplessons (
    grouplessonId serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    maxAttendants integer NOT NULL,
    minAttendants integer NOT NULL
);

CREATE TABLE IF NOT EXISTS fitness.planning (
	planningId serial PRIMARY KEY,
	grouplessonId integer NOT NULL,
	weekday integer NOT NULL,
	startTime time NOT NULL,
	endTime time NOT NULL
);

CREATE TABLE IF NOT EXISTS fitness.attendants (
	attendantsId serial PRIMARY KEY,
	planningId integer NOT NULL,
	lessonDate date NOT NULL,
	attendants integer NOT NULL
);

-- Insert data into the tables to use...
INSERT INTO fitness.grouplessons (name, minAttendants, maxAttendants) VALUES
('Spinning',5,20),
('Aerobics',5,20),
('Steps',2,10),
('Body Attack',3,15),
('Zumba',3,15),
('Circuit training',1,12),
('BBB',3,15),
('Yoga',1,10),
('BodyBalance',1,10),
('Kickboksen',1,5),
('Senior-club',5,20),
('Gym',0,35);

INSERT INTO fitness.planning (grouplessonId, weekday, startTime, endTime) VALUES
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Gym'), 0, '07:00', '22:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 0, '09:00', '10:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Yoga'), 0, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 0, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Senior-club'), 0, '10:00', '11:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'BBB'), 0, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 0, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 0, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 0, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 0, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 0, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 0, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 0, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 0, '19:30', '20:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Circuit training'), 0, '18:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 0, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 0, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 0, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 0, '21:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 0, '20:30', '21:30');

INSERT INTO fitness.planning (grouplessonId, weekday, startTime, endTime) VALUES
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Gym'), 1, '07:00', '22:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 1, '09:00', '10:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Yoga'), 1, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 1, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Senior-club'), 1, '10:00', '11:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'BBB'), 1, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 1, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 1, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 1, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 1, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 1, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 1, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 1, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 1, '19:30', '20:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Circuit training'), 1, '18:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 1, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 1, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 1, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 1, '21:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 1, '20:30', '21:30');

INSERT INTO fitness.planning (grouplessonId, weekday, startTime, endTime) VALUES
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Gym'), 2, '07:00', '22:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 2, '09:00', '10:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Yoga'), 2, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 2, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Senior-club'), 2, '10:00', '11:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'BodyBalance'), 2, '13:00', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 2, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 2, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 2, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 2, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 2, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 2, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Kickboksen'), 2, '15:00', '16:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 2, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 2, '19:30', '20:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Circuit training'), 2, '13:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 2, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 2, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 2, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 2, '21:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 2, '20:30', '21:30');

INSERT INTO fitness.planning (grouplessonId, weekday, startTime, endTime) VALUES
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Gym'), 3, '07:00', '22:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 3, '09:00', '10:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Yoga'), 3, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 3, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Senior-club'), 3, '10:00', '11:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'BBB'), 3, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 3, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 3, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 3, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 3, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 3, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 3, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 3, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 3, '19:30', '20:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Circuit training'), 3, '18:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 3, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 3, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 3, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 3, '21:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 3, '20:30', '21:30');

INSERT INTO fitness.planning (grouplessonId, weekday, startTime, endTime) VALUES
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Gym'), 4, '07:00', '22:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 4, '09:00', '10:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Yoga'), 4, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 4, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Senior-club'), 4, '10:00', '11:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'BBB'), 4, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 0, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 4, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 4, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 4, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 4, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 4, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 4, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 4, '19:30', '20:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Circuit training'), 4, '18:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 4, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 4, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 4, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 4, '21:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 4, '20:30', '21:30');

INSERT INTO fitness.planning (grouplessonId, weekday, startTime, endTime) VALUES
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Gym'), 5, '07:00', '22:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 5, '09:00', '10:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Yoga'), 5, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 5, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Senior-club'), 5, '10:00', '11:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'BBB'), 5, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 5, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 5, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 5, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 5, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 5, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 5, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 5, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 5, '19:30', '20:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Circuit training'), 5, '18:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 5, '19:00', '20:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Steps'), 5, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 5, '20:00', '21:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 5, '21:00', '22:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 5, '20:30', '21:30');

INSERT INTO fitness.planning (grouplessonId, weekday, startTime, endTime) VALUES
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Gym'), 6, '07:00', '18:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Spinning'), 6, '09:00', '10:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Yoga'), 6, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 6, '09:30', '10:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Senior-club'), 6, '10:00', '11:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'BodyBalance'), 6, '13:00', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 6, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 6, '13:30', '14:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 6, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 6, '14:30', '15:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Body Attack'), 6, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Zumba'), 6, '15:30', '16:30'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Kickboksen'), 6, '14:00', '15:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Aerobics'), 6, '15:00', '16:00'),
((SELECT grouplessonId FROM fitness.grouplessons WHERE NAME LIKE 'Circuit training'), 6, '08:00', '17:00');
