-- Creation de Base de donnees :
CREATE DATABASE bookify_DB;

-- Creation de tables Employee:
CREATE TABLE Employees (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
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

-- remplissages de table Employee :
INSERT INTO employees (prenom, nom, email, departement, poste) VALUES
('John', 'Doe', 'john.doe@example.com', 'HR', 'HR Manager'),
('Jane', 'Smith', 'jane.smith@example.com', 'IT', 'Software Engineer'),
('Nabil', 'chabab', 'bob.johnson@example.com', 'Finance', 'Accountant'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'Marketing', 'Marketing Specialist'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'IT', 'System Administrator'),
('Eva', 'Rodriguez', 'eva.rodriguez@example.com', 'Finance', 'Financial Analyst');

-- remplissages de table Salle :
INSERT INTO salles (name, capacite) VALUES 

('Boardroom D', 12),
('Breakout Room E', 10),
('Conference Room A', 20),
('Meeting Room B', 15),
('Training Room C', 30),
('Board Room', 10);

-- remplissages de table reservation :
INSERT INTO reservations (date_debut, date_fin, employe_id, salle_id) VALUES 
    ('2023-01-15', '2023-01-15', 1, 1),
    ('2023-02-01', '2023-02-03', 4, 2),
    ('2023-03-10', '2023-03-10', 4, 2),
    ('2023-01-15', '2023-01-15', 1, 1),
    ('2023-02-01', '2023-02-03', 6, 3),
    ('2023-03-10', '2023-03-12', 5, 4),
    ('2023-03-12', '2023-03-14', 2, 5),
    ('2023-03-14', '2023-03-15', 2, 5),
    ('2023-03-15', '2023-03-17', 1, 4),
    ('2023-03-17', '2023-03-20', 3, 1),
    ('2023-03-12', '2023-03-21', 2, 3);

-- remplissages de table equipement :
INSERT INTO equipements (name, reservation_id) VALUES 
  ('Laptop', 1),
  ('Projector', 2),
  ('Whiteboard', 3),
  ('Printer', 4),
  ('Conference Phone', 5),
  ('Camera', 6);

-- Lister les elements de table Employees :
SELECT * FROM `employees` WHERE 1;

-- Lister la colonne id dans la table Employee :
SELECT id FROM `employees`;

-- Lister le tuple de la table Employee ou id = 1 :
SELECT * FROM `employees` WHERE id = 1;

-- liste des employees par leur nom
SELECT *
from employees
ORDER BY nom; 

-- liste des 3 premier employes 
SELECT *
from employees
LIMIT 3;

-- liste des employees par leur profile 
SELECT   
concat (nom,' ', prenom,'  ', email) AS employe_profile
FROM employees;

-- liste des reservations des plus recentes
SELECT *
from reservations
ORDER BY date_debut DESC; 

-- liste des noms des employees avec le nom d'equipements
SELECT nom 
FROM employees
UNION
SELECT name
FROM equipements;

-- Update le nom et l'email dans la table Employee :
UPDATE `employees` SET nom = 'Echafai', prenom = 'Rachid', email = 'rachid.echaf@gmail.com'  WHERE nom = 'Smith' AND prenom = 'Jane' AND email = 'jane.smith@example.com';

-- Join les elements de la table Employees avec les elements de la table reservations:
SELECT employees.id, nom, prenom, poste, date_debut, date_fin
FROM employees
INNER JOIN reservations ON employees.id = reservations.id;

-- liste des employees et date reservations avec les equipements reserves
SELECT employees.nom, employees.prenom, reservations.date_debut, reservations.date_fin, equipements.name
FROM employees
JOIN reservations
ON employees.id = reservations.employe_id
LEFT JOIN equipements
ON reservations.id = equipements.reservation_id;

-- liste des reservations effectuer par l'employee Nabil avec salle :
SELECT employees.nom, employees.prenom, salles.name, reservations.date_debut, reservations.date_fin 
FROM employees
JOIN Reservations
ON employees.id = reservations.employe_id
INNER JOIN salles
ON  salles.id = reservations.salle_id
WHERE employees.prenom = 'Nabil';