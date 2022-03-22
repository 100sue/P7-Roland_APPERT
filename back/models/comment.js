// Importation mysql.
// Création du modèle commentaire.

const mysql = require('mysql2');

const Comment = function(comment) {
    this.id = comment.id;
    this.utilisateur_id = comment.utilisateur_id;
    this.publication_id = comment.publication_id;
    this.date_ajout = comment.date_ajout;
    this.date_modification = comment.date_modification;
    this.message = comment.message;
}

module.exports = Comment;