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