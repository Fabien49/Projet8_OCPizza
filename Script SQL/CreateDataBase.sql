
CREATE TABLE produit (
                nom_produit VARCHAR(80) NOT NULL,
                aide_memoire VARCHAR(500),
                PRIMARY KEY (nom_produit)
);


CREATE TABLE pizzeria (
                ID_pizzeria INT AUTO_INCREMENT NOT NULL,
                voie VARCHAR(80) NOT NULL,
                code_postal VARCHAR(10) NOT NULL,
                commune CHAR(80) NOT NULL,
                telephone VARCHAR(15) NOT NULL,
                email VARCHAR(80) NOT NULL,
                PRIMARY KEY (ID_pizzeria)
);


CREATE TABLE stock (
                reference VARCHAR(15) NOT NULL,
                ID_pizzeria INT NOT NULL,
                prix_achat DECIMAL(12,2) NOT NULL,
                quantite INT NOT NULL,
                PRIMARY KEY (reference)
);


CREATE TABLE ingredients (
                reference VARCHAR(15) NOT NULL,
                nom_produit VARCHAR(80),
                nom_ingredient VARCHAR(80),
                categorie VARCHAR(80) NOT NULL,
                PRIMARY KEY (reference)
);


CREATE TABLE employe (
                numero_employe INT NOT NULL,
                nom VARCHAR(80) NOT NULL,
                prenom VARCHAR(80) NOT NULL,
                poste VARCHAR(80) NOT NULL,
                entree DATE NOT NULL,
                sortie DATE,
                ID_pizzeria INT NOT NULL,
                PRIMARY KEY (numero_employe)
);


CREATE TABLE client (
                numero_client INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(80) NOT NULL,
                prenom VARCHAR(80) NOT NULL,
                points INT NOT NULL,
                mail VARCHAR(80) NOT NULL,
                mdp VARCHAR(80) NOT NULL,
                entree DATE NOT NULL,
                ID_pizzeria INT NOT NULL,
                PRIMARY KEY (numero_client)
);


CREATE TABLE adresse (
                ID_adresse INT AUTO_INCREMENT NOT NULL,
                code_postal VARCHAR(10) NOT NULL,
                telephone VARCHAR(15) NOT NULL,
                voie VARCHAR(80) NOT NULL,
                commune VARCHAR(80) NOT NULL,
                numero_employe INT,
                numero_client INT,
                PRIMARY KEY (ID_adresse)
);


CREATE TABLE commande (
                numero_commande INT NOT NULL,
                ID_pizzeria INT NOT NULL,
                date DATE NOT NULL,
                heure TIME NOT NULL,
                montant DECIMAL(4,2) NOT NULL,
                etat VARCHAR(40) NOT NULL,
                paiement VARCHAR(40) NOT NULL,
                numero_client INT NOT NULL,
                PRIMARY KEY (numero_commande)
);


CREATE TABLE ligne_commande (
                ID_lgcommande INT NOT NULL,
                numero_commande INT NOT NULL,
                nom_produit VARCHAR(80) NOT NULL,
                quantite INT NOT NULL,
                prix DECIMAL(4,2) NOT NULL,
                total DECIMAL(4,2) NOT NULL,
                PRIMARY KEY (ID_lgcommande)
);


ALTER TABLE ligne_commande ADD CONSTRAINT produit_ligne_commande_fk
FOREIGN KEY (nom_produit)
REFERENCES produit (nom_produit)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ingredients ADD CONSTRAINT produit_ingredients_fk
FOREIGN KEY (nom_produit)
REFERENCES produit (nom_produit)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT pizzeria_commande_fk
FOREIGN KEY (ID_pizzeria)
REFERENCES pizzeria (ID_pizzeria)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE client ADD CONSTRAINT pizzeria_client_fk
FOREIGN KEY (ID_pizzeria)
REFERENCES pizzeria (ID_pizzeria)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE employe ADD CONSTRAINT pizzeria_livreur_fk
FOREIGN KEY (ID_pizzeria)
REFERENCES pizzeria (ID_pizzeria)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (ID_pizzeria)
REFERENCES pizzeria (ID_pizzeria)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ingredients ADD CONSTRAINT stock_ingredients_fk
FOREIGN KEY (reference)
REFERENCES stock (reference)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE adresse ADD CONSTRAINT employe_adresse_fk
FOREIGN KEY (numero_employe)
REFERENCES employe (numero_employe)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (numero_client)
REFERENCES client (numero_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (numero_client)
REFERENCES client (numero_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ligne_commande ADD CONSTRAINT commande_ligne_commande_fk
FOREIGN KEY (numero_commande)
REFERENCES commande (numero_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION;