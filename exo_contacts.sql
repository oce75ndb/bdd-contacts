-- Creation database
CREATE DATABASE IF NOT EXISTS exo_contacts;
USE exo_contacts;

-- Creation d'une table 'pays'
CREATE TABLE IF NOT EXISTS pays (
    iso_3 VARCHAR(3) NOT NULL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    iso_2 VARCHAR(2) NOT NULL,
    nationalite VARCHAR(50) NOT NULL
);

-- Creation d'une table 'contacts'
CREATE TABLE IF NOT EXISTS contacts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(70) NOT NULL,
    prenom VARCHAR(70) NOT NULL,
    date_de_naissance DATE NOT NULL,
    sexe VARCHAR(1) CHECK (sexe IN ('M', 'F')) NOT NULL,
    adresse TEXT,
    cp VARCHAR(10),
    ville VARCHAR(70),
    pays_iso_3 VARCHAR(3) NOT NULL,
    FOREIGN KEY (pays_iso_3) REFERENCES pays(iso_3)
);

-- Creation d'une table 'telephone'
CREATE TABLE IF NOT EXISTS telephone (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_contact INT NOT NULL,
    numero VARCHAR(30) NOT NULL,
    type ENUM('mobile', 'travail', 'maison') NOT NULL,
    FOREIGN KEY (id_contact) REFERENCES contacts(id)
);

-- Insertion des données dans 'pays'
INSERT INTO pays (iso_3, nom, iso_2, nationalite) VALUES
('USA', 'United States', 'US', 'American'),
('GBR', 'United Kingdom', 'GB', 'British'),
('CAN', 'Canada', 'CA', 'Canadian'),
('FRA', 'France', 'FR', 'French'),
('DEU', 'Germany', 'DE', 'German'),
('JPN', 'Japan', 'JP', 'Japanese'),
('AUS', 'Australia', 'AU', 'Australian'),
('ITA', 'Italy', 'IT', 'Italian'),
('ESP', 'Spain', 'ES', 'Spanish'),
('BRA', 'Brazil', 'BR', 'Brazilian');

-- Insertion des données dans 'contacts'
INSERT INTO contacts (nom, prenom, date_de_naissance, sexe, adresse, cp, ville, pays_iso_3) VALUES
('Doe', 'John', '1980-01-01', 'M', '123 Main St', '12345', 'New York', 'USA'),
('Smith', 'Jane', '1985-02-02', 'F', '456 Elm St', '23456', 'Los Angeles', 'USA'),
('Johnson', 'Robert', '1990-03-03', 'M', '789 Oak St', '34567', 'Chicago', 'USA'),
('Williams', 'Emily', '1982-04-04', 'F', '101 Pine St', '45678', 'Houston', 'USA'),
('Brown', 'Michael', '1987-05-05', 'M', '202 Maple St', '56789', 'Phoenix', 'USA'),
('Davis', 'Sarah', '1984-06-06', 'F', '303 Cedar St', '67890', 'Philadelphia', 'USA'),
('Wilson', 'Daniel', '1989-07-07', 'M', '404 Birch St', '78901', 'San Antonio', 'USA'),
('Anderson', 'Lisa', '1986-08-08', 'F', '505 Redwood St', '89012', 'San Diego', 'USA'),
('Garcia', 'Carlos', '1995-09-09', 'M', '606 Pineapple St', '90123', 'Miami', 'USA'),
('Martinez', 'Isabella', '1998-10-10', 'F', '707 Orange St', '01234', 'San Francisco', 'USA');