-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 18 fév. 2020 à 22:31
-- Version du serveur :  10.4.6-MariaDB
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ocpizzav2`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `telephone` varchar(15) NOT NULL,
  `voie` varchar(80) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `commune` varchar(80) NOT NULL,
  `numero_employe` int(11) DEFAULT NULL,
  `numero_client` int(11) DEFAULT NULL,
  `ID_adresse` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_adresse`),
  KEY `employe_adresse_fk` (`numero_employe`),
  KEY `client_adresse_fk` (`numero_client`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`telephone`, `voie`, `code_postal`, `commune`, `numero_employe`, `numero_client`, `ID_adresse`) VALUES
('0697651346', ' 13 boulevard Foch', '75000', 'Paris', 10, NULL, 1),
('0641859641', ' 135 rue des grandes portes', '75000', 'Paris', 8, NULL, 2),
('0613659845', ' 18 rue des petites maisons', '75000', 'Paris', 9, NULL, 3),
('0614628545', ' 19 rue du garde-corps', '75000', 'Paris', 6, NULL, 4),
('0665328965', ' 25 rue de Paris', '78000', 'Versaille', 2, NULL, 5),
('0635469823', ' 265 rue du Lavoir', '75000', 'Paris', 4, NULL, 6),
('0636854325', ' 36 bis rue de Victor Hugo', '75000', 'Paris', 3, NULL, 7),
('0658285445', ' 55 rue du papillon', '75000', 'Paris', 7, NULL, 8),
('0636854565', ' 8 rue du confort', '75000', 'Paris', 1, NULL, 9),
('0645238965', ' 97 rue des animaux', '75000', 'Paris', 5, NULL, 10),
('0466239865', '113 rue de la pomme', '33000', 'Bordeaux', NULL, 10, 11),
('0434657823', '122 boulevard du Général Clémenceau', '69000', 'Lyon', NULL, 7, 12),
('0132459865', '136 boulevard de courcelle', '75000', 'Paris', NULL, 2, 13),
('0145456965', '18 rue du garage', '75000', 'Paris', NULL, 12, 14),
('0466239865', '2 quai du Rhône', '69000', 'Lyon', NULL, 6, 15),
('0156428596', '2 rue du bourg', '75000', 'Paris', NULL, 1, 16),
('0423568947', '27 bis rue de la paix', '13000', 'Marseille', NULL, 5, 17),
('0466239865', '35 rue de la gare', '69000', 'Lyon', NULL, 8, 18),
('0425369645', '38 rue du Port', '13000', 'Marseille', NULL, 3, 19),
('0135639865', '4 rue de la patte', '75000', 'Paris', NULL, 11, 20),
('0466239865', '68 rue du pain', '33000', 'Bordeaux', NULL, 9, 21),
('0485246985', '75 rue du soleil', '13000', 'Marseille', NULL, 4, 22);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `numero_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `points` int(11) NOT NULL,
  `mail` varchar(80) NOT NULL,
  `mdp` varchar(80) NOT NULL,
  `entree` date NOT NULL,
  `ID_pizzeria` int(11) NOT NULL,
  PRIMARY KEY (`numero_client`),
  KEY `pizzeria_client_fk` (`ID_pizzeria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`numero_client`, `nom`, `prenom`, `points`, `mail`, `mdp`, `entree`, `ID_pizzeria`) VALUES
(1, 'Dupont', 'Jean', 0, 'jean@hotmail.fr', 'm2YF8ggA9', '2018-04-02', 1),
(2, 'Desparts', 'Fabrice', 10, 'fabrice@yahoo.fr', 'pQy6y9S7K', '2018-04-02', 1),
(3, 'Okissi', 'Yacine', 10, 'yacine@hotmail.fr', 'r3EJk6D6v', '2018-04-05', 2),
(4, 'Lamarche', 'Aurélie', 10, 'aurélie@yahoo.fr', 'pQy6y9S7K', '2018-04-03', 2),
(5, 'Perret', 'Julie', 10, 'julie@yahoo.fr', 'pQy6y9S7K', '2018-04-07', 2),
(6, 'Lafeuille', 'Rémy', 10, 'remy@yahoo.fr', 'pQy6y9S7K', '2018-04-02', 3),
(7, 'Courterelle', 'Fabien', 10, 'fabien@yahoo.fr', 'pQy6y9S7K', '2018-04-06', 3),
(8, 'Bernard', 'Gaëlle', 10, 'gaelle@yahoo.fr', 'pQy6y9S7K', '2018-04-06', 3),
(9, 'Pirset', 'Thomas', 10, 'thomas@yahoo.fr', 'pQy6y9S7K', '2018-04-07', 4),
(10, 'Foulard', 'Nicolas', 10, 'nicolas@yahoo.fr', 'pQy6y9S7K', '2018-04-05', 4),
(11, 'Ben Mahssad', 'Mohamed', 10, 'mohammed@yahoo.fr', 'pQy6y9S7K', '2018-04-03', 5),
(12, 'Al hadis', 'Fatima', 10, 'fatima@yahoo.fr', 'pQy6y9S7K', '2018-04-03', 5);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `numero_commande` int(11) NOT NULL,
  `ID_pizzeria` int(11) NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `etat` varchar(40) NOT NULL,
  `paiement` varchar(40) NOT NULL,
  `numero_client` int(11) NOT NULL,
  KEY `pizzeria_commande_fk` (`ID_pizzeria`),
  KEY `client_commande_fk` (`numero_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`numero_commande`, `ID_pizzeria`, `date`, `heure`, `montant`, `etat`, `paiement`, `numero_client`) VALUES
(1, 1, '2019-04-02', '20:14:00', '23.80', 'préparation', 'en ligne', 2),
(2, 2, '2019-06-26', '12:35:42', '52.50', 'livraison', 'ligne', 3),
(3, 3, '2019-06-02', '13:15:23', '28.80', 'validé', 'ligne', 7),
(4, 5, '2019-06-28', '19:32:53', '13.70', 'préparation', 'reception', 11),
(5, 4, '2019-05-10', '20:02:00', '112.00', 'livrée', 'ligne', 10);

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `numero_employe` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `poste` varchar(80) NOT NULL,
  `entree` date NOT NULL,
  `sortie` date DEFAULT NULL,
  `ID_pizzeria` int(11) NOT NULL,
  PRIMARY KEY (`numero_employe`),
  KEY `pizzeria_livreur_fk` (`ID_pizzeria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`numero_employe`, `nom`, `prenom`, `poste`, `entree`, `sortie`, `ID_pizzeria`) VALUES
(1, 'Dupont', 'Jean', 'manager', '2018-03-23', NULL, 1),
(2, 'Charbonnier', 'Margaux', 'cuisinier', '2018-03-26', NULL, 1),
(3, 'Tommier', 'Estéban', 'livreur', '2018-03-26', NULL, 1),
(4, 'Addadi', 'Hicham', 'vendeur', '2018-03-27', NULL, 2),
(5, 'Perrini', 'Sylvain', 'livreur', '2018-03-28', NULL, 1),
(6, 'Adamo', 'Cédric', 'cuisinier', '2018-03-28', NULL, 2),
(7, 'Seigneur', 'Cristopher', 'vendeur', '2018-03-29', NULL, 1),
(8, 'Laval', 'Jessica', 'livreur', '2018-03-29', NULL, 2),
(9, 'Carapate', 'Moussa', 'livreur', '2018-03-29', NULL, 1),
(10, 'Castagnette', 'Philippe', 'livreur', '2018-03-30', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `ID_pizzeria` int(11) NOT NULL,
  `reference` varchar(15) NOT NULL,
  `nom_produit` varchar(80) DEFAULT NULL,
  `nom_ingredient` varchar(80) DEFAULT NULL,
  `categorie_ingredient` varchar(80) NOT NULL,
  PRIMARY KEY (`ID_pizzeria`,`reference`),
  KEY `produit_ingredients_fk` (`nom_produit`),
  KEY `stock_ingredients_fk` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`ID_pizzeria`, `reference`, `nom_produit`, `nom_ingredient`, `categorie_ingredient`) VALUES
(1, 'b0001', 'badoit', NULL, 'boisson'),
(1, 'b0002', 'coca_cola', NULL, 'boisson'),
(1, 'f0001', NULL, 'gorgonzola', 'fromage'),
(1, 'f0002', NULL, 'mozzarella', 'fromage'),
(1, 'f0003', NULL, 'chêvre', 'fromage'),
(1, 'f0004', NULL, 'cheddar', 'fromage'),
(1, 'l0001', NULL, 'oignon', 'légume'),
(1, 'l0002', NULL, 'pomme de terre', 'légume'),
(1, 's0001', NULL, 'sauce tomate', 'sauce'),
(1, 's0002', NULL, 'crème fraîche', 'sauce'),
(1, 'v0001', NULL, 'lardon', 'viande'),
(2, 'b0001', 'badoit', NULL, 'boisson'),
(2, 'b0002', 'coca_cola', NULL, 'boisson'),
(3, 'b0001', 'badoit', NULL, 'boisson'),
(3, 'b0002', 'coca_cola', NULL, 'boisson'),
(4, 'b0001', 'badoit', NULL, 'boisson'),
(4, 'b0002', 'coca_cola', NULL, 'boisson'),
(5, 'b0001', 'badoit', NULL, 'boisson'),
(5, 'b0002', 'coca_cola', NULL, 'boisson');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `ID_lgcommande` int(11) NOT NULL,
  `numero_commande` int(11) NOT NULL,
  `nom_produit` varchar(80) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_lgcommande`),
  KEY `produit_ligne_commande_fk` (`nom_produit`,`ID_lgcommande`),
  KEY `ingredients_ligne_commande_fk` (`ID_lgcommande`),
  KEY `commande_ligne_commande_fk` (`numero_commande`,`ID_lgcommande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`ID_lgcommande`, `numero_commande`, `nom_produit`, `quantite`, `prix`, `total`) VALUES
(1, 1, 'badoit', 2, '2.50', '5.00'),
(2, 1, '4 fromages', 2, '8.90', '17.80');

-- --------------------------------------------------------

--
-- Structure de la table `pizzeria`
--

DROP TABLE IF EXISTS `pizzeria`;
CREATE TABLE IF NOT EXISTS `pizzeria` (
  `ID_pizzeria` int(11) NOT NULL AUTO_INCREMENT,
  `voie` varchar(80) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `commune` char(80) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(80) NOT NULL,
  PRIMARY KEY (`ID_pizzeria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pizzeria`
--

INSERT INTO `pizzeria` (`ID_pizzeria`, `voie`, `code_postal`, `commune`, `telephone`, `email`) VALUES
(1, '30 rue de la paix', '75000', 'Paris', '0165983547', 'ocpizzaparis@ocpizza.com'),
(2, '15 bis rue du vieux port', '13000', 'Marseille', '0965856324', 'ocpizzamarseille@ocpizza.fr'),
(3, '78 boulevard du général Leclerc', '69000', 'Lyon', '0956237845', 'ocpizzalyon@ocpizza.fr'),
(4, '145 place de la république', '33000', 'Bordeaux', '0965856324', 'ocpizzabordeaux@ocpizza.fr'),
(5, '36 boulevard de la liberté', '75000', 'Paris', '0918629874', 'ocpizzaparisliberte@ocpizza.fr');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `nom_produit` varchar(80) NOT NULL,
  `categorie_produit` varchar(20) NOT NULL,
  `aide_memoire` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`nom_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`nom_produit`, `categorie_produit`, `aide_memoire`) VALUES
('4 fromages', 'pizza', '- mettre sur la pate la sauce tomate \r\n- mettre du gorgonzola, de la mozzarella, du cheddar et du chêvre \r\n- mettre au four pendant 5 minutes à 200C°'),
('badoit', 'boisson', NULL),
('coca_cola', 'boisson', NULL),
('coca_cola light', 'boisson', NULL),
('ice_tea', 'boisson', NULL),
('montagnarde', 'pizza', '- mettre de la crème fraiche sur la pate - mettre des pommes de terre - mettre des lardons - mettre des oignons - mettre dans le four 7 minutes à 220C°'),
('mousse au chocolat', 'dessert', NULL),
('orangina', 'boisson', NULL),
('tiramissu', 'dessert', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `ID_pizzeria` int(11) NOT NULL,
  `reference` varchar(15) NOT NULL,
  `prix_achat` decimal(10,2) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`ID_pizzeria`,`reference`),
  KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`ID_pizzeria`, `reference`, `prix_achat`, `quantite`) VALUES
(1, 'b0001', '500.00', 1000),
(1, 'b0002', '450.00', 1000),
(1, 'f0001', '10.00', 2000),
(1, 'f0002', '12.00', 2000),
(1, 'f0003', '14.00', 2000),
(1, 'f0004', '8.00', 2000),
(1, 'l0001', '3.00', 5000),
(1, 'l0002', '5.00', 10000),
(1, 's0001', '10.00', 10000),
(1, 's0002', '7.00', 10000),
(1, 'v0001', '15.00', 5000),
(2, 'b0001', '500.00', 1000),
(2, 'b0002', '450.00', 1000),
(2, 'f0001', '15.00', 2500),
(2, 'f0002', '24.00', 4000),
(2, 'f0003', '21.00', 4000),
(2, 'f0004', '16.00', 4000),
(2, 'l0001', '6.00', 10000),
(2, 'l0002', '10.00', 20000),
(2, 's0001', '5.00', 5000),
(2, 's0002', '10.50', 15000),
(2, 'v0001', '15.00', 5000),
(3, 'b0001', '500.00', 1300),
(3, 'b0002', '450.00', 1150),
(3, 'f0001', '12.00', 2200),
(3, 'f0002', '18.00', 3000),
(3, 'f0003', '7.00', 1000),
(3, 'f0004', '16.00', 4000),
(3, 'l0001', '9.00', 15000),
(3, 'l0002', '15.00', 30000),
(3, 's0001', '20.00', 20000),
(3, 's0002', '21.00', 30000),
(3, 'v0001', '30.00', 10000),
(4, 'b0001', '500.00', 1200),
(4, 'b0002', '450.00', 1200),
(4, 'f0001', '30.00', 6000),
(4, 'f0002', '36.00', 6000),
(4, 'f0003', '42.00', 6000),
(4, 'f0004', '24.00', 6000),
(4, 'l0001', '9.00', 15000),
(4, 'l0002', '15.00', 30000),
(4, 's0001', '30.00', 30000),
(4, 's0002', '21.00', 30000),
(4, 'v0001', '15.00', 5000),
(5, 'b0001', '500.00', 1250),
(5, 'b0002', '450.00', 1100),
(5, 'f0001', '10.00', 2000),
(5, 'f0002', '12.00', 2000),
(5, 'f0003', '14.00', 2000),
(5, 'f0004', '4.00', 1000),
(5, 'l0001', '4.50', 7500),
(5, 'l0002', '5.00', 10000),
(5, 's0001', '8.00', 8000),
(5, 's0002', '7.00', 10000),
(5, 'v0001', '30.00', 10000);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `client_adresse_fk` FOREIGN KEY (`numero_client`) REFERENCES `client` (`numero_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `employe_adresse_fk` FOREIGN KEY (`numero_employe`) REFERENCES `employe` (`numero_employe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `pizzeria_client_fk` FOREIGN KEY (`ID_pizzeria`) REFERENCES `pizzeria` (`ID_pizzeria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `client_commande_fk` FOREIGN KEY (`numero_client`) REFERENCES `client` (`numero_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pizzeria_commande_fk` FOREIGN KEY (`ID_pizzeria`) REFERENCES `pizzeria` (`ID_pizzeria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `pizzeria_livreur_fk` FOREIGN KEY (`ID_pizzeria`) REFERENCES `pizzeria` (`ID_pizzeria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `produit_ingredients_fk` FOREIGN KEY (`nom_produit`) REFERENCES `produit` (`nom_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `stock_ingredients_fk` FOREIGN KEY (`reference`) REFERENCES `stock` (`reference`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `pizzeria_stock_fk` FOREIGN KEY (`ID_pizzeria`) REFERENCES `pizzeria` (`ID_pizzeria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
