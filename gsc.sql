-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2023 at 08:27 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsc`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id_article` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id_cat` int NOT NULL,
  PRIMARY KEY (`id_article`),
  KEY `id_cat` (`id_cat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article_com`
--

DROP TABLE IF EXISTS `article_com`;
CREATE TABLE IF NOT EXISTS `article_com` (
  `id_contained` int NOT NULL AUTO_INCREMENT,
  `id_article` int NOT NULL,
  `id_com` int NOT NULL,
  `quantite` float NOT NULL,
  PRIMARY KEY (`id_contained`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_cat` int NOT NULL AUTO_INCREMENT,
  `nom_cat` varchar(255) NOT NULL,
  `id_sous_cat` int NOT NULL DEFAULT (NULL),
  PRIMARY KEY (`id_cat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id_com` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `livraion_adresse` varchar(255) NOT NULL,
  `id_user_commander` int NOT NULL,
  PRIMARY KEY (`id_com`),
  KEY `id_user_commander` (`id_user_commander`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
CREATE TABLE IF NOT EXISTS `conversations` (
  `id_con` int NOT NULL AUTO_INCREMENT,
  `id_user1` int NOT NULL,
  `id_user2` int NOT NULL,
  `start_date` datetime DEFAULT (now()),
  PRIMARY KEY (`id_con`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
CREATE TABLE IF NOT EXISTS `discussions` (
  `id_msg` int NOT NULL AUTO_INCREMENT,
  `id_sender` int NOT NULL,
  `id_receiver` int NOT NULL,
  `msg_content` text,
  `send_date` varchar(255) NOT NULL DEFAULT (now()),
  `is_seen` tinyint(1) NOT NULL DEFAULT (NULL),
  PRIMARY KEY (`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id_paie` int NOT NULL AUTO_INCREMENT,
  `montant` float NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `id_user_paie` int NOT NULL,
  `status` varchar(255) DEFAULT (NULL),
  PRIMARY KEY (`id_paie`),
  KEY `id_user_paie` (`id_user_paie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
CREATE TABLE IF NOT EXISTS `personnes` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `nom_mark` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `id_type_article` int NOT NULL,
  `id_role` int NOT NULL,
  `last_seen` datetime DEFAULT (now()),
  `pays` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL DEFAULT (_utf8mb4'default_user_picture.png'),
  PRIMARY KEY (`id_user`),
  KEY `id_type_article` (`id_type_article`),
  KEY `id_role` (`id_role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_article`
--

DROP TABLE IF EXISTS `type_article`;
CREATE TABLE IF NOT EXISTS `type_article` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `libellé` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `type_article`
--

INSERT INTO `type_article` (`id_type`, `libellé`, `description`) VALUES
(1, 'Article numérique', '.......'),
(2, 'Articles Physique', '...........'),
(3, 'Articles Physiques et Numérique', '....................');

-- --------------------------------------------------------

--
-- Table structure for table `vendre`
--

DROP TABLE IF EXISTS `vendre`;
CREATE TABLE IF NOT EXISTS `vendre` (
  `id_v` int NOT NULL AUTO_INCREMENT,
  `id_vendeur` int NOT NULL,
  `id_article` int NOT NULL,
  `prix` float NOT NULL,
  `stock` float NOT NULL,
  PRIMARY KEY (`id_v`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
