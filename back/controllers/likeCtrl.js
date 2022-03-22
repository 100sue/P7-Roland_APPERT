// Importation du modèle de likes.
// Imporatiton de la BDD.

const Like = require('../models/like');
const db = require('../database');


// Ajout d'un like :
// Préparation de la requête SQL.
// Envoi de la requête à la BDD.
// L'utilisateur souhaite annuler son like

exports.addLike = (req, res) => {
    let sqlCreateLike = `INSERT INTO likes (utilisateur_id, publication_id) VALUES ('${req.userId}', '${req.body.postId}')`;
    db.query(sqlCreateLike, (error, publication) => {
        if (!error) {
            res.status(201).json({ message: "Like ajouté !" });
        } else { 
            let sqlDeleteLike = `DELETE FROM likes WHERE utilisateur_id = ${req.userId} AND publication_id = ${req.body.postId}`;
            db.query(sqlDeleteLike, (errorDelete, publication) => {
                if (!errorDelete) {
                    res.status(204).end();
                    return;
                }
                res.status(400).json({ message: "Erreur lors de l'ajout du like !" });
            })
        }
    }); 
}
