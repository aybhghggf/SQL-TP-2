CREATE DATABASE parc_voiture;
USE parc_voiture;

CREATE TABLE conducteur (
    id_conducteur INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    DateNaissance DATE
);

CREATE TABLE entretien (
    id_entretien INT AUTO_INCREMENT PRIMARY KEY,
    Nom_entretien VARCHAR(255),
    frequence VARCHAR(255),
    periode VARCHAR(255),
    kilometrage INT,
    montant INT
);

CREATE TABLE vehicule (
    immat VARCHAR(25) PRIMARY KEY,
    marque VARCHAR(255),
    modele VARCHAR(255),
    puissance INT,
    carburant VARCHAR(255),
    DateAchat DATE,
    id_conducteur INT
);

CREATE TABLE entretien_vehicule (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    id_entretien INT,
    immat VARCHAR(25),
    DateEntretien DATE,
    Compteur INT
);

ALTER TABLE vehicule
ADD CONSTRAINT fk_conducteur_vehicule
FOREIGN KEY (id_conducteur) REFERENCES conducteur(id_conducteur);

ALTER TABLE entretien_vehicule
ADD CONSTRAINT fk_entretien_vehicule
FOREIGN KEY (id_entretien) REFERENCES entretien(id_entretien);

ALTER TABLE entretien_vehicule
ADD CONSTRAINT fk_vehicule_entretien
FOREIGN KEY (immat) REFERENCES vehicule(immat);
