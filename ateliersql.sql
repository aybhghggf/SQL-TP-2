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


----- Requette Insert
INSERT INTO conducteur (Nom, Prenom, DateNaissance) VALUES
('Dupont', 'Jean', '1985-06-15'),
('Martin', 'Sophie', '1990-11-22'),
('Lemoine', 'Pierre', '1978-03-09'),
('Bernard', 'Claire', '1988-12-01'),
('Durand', 'Paul', '1992-08-30');
INSERT INTO entretien (Nom_entretien, frequence, periode, kilometrage, montant) VALUES
('Vidange', 'Tous les 6 mois', '6 mois', 10000, 70),
('Changement filtre', 'Annuel', '12 mois', 15000, 50),
('Contrôle technique', 'Biennal', '24 mois', 0, 90),
('Remplacement freins', 'Tous les 2 ans', '24 mois', 30000, 200),
('Recharge climatisation', 'Tous les 3 ans', '36 mois', 0, 100);
INSERT INTO vehicule (immat, marque, modele, puissance, carburant, DateAchat, id_conducteur) VALUES
('AA-123-AA', 'Peugeot', '208', 110, 'Essence', '2021-04-10', 1),
('BB-456-BB', 'Renault', 'Clio', 90, 'Diesel', '2020-06-20', 2),
('CC-789-CC', 'Citroen', 'C4', 130, 'Essence', '2022-01-15', 3),
('DD-321-DD', 'Toyota', 'Yaris', 100, 'Hybride', '2023-05-12', 4),
('EE-654-EE', 'Ford', 'Focus', 120, 'Diesel', '2019-09-01', 5);
INSERT INTO entretien_vehicule (id_entretien, immat, DateEntretien, Compteur) VALUES
(1, 'AA-123-AA', '2022-10-10', 10000),
(2, 'AA-123-AA', '2023-04-10', 15000),
(3, 'BB-456-BB', '2022-06-20', 30000),
(4, 'DD-321-DD', '2024-05-12', 25000),
(5, 'EE-654-EE', '2023-09-01', 45000);

