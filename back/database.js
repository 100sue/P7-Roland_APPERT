// Imporation mysql 
const mysql = require('mysql2');  

console.log(process.env.USER)
// Création de la connexion à la base de données MySQL
const db = mysql.createConnection ({
    database: "",
    host: '',
    port: 3306,
    password: '',
    user: '',
});

// Connexion à la base de données :

db.connect(function(err) {
    if (err) throw err;
    console.log("Connecté à la base de données MySQL!");
});

module.exports = db;