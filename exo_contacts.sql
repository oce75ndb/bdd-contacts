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