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
    review varchar(200),
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
    ('Spiegel', 'Silvia', 'silvia.selfie@fictiefmail.com', 1, NULL),
    ('Legday', 'Mark', 'mark.legday@fictiefmail.com', 2, 4)
;

UPDATE fitness.member SET review = 'De Gigachad formule is legendarisch, en Anna Kilo laat me zweten!' WHERE email = 'Henk2.Henkzoon@fictiefmail.com';
UPDATE fitness.member SET review = 'Basis is prima, ik heb geen trainer nodig om naar de spiegels te kijken.' WHERE email = 'sjors.loves.gainz@fictiefmail.com';
UPDATE fitness.member SET review = 'Lekker rustig trainen met het Premium pakket, heerlijk.' WHERE email = 'zarah.cardio@fictiefmail.com';
UPDATE fitness.member SET review = 'Jos is de koning van de machines, Gigachad waardig.' WHERE email = 'boris.benchpress@fictiefmail.com';
UPDATE fitness.member SET review = 'De vanilleshakes in de kantine zijn beter dan de loopbanden.' WHERE email = 'vera.vanilla.shake@fictiefmail.com';
UPDATE fitness.member SET review = 'Premium is top, maar die spierpijn is minder.' WHERE email = 'sam.auwtch@fictiefmail.com';
UPDATE fitness.member SET review = 'Luna Storm en haar Crossfit lessen zijn een stormvloed aan energie!' WHERE email = 'eddy.shakey@fictiefmail.com';
UPDATE fitness.member SET review = 'Ben Baks is een legende, ook al is hij nooit beschikbaar.' WHERE email = 'linda.ren@fictiefmail.com';
UPDATE fitness.member SET review = 'Lifting is life met de hulp van Anna. Premium keuze!' WHERE email = 'luke.sky-lifter@fictiefmail.com';
UPDATE fitness.member SET review = 'Ik kom alleen voor de basis en de pizza na de training.' WHERE email = 'chantal.pizza@fictiefmail.com';
UPDATE fitness.member SET review = 'Basis lidmaatschap is genoeg als je alleen selfies maakt.' WHERE email = 'silvia.selfie@fictiefmail.com';