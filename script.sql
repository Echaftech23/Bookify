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

-- remplissages de table Employee :
INSERT INTO employees (name, email, departement, poste) VALUES
('John Doe', 'john.doe@example.com', 'HR', 'HR Manager'),
('Jane Smith', 'jane.smith@example.com', 'IT', 'Software Engineer'),
('Bob Johnson', 'bob.johnson@example.com', 'Finance', 'Accountant'),
('Alice Johnson', 'alice.johnson@example.com', 'Marketing', 'Marketing Specialist'),
('Charlie Brown', 'charlie.brown@example.com', 'IT', 'System Administrator'),
('Eva Rodriguez', 'eva.rodriguez@example.com', 'Finance', 'Financial Analyst');

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
    ('2023-02-01', '2023-02-03', 2, 2),
    ('2023-03-10', '2023-03-10', 3, 3),
    ('2023-01-15', '2023-01-15', 1, 4),
    ('2023-02-01', '2023-02-03', 2, 5),
    ('2023-03-10', '2023-03-10', 3, 6);

-- remplissages de table equipement :
INSERT INTO equipements (name, reservation_id) VALUES 
  ('Laptop', 1),
  ('Projector', 2),
  ('Whiteboard', 3),
  ('Printer', 4),
  ('Conference Phone', 5),
  ('Camera', 6);
