-- Creation de Base de donnees :
CREATE DATABASE bookify_DB;

-- Creation de tables Employee:
CREATE TABLE Employees (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    departement VARCHAR(100),
    poste VARCHAR(100)
);
-- Indexation :
CREATE INDEX idx_id ON employees (id);

-- Creation de tables Salle:
CREATE TABLE Salles (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    capacite INT
);
-- Indexation :
CREATE INDEX idx_id ON salles (id);


-- Creation de tables Reservation:
CREATE TABLE Reservations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_debut DATE, 
    date_fin DATE,
    employe_id INT,
    salle_id INT,
    FOREIGN KEY (employe_id) REFERENCES Employees(id),
    FOREIGN KEY (salle_id) REFERENCES Salles(id)
);

-- Indexation :
CREATE INDEX idx_id ON reservations (id);

-- Creation de tables Equipement:
CREATE TABLE Equipements (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    reservation_id INT,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(id)
);

-- Indexation :
CREATE INDEX idx_id ON equipements (id);