-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 27 mai 2023 à 21:26
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `magasin`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_cat` int(11) NOT NULL,
  `libelle` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_cat`, `libelle`) VALUES
(1, 'Vetements'),
(2, 'Chaussures'),
(3, 'Accessoires');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_cl` varchar(20) DEFAULT NULL,
  `prenom_cl` varchar(20) DEFAULT NULL,
  `ville_cl` varchar(20) DEFAULT NULL,
  `sexe` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commandachat`
--

CREATE TABLE `commandachat` (
  `id_ca` int(11) NOT NULL,
  `datecomma` date DEFAULT NULL,
  `id_four` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commandvent`
--

CREATE TABLE `commandvent` (
  `id_cv` int(11) NOT NULL,
  `datecomv` date DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `compte_user`
--

CREATE TABLE `compte_user` (
  `id_cmpt` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `id_emp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id_emp` int(11) NOT NULL,
  `nom_emp` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `ville` varchar(20) DEFAULT NULL,
  `sexe` varchar(20) DEFAULT NULL,
  `tele` varchar(20) DEFAULT NULL,
  `salaire` float DEFAULT NULL,
  `date_rec` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_four` int(11) NOT NULL,
  `nom_four` varchar(20) DEFAULT NULL,
  `prenom_four` varchar(20) DEFAULT NULL,
  `ville` varchar(20) DEFAULT NULL,
  `numtele` varchar(10) DEFAULT NULL,
  `nom_entreprise` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_prod` int(11) NOT NULL,
  `libelle` varchar(20) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_cat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `prod_com_achat`
--

CREATE TABLE `prod_com_achat` (
  `id_ca` int(11) DEFAULT NULL,
  `id_prod` int(11) DEFAULT NULL,
  `qte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `prod_com_vent`
--

CREATE TABLE `prod_com_vent` (
  `id_prod` int(11) DEFAULT NULL,
  `id_cv` int(11) DEFAULT NULL,
  `qte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_cat`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commandachat`
--
ALTER TABLE `commandachat`
  ADD PRIMARY KEY (`id_ca`),
  ADD KEY `id_four` (`id_four`);

--
-- Index pour la table `commandvent`
--
ALTER TABLE `commandvent`
  ADD PRIMARY KEY (`id_cv`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `compte_user`
--
ALTER TABLE `compte_user`
  ADD PRIMARY KEY (`id_cmpt`),
  ADD KEY `id_emp` (`id_emp`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id_emp`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_four`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_prod`),
  ADD KEY `id_cat` (`id_cat`);

--
-- Index pour la table `prod_com_achat`
--
ALTER TABLE `prod_com_achat`
  ADD KEY `id_ca` (`id_ca`),
  ADD KEY `id_prod` (`id_prod`);

--
-- Index pour la table `prod_com_vent`
--
ALTER TABLE `prod_com_vent`
  ADD KEY `id_prod` (`id_prod`),
  ADD KEY `id_cv` (`id_cv`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandachat`
--
ALTER TABLE `commandachat`
  MODIFY `id_ca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandvent`
--
ALTER TABLE `commandvent`
  MODIFY `id_cv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte_user`
--
ALTER TABLE `compte_user`
  MODIFY `id_cmpt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id_emp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id_four` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandachat`
--
ALTER TABLE `commandachat`
  ADD CONSTRAINT `commandachat_ibfk_1` FOREIGN KEY (`id_four`) REFERENCES `fournisseur` (`id_four`);

--
-- Contraintes pour la table `commandvent`
--
ALTER TABLE `commandvent`
  ADD CONSTRAINT `commandvent_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `compte_user`
--
ALTER TABLE `compte_user`
  ADD CONSTRAINT `compte_user_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `employe` (`id_emp`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categorie` (`id_cat`);

--
-- Contraintes pour la table `prod_com_achat`
--
ALTER TABLE `prod_com_achat`
  ADD CONSTRAINT `prod_com_achat_ibfk_1` FOREIGN KEY (`id_ca`) REFERENCES `commandachat` (`id_ca`),
  ADD CONSTRAINT `prod_com_achat_ibfk_2` FOREIGN KEY (`id_prod`) REFERENCES `produit` (`id_prod`);

--
-- Contraintes pour la table `prod_com_vent`
--
ALTER TABLE `prod_com_vent`
  ADD CONSTRAINT `prod_com_vent_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `produit` (`id_prod`),
  ADD CONSTRAINT `prod_com_vent_ibfk_2` FOREIGN KEY (`id_cv`) REFERENCES `commandvent` (`id_cv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
