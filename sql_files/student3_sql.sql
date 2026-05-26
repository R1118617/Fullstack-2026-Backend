-- Delete bestaande tabellen if exist
DROP TABLE IF EXISTS fitness.member;
DROP TABLE IF EXISTS fitness.trainer;
DROP TABLE IF EXISTS fitness.membership;


--Toevoegen tabellen
CREATE SCHEMA IF NOT EXISTS fitness;
CREATE TABLE IF NOT EXISTS fitness.membership (
    membershipID serial PRIMARY KEY,
    membershipName varchar(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS fitness.trainer (
    trainerID serial PRIMARY KEY,
    lastName varchar(50) NOT NULL,
    firstName varchar(50) NOT NULL,
    speciality varchar(50) NOT NULL,
    availability BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS fitness.member (
    memberID serial PRIMARY KEY,
    lastName varchar(50) NOT NULL,
    firstName varchar(50) NOT NULL,
    email varchar(50) NOT NULL UNIQUE,
    membershipID int NOT NULL,
    trainerID int,
    CONSTRAINT FK_membership_member
        FOREIGN KEY (membershipID)
        REFERENCES fitness.membership(membershipID),
    CONSTRAINT FK_trainer_member
        FOREIGN KEY (trainerID)
        REFERENCES fitness.trainer(trainerID)
);

--Voeg data toe in tabellen

INSERT INTO fitness.membership (membershipName) VALUES
    ('Basis'),
    ('Premium'),
    ('Gigachad')
;

INSERT INTO fitness.trainer (lastName, firstName, speciality, availability) VALUES
    ('Josson', 'Jos', 'Machines', TRUE),
    ('Late', 'Tem P.', 'Spinning', TRUE),
    ('Kilo', 'Anna', 'Powerlifting', TRUE),
    ('Zand', 'Erik', 'Yoga', FALSE),
    ('Storm', 'Luna', 'Crossfit', TRUE),
    ('Visser', 'Finn', 'Zumba', TRUE),
    ('Baks', 'Ben', 'Cardio', FALSE)
;

INSERT INTO fitness.member (lastName, firstName, email, membershipID, trainerID) VALUES
    ('Henkzoon', 'Henk II', 'Henk2.Henkzoon@fictiefmail.com', 3, 3),
    ('Spierbal', 'Sjors', 'sjors.loves.gainz@fictiefmail.com', 1, NULL),
    ('Zweetdruppel', 'Zarah', 'zarah.cardio@fictiefmail.com', 2, NULL),
    ('Bankdrukker', 'Boris', 'boris.benchpress@fictiefmail.com', 3, 1),
    ('Vla', 'Vera', 'vera.vanilla.shake@fictiefmail.com', 1, NULL),
    ('Spierpijn', 'Sam', 'sam.auwtch@fictiefmail.com', 2, NULL),
    ('Eiwit', 'Eddy', 'eddy.shakey@fictiefmail.com', 3, 5),
    ('Loopband', 'Linda', 'linda.ren@fictiefmail.com', 1, 7),
    ('Lifting', 'Luke', 'luke.sky-lifter@fictiefmail.com', 2, 3),
    ('Cheatday', 'Chantal', 'chantal.pizza@fictiefmail.com', 1, NULL),
    ('Spiegel', 'Silvia', 'silvia.selfie@fictiefmail.com', 1, NULL)
;
