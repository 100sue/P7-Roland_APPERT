const express = require('express');  
const router = express.Router();
const likeCtrl = require('../controllers/likeCtrl');
const auth = require('../middleware/auth'); 

// Liker une publication :

router.post('/', auth, likeCtrl.addLike);     

module.exports = router;