-- 1. Maak een nieuw schema aan
CREATE SCHEMA IF NOT EXISTS fitness;

-- 2. Maak de tabel fitnesstips in het nieuwe schema
CREATE TABLE IF NOT EXISTS fitness.fitnesstips (
    tipid INT PRIMARY KEY,
    icon TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL
);

-- 3. Maak de tabel lifestylecoaches in het schema
CREATE TABLE IF NOT EXISTS fitness.lifestylecoaches (
    coachid INT PRIMARY KEY,
    icon TEXT NOT NULL,
    naam TEXT NOT NULL,
    voornaam TEXT NOT NULL,
    specialisatie TEXT NOT NULL
);

-- 4. Maak de tabel afspraken in het schema => Deze tabel wordt gevuld vanuit de frontend
CREATE TABLE IF NOT EXISTS fitness.afspraken (
    afspraakid SERIAL PRIMARY KEY,
    coachid INT NOT NULL,
    klantnaam VARCHAR(255) NOT NULL,
    datum DATE NOT NULL
);

-- 5. Voeg alle tips toe
INSERT INTO fitness.fitnesstips (tipid, icon, title, description) VALUES
(1, '💧', 'Hydrateer Regelmatig', 'Water ondersteunt je energieniveau, concentratie en stofwisseling.'),
(2, '🥦', 'Eet Meer Groenten', 'Groenten leveren vitamines, vezels en antioxidanten voor een sterk lichaam.'),
(3, '🚶‍♂️', 'Beweeg Elk Uur', 'Korte wandelmomenten verbeteren je bloedsomloop en verminderen stress.'),
(4, '📵', 'Minder Schermtijd', 'Minder schermen zorgt voor betere slaap en meer mentale rust.'),
(5, '🔥', 'Start je Dag Warm', 'Een warm ontbijt activeert je spijsvertering en geeft langdurige energie.'),
(6, '😴', 'Slaap Prioriteren', 'Voldoende slaap ondersteunt herstel, focus en hormonale balans.'),
(7, '🍋', 'Begin met Citroenwater', 'Hydrateert, ondersteunt je spijsvertering en geeft een frisse start.'),
(8, '🧘‍♂️', 'Adem Diep In', 'Diepe ademhaling verlaagt stress en verbetert je concentratie.'),
(9, '🏋️‍♀️', 'Krachttraining', 'Spieren opbouwen verhoogt je metabolisme en verbetert je houding.'),
(10, '🍎', 'Kies Onbewerkte Snacks', 'Fruit en noten geven stabiele energie zonder suikerdip.'),
(11, '🌞', 'Vang Ochtendlicht', 'Natuurlijk licht helpt je biologische klok en verbetert je slaapkwaliteit.'),
(12, '📅', 'Plan Je Maaltijden', 'Meal-prep voorkomt impulsieve keuzes en bespaart tijd.'),
(13, '🧂', 'Minder Zout', 'Minder zout helpt je bloeddruk stabiel te houden.'),
(14, '🥗', 'Helft van je Bord Groenten', 'Zo krijg je automatisch meer vezels en micronutriënten binnen.'),
(15, '🚰', 'Drink Voor Elke Maaltijd', 'Een glas water voor het eten ondersteunt je verzadiging.'),
(16, '🧠', 'Train Je Mindset', 'Kleine dagelijkse gewoontes bouwen een sterke, gezonde routine.'),
(17, '🍵', 'Drink Meer Thee', 'Thee hydrateert en bevat antioxidanten die je lichaam ondersteunen.'),
(18, '🚴‍♂️', 'Kies Vaker voor de Fiets', 'Extra beweging zonder dat het voelt als sporten.'),
(19, '🥚', 'Eiwit bij Elke Maaltijd', 'Eiwitten houden je langer verzadigd en ondersteunen spierherstel.'),
(20, '📚', 'Leer Iets Nieuw Elke Dag', 'Mentale uitdaging houdt je brein scherp en gemotiveerd.'),
(21, '🌿', 'Voeg Kruiden Toe', 'Kruiden zoals kurkuma en gember ondersteunen je immuunsysteem.'),
(22, '🧴', 'Verzorg Je Huid', 'Hydratatie en bescherming verbeteren je huidgezondheid en uitstraling.'),
(23, '🧊', 'Koude Douches', 'Korte koude prikkels verbeteren je doorbloeding en alertheid.'),
(24, '🎧', 'Rustgevende Muziek', 'Muziek verlaagt stress en helpt je sneller te ontspannen.');

-- 6. Voeg alle coaches toe
INSERT INTO fitness.lifestylecoaches (coachid, icon, naam, voornaam, specialisatie) VALUES
(1, '🥗', 'Vermeulen', 'Lena', 'Holistische voeding & energiebalans'),
(2, '🧘', 'De Smet', 'Milan', 'Mindful eten & stressreductie'),
(3, '🌿', 'Peeters', 'Sofie', 'Gezonde gewoontes & lifestyle coaching'),
(4, '💪', 'Vandenberghe', 'Arno', 'Sportvoeding & dagelijkse vitaliteit'),
(5, '🍃', 'Claes', 'Jade', 'Plant-based voeding & hormonale balans'),
(6, '💧', 'Maes', 'Ruben', 'Hydratatie, herstel & slaapoptimalisatie'),
(7, '🧠', 'Willems', 'Elise', 'Mindset coaching & gezonde routines'),
(8, '📦', 'De Ridder', 'Noah', 'Voedingsplanning & meal-prep strategieën'),
(9, '🌸', 'Goossens', 'Tara', 'Lifestyle balans & stressvrij leven'),
(10, '🔥', 'Janssens', 'Finn', 'Actieve leefstijl & gezonde motivatie');