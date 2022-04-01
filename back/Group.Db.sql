-- Listage de la structure de la base pour groupomania :

DROP DATABASE IF EXISTS `group`;
CREATE DATABASE IF NOT EXISTS `group` ;
USE `group`;


-- Listage de la structure de la table group.utilisateurs :

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT 'http://localhost:3000/images/images.jpg',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_utilisateurs_authority` (`isAdmin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;



-- Listage de la structure de la table group.publications :

DROP TABLE IF EXISTS `publications`;
CREATE TABLE IF NOT EXISTS `publications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `contenu` text,
  `date_ajout` DATETIME NOT NULL,

  PRIMARY KEY (`id`),
  KEY `FK_posts_utilisateurs` (`utilisateur_id`),
  CONSTRAINT `FK_posts_utilisateurs` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


-- Listage de la structure de la table group.commentaires :

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateurs_id` int(11) NOT NULL DEFAULT '0',
  `publications_id` int(11) NOT NULL DEFAULT '0',
  `date_ajout` DATETIME NOT NULL,
  `date_modification` DATETIME NOT NULL,
   `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2_publications_id` (`publications_id`),
  KEY `FK1_utilisateurs_id` (`utilisateurs_id`),
  CONSTRAINT `FK1_id_utilisateurs` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK2_publications_id` FOREIGN KEY (`publications_id`) REFERENCES `publications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;


-- Listage de la structure de la table group.likes :

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateurs_id` int(11) NOT NULL,
  `publications_id` int(11) NOT NULL,
  `vote` varchar(30) NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_utilisateurs_id` (`utilisateurs_id`),
  KEY `FK3_publications_id` (`publications_id`),
  CONSTRAINT `FK1_utilisateurs_id` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK3_publications_id` FOREIGN KEY (`publications_id`) REFERENCES `publications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;