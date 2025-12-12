CREATE TABLE App (
    AppID INT AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(100) NOT NULL,
    Versie VARCHAR(50) NOT NULL
);

CREATE TABLE Gebruiker (
    GebruikerID INT AUTO_INCREMENT PRIMARY KEY,
    Voornaam VARCHAR(100),
    Achternaam VARCHAR(100),
    Geboortedatum DATE,
    Telefoonnummer VARCHAR(20),
    Wachtwoord VARCHAR(75),
    Adres VARCHAR(200),
    Relatiestatus VARCHAR(50),
    Email VARCHAR(120) UNIQUE
);

CREATE TABLE Beheerder (
    BeheerderID INT AUTO_INCREMENT PRIMARY KEY,
    Voornaam VARCHAR(100),
    Achternaam VARCHAR(100),
    Email VARCHAR(120) UNIQUE,
    Wachtwoord VARCHAR(75),
    AppID INT NOT NULL,
    FOREIGN KEY (AppID) REFERENCES App(AppID)
);

CREATE TABLE Microbit (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(100) NOT NULL,
    Activiteitsstatus VARCHAR(50),
    GebruikerID INT NOT NULL,
    FOREIGN KEY (GebruikerID) REFERENCES Gebruiker(GebruikerID)
);

CREATE TABLE Activiteit (
    ActiviteitID INT AUTO_INCREMENT PRIMARY KEY,
    Titel VARCHAR(150) NOT NULL,
    Beschrijving TEXT,
    Datum DATE,
    Locatie VARCHAR(150),
    Tijd TIME,
    AppID INT NOT NULL,
    BeheerderID INT NOT NULL,
    FOREIGN KEY (AppID) REFERENCES App(AppID),
    FOREIGN KEY (BeheerderID) REFERENCES Beheerder(BeheerderID)
);

CREATE TABLE Gebruiker_Activiteit (
    GebruikerID INT NOT NULL,
    ActiviteitID INT NOT NULL,
    Rol VARCHAR(50),
    DatumInschrijving DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (GebruikerID, ActiviteitID),
    FOREIGN KEY (GebruikerID) REFERENCES Gebruiker(GebruikerID),
    FOREIGN KEY (ActiviteitID) REFERENCES Activiteit(ActiviteitID)
);

CREATE TABLE Product_Activiteit (
    ProductID INT NOT NULL,
    ActiviteitID INT NOT NULL,
    PRIMARY KEY (ProductID, ActiviteitID),
    FOREIGN KEY (ProductID) REFERENCES Microbit(ProductID),
    FOREIGN KEY (ActiviteitID) REFERENCES Activiteit(ActiviteitID)
);

-- App
INSERT INTO App (Naam, Versie) VALUES
('SportConnect', '1.0'),
('FitTrack', '2.3');

-- Gebruiker
INSERT INTO Gebruiker (Voornaam, Achternaam, Geboortedatum, Telefoonnummer, Wachtwoord, Adres, Relatiestatus, Email) VALUES
('Jan', 'Jansen', '1990-05-12', '0612345678', 'pass123', 'Straat 1, Amsterdam', 'Single', 'jan@example.com'),
('Lisa', 'De Boer', '1988-11-02', '0623456789', 'pass456', 'Laan 22, Utrecht', 'Relatie', 'lisa@example.com');

-- Beheerder
INSERT INTO Beheerder (Voornaam, Achternaam, Email, Wachtwoord, AppID) VALUES
('Mark', 'Vermeer', 'mark@app.com', 'admin123', 1),
('Sophie', 'Bakker', 'sophie@app.com', 'admin456', 2);

-- Microbit
INSERT INTO Microbit (Naam, Activiteitsstatus, GebruikerID) VALUES
('Microbit A', 'Actief', 1),
('Microbit B', 'Inactief', 2);

-- Activiteit
INSERT INTO Activiteit (Titel, Beschrijving, Datum, Locatie, Tijd, AppID, BeheerderID) VALUES
('Hardlooptraining', 'Intervaltraining in het park', '2025-03-20', 'Amsterdam Park', '10:00', 1, 1),
('Yoga Sessie', 'Rustgevende ochtendyoga', '2025-03-21', 'Utrecht Centrum', '09:00', 2, 2);

-- Gebruiker_Activiteit
INSERT INTO Gebruiker_Activiteit (GebruikerID, ActiviteitID, Rol) VALUES
(1, 1, 'Deelnemer'),
(2, 2, 'Deelnemer');

-- Product_Activiteit
INSERT INTO Product_Activiteit (ProductID, ActiviteitID) VALUES
(1, 1),
(2, 2);

INSERT INTO Activiteit (Titel, Beschrijving, Datum, Locatie, Tijd, AppID, BeheerderID) VALUES
('Bootcamp Sessie', 'Intensieve buitentraining', '2025-03-22', 'Rotterdam Park', '11:30', 1, 1),
('Fietsronde', 'Groepsfietstocht van 20 km', '2025-03-23', 'Den Haag Strand', '14:00', 1, 1),
('Zwemtraining', 'Techniek- en conditietraining', '2025-03-24', 'Zwembad Utrecht', '08:00', 2, 2),
('Krachttraining', 'Volledige body workout', '2025-03-25', 'Gym Amsterdam', '17:00', 1, 1),
('Boksen voor beginners', 'Basisstoten en conditie', '2025-03-26', 'Rotterdam Gym', '18:30', 2, 2),
('Wandeltocht', 'Rustige wandeling van 5 km', '2025-03-27', 'Veluwe', '10:30', 1, 1),
('HIIT Sessie', 'Hoge intensiteit intervaltraining', '2025-03-28', 'Utrecht Park', '19:00', 2, 2),
('Pilates Workout', 'Core stability en flexibiliteit', '2025-03-29', 'Zwolle Studio', '09:30', 2, 2);

INSERT INTO Activiteit (Titel, Beschrijving, Datum, Locatie, Tijd, AppID, BeheerderID) VALUES
('Rustige Wandelgroep', 'Gezamenlijke korte wandeling met pauzes', '2025-04-01', 'Park Amsterdam', '10:00', 1, 1),
('Stoelyoga', 'Zachte rek- en ontspanningsoefeningen op een stoel', '2025-04-02', 'Utrecht Buurthuis', '09:30', 2, 2),
('Geheugentraining', 'Lichte hersengymnastiek en geheugenspelletjes', '2025-04-03', 'Rotterdam Activiteitencentrum', '14:00', 1, 1),
('Valpreventie cursus', 'Oefeningen voor balans en veilig bewegen', '2025-04-04', 'Den Haag Sporthal', '11:00', 2, 2),
('Senioren Tai Chi', 'Langzame bewegingen voor balans en ontspanning', '2025-04-05', 'Zwolle Park', '10:30', 1, 1),
('Gezellige Koffieochtend', 'Koffie, kaarten en lichte activiteiten', '2025-04-06', 'Buurthuis Leiden', '09:00', 2, 2),
('Senior Fitness Licht', 'Lage intensiteit training met lichte gewichten', '2025-04-07', 'Gym Utrecht', '15:00', 1, 1),
('Beweeg Bingo', 'Beweegspel voor mobiliteit en plezier', '2025-04-08', 'Eindhoven Activiteitencentrum', '13:00', 2, 2);

INSERT INTO App (Naam, Versie) VALUES
('SeniorFit', '1.0'),
('BeweegMakkelijk', '1.2'),
('ZilverActief', '2.0'),
('OuderenConnect', '1.5'),
('VitaliteitPlus', '3.1'),
('GezondOud', '1.3'),
('RustigBewegen', '2.4'),
('SamenActief', '1.1');

INSERT INTO Beheerder (Voornaam, Achternaam, Email, Wachtwoord, AppID) VALUES
('Tom', 'Koster', 'tom.koster@app.com', 'beheer123', 3),
('Janneke', 'Smit', 'janneke.smit@app.com', 'beheer234', 4),
('Ruben', 'Visser', 'ruben.visser@app.com', 'beheer345', 5),
('Elisa', 'Kuiper', 'elisa.kuiper@app.com', 'beheer456', 6),
('Daan', 'Meijer', 'daan.meijer@app.com', 'beheer567', 7),
('Nina', 'Bos', 'nina.bos@app.com', 'beheer678', 8),
('Hugo', 'Mulder', 'hugo.mulder@app.com', 'beheer789', 9),
('Fleur', 'Kramer', 'fleur.kramer@app.com', 'beheer890', 10);

INSERT INTO Gebruiker (Voornaam, Achternaam, Geboortedatum, Telefoonnummer, Wachtwoord, Adres, Relatiestatus, Email) VALUES
('Hendrik', 'Van Dijk', '1945-02-14', '0611111111', 'senior001', 'Korenstraat 12, Utrecht', 'Gehuwd', 'hendrik.vdijk@example.com'),
('Gerda', 'Mulder', '1948-07-09', '0622222222', 'senior002', 'Parklaan 4, Amsterdam', 'Weduwe', 'gerda.mulder@example.com'),
('Willem', 'Smits', '1943-11-23', '0633333333', 'senior003', 'Beukenhof 9, Rotterdam', 'Gehuwd', 'willem.smits@example.com'),
('Annie', 'Dekker', '1950-01-30', '0644444444', 'senior004', 'Vredestraat 19, Den Haag', 'Alleenstaand', 'annie.dekker@example.com'),
('Theo', 'Brouwer', '1946-05-17', '0655555555', 'senior005', 'Esdoornlaan 7, Zwolle', 'Gehuwd', 'theo.brouwer@example.com'),
('Maria', 'Hoogland', '1944-09-11', '0666666666', 'senior006', 'Stationsweg 3, Leiden', 'Weduwe', 'maria.hoogland@example.com'),
('Karel', 'Blom', '1942-03-05', '0677777777', 'senior007', 'Lindenstraat 8, Eindhoven', 'Alleenstaand', 'karel.blom@example.com'),
('Els', 'Vermeer', '1951-12-01', '0688888888', 'senior008', 'Oranjestraat 14, Tilburg', 'Gehuwd', 'els.vermeer@example.com');

INSERT INTO Gebruiker_Activiteit (GebruikerID, ActiviteitID, Rol) VALUES
(3, 3, 'Deelnemer'),
(4, 4, 'Deelnemer'),
(5, 5, 'Deelnemer'),
(6, 6, 'Deelnemer'),
(7, 7, 'Deelnemer'),
(8, 8, 'Deelnemer'),
(9, 9, 'Deelnemer'),
(10, 10, 'Deelnemer');

INSERT INTO Microbit (Naam, Activiteitsstatus, GebruikerID) VALUES
('Microbit Senior 1', 'Actief', 3),
('Microbit Senior 2', 'Actief', 4),
('Microbit Senior 3', 'Inactief', 5),
('Microbit Senior 4', 'Actief', 6),
('Microbit Senior 5', 'Actief', 7),
('Microbit Senior 6', 'Inactief', 8),
('Microbit Senior 7', 'Actief', 9),
('Microbit Senior 8', 'Actief', 10);

INSERT INTO Product_Activiteit (ProductID, ActiviteitID) VALUES
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
