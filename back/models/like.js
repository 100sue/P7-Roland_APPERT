// Importation mysql .
// Création du modèle like

const mysql = require('mysql2');

const Like = function (like) {
    this.id = like.id;
    this.utilisateur_id = like.utilisateur_id;
    this.publication_id = like.publication_id;
    this.vote = like.vote;
}

module.exports = Like;