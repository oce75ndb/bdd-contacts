-- Creation de la base de données et utilisation de celle-ci
DROP DATABASE IF EXISTS exo_contacts;
CREATE DATABASE exo_contacts;
USE exo_contacts;

-- Creation d'une table 'pays'
CREATE TABLE IF NOT EXISTS pays (
    iso_3 VARCHAR(3) NOT NULL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    iso_2 VARCHAR(2) NOT NULL,
    nationalite VARCHAR(50) NOT NULL
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

-- Creation d'une table 'contacts'
CREATE TABLE IF NOT EXISTS contacts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(70) NOT NULL,
    prenom VARCHAR(70) NOT NULL,
    date_de_naissance DATE NOT NULL,
    sexe ENUM('M', 'F') NOT NULL,
    adresse TEXT,
    cp VARCHAR(10),
    ville VARCHAR(70),
    pays_iso_3 VARCHAR(3) NOT NULL,
    FOREIGN KEY (pays_iso_3) REFERENCES pays(iso_3)
);

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

-- Creation d'une table 'telephone'
CREATE TABLE IF NOT EXISTS telephone (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_contact INT NOT NULL,
    numero VARCHAR(30) NOT NULL,
    type ENUM('mobile', 'travail', 'maison') NOT NULL,
    FOREIGN KEY (id_contact) REFERENCES contacts(id)
);

INSERT INTO telephone (id_contact, numero, type) VALUES
(1, '555-0101', 'mobile'),
(1, '555-0102', 'maison'),
(2, '555-0201', 'mobile'),
(3, '555-0301', 'mobile'),
(4, '555-0401', 'travail'),
(5, '555-0501', 'mobile'),
(6, '555-0601', 'maison'),
(7, '555-0701', 'mobile'),
(8, '555-0801', 'travail'),
(9, '555-0901', 'mobile');

