// Importation du modèle de publications .
// Importation de la BDD.

const Comment = require('../models/comment');
const db = require('../database');


// Ajout d'un nouveau commentaire :
// Préparation de la requête SQL.
// Envoi de la requête à la BDD.

exports.addComment = (req, res, next) => {
    let sqlCreateComment = `INSERT INTO commentaires (utilisateur_id, publication_id, message) VALUES ('${req.userId}', '${req.body.postId}', '${req.body.message}')`;
    db.query(sqlCreateComment, (error, publication) => {
        if (!error) {
            res.status(201).json({ message: "Commentaire ajouté !" });
        } else {
            res.status(400).json({ message: "Erreur lors de l'ajout du commentaire !" });
        }
    }); 
}

// Suppression d'un commentaire :
// Recherche du commentaire via son id avant suppression.
// Si le commentaire n'a pas été trouvé.
// Si l'id correspond, suppression du commentaire.

exports.deleteComment = (req, res, next) => {
    const id = req.params.id;
    db.query(`DELETE FROM commentaires WHERE id = ?`, id, (error, result) => {
        if (error) {
            return res.status(400).json({ error: 'Commentaire non trouvé' });
        }
        return res.status(204).end();
    });
};

// Chargement des commentaires d'une publication :
// Si les commentaires n'ont pas été trouvés.
// Si les commentaires ont été trouvés, affichage de tous les commentaires.


exports.getPostComments = (req, res, next) => {
    const id = req.params.postId;
    db.query(`SELECT commentaires.*, utilisateurs.nom, utilisateurs.prenom, utilisateurs.image, 
    IF(commentaires.utilisateur_id = ${req.userId} OR "${req.status}" = "admin", 1, 0) AS editable FROM commentaires
    JOIN utilisateurs ON commentaires.utilisateur_id = utilisateurs.id
    WHERE publication_id = ?`, id, (error, result) => {
        if (error) {
            return res.status(400).json({ error: 'Commentaires non trouvés'});
        }
        return res.status(200).json(result);
    });
};