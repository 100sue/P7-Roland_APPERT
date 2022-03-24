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
  `password` varchar(100) NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT 'http://localhost:3000/images/defaultImages.jpg',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_utilisateurs_authority` (`isAdmin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;



-- Listage de la structure de la table group.publications :

DROP TABLE IF EXISTS `publications`;
CREATE TABLE IF NOT EXISTS `publications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) NOT NULL,
  `message` varchar(300) DEFAULT NULL,
  `contenu ` text,
  `date_ajout` date NOT NULL,

  PRIMARY KEY (`id`),
  KEY `FK_posts_utilisateurs` (`id_utilisateurs`),
  CONSTRAINT `FK_posts_utilisateurs` FOREIGN KEY (`id_utilisateurs`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;


-- Listage de la structure de la table group.commentaires :

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id ` int(11) NOT NULL DEFAULT '0',
  `publication_id` int(11) NOT NULL DEFAULT '0',
  `date_ajout` date NOT NULL,
  `date_modification` date NOT NULL,
   `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2_publications_id` (`publications_id`),
  KEY `FK1_utilisateurs_id` (`utilisateurs_id`),
  CONSTRAINT `FK1_id_utilisateurs` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK2_publications_id` FOREIGN KEY (`publications_id`) REFERENCES `publications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


-- Listage de la structure de la table group.likes :

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `id_publication` int(11) NOT NULL,
  `vote` varchar(30) NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `FK2_post_id` (`id_post`),
  CONSTRAINT `FK1_utilisateur_id` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK2_post_id` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;