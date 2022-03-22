const express = require('express');   
const router = express.Router();
const commentCtrl = require('../controllers/commentCtrl');
const auth = require('../middleware/auth'); 

// Ajouter un commentaire, Supprimer un commentaire, Charger les commentaires d'un post .

router.post('/', auth, commentCtrl.addComment);             
router.delete('/:id', auth, commentCtrl.deleteComment);      
router.get('/:postId', auth, commentCtrl.getPostComments);  

module.exports = router;