<p align="center">
<img src= "https://user-images.githubusercontent.com/90606431/151769677-b99dbf89-68f6-46b6-9f01-ace009ae7202.jpg" />
</p>

## Projet 7 du parcours de Developpeur Web chez OpenClassrooms.  ##

 Réseau Social Groupomania : projet frontend et backend.
 
<br>

 ## Projet S.E.V.N (MySql, Express, Vue, Node) ##

 <p align="center">
<img src= "https://user-images.githubusercontent.com/90606431/186603198-03e733ce-0d3b-4f0a-9270-b9c613060afb.png"/>
 </p>
 
 
  ## Objectif : ## 

- Construire un réseau social interne pour les employés de Groupomania.
- Choisir la fonctionnalité à développer et fournir un MVP (Minimum Viable Product) pour faciliter les interactions entre collègues dans un cadre plus informel.
- Développer les parties front-end et back-end de l'application.

Ce projet utilisera NodeJs, Express et MySQL pour le backend, et Vue et vite pour le frontend.
<br>

 ## Technologies utilisées : ##
 
- HTML5, CSS3, JavaScript, Node.js, Vue.js, Express, SQL & MySQL, CRUD Operations, OWASP & RGPD Standards.
- Dependances : Bcrypt, Dotenv, Express, Express-rate-limit, Helmet, Jsonwebtoken, Multer, MySql, MySql2, Password-validator.

 <br>
 <br>
 
<p align="center">
<img src= "https://user-images.githubusercontent.com/90606431/151553215-dbe79e1b-6538-49c0-bc56-583cb6b354d5.jpg" />
</p>

 ## Mission : ## 

Le Contexte :

En tant que nouveau developeur de la société, je dois mettre en place un reseau social interne afin de permettre une meilleure cohésion au sein du groupe Groupomania. 
Il m'a été donné carte blanche pour mettre en place le back-end et le front-end avec pour objectif de developer une application proche de Reddit ou 9GAG.

### Cahier des charges  : ###

Voici, les exigences du comité de direction :

- la présentation des fonctionnalités doit être simple.
- la création d’un compte doit être simple et possible depuis un téléphone mobile.
- le profil doit contenir très peu d’informations pour que sa complétion soit rapide.
- la suppression du compte doit être possible.
- l’accès à un forum où les salariés publient des contenus multimédias doit être présent. 
- L’accès à un forum où les salariés publient des textes doit être présent ; les utilisateurs doivent pouvoir facilement repérer les dernières participations des employés ;
- le ou la chargé-e de communication Groupomania doit pouvoir modérer les interactions entre le ou la chargé-e de communication Groupomania doit pouvoir afficher les dernières participations des employés salariés.
- La base de données doit se manipuler avec le language SQL.
- Les données de connexion doivent être sécurisées.
- Le projet doit être inclusif en respectant les standards du WACG.

### Fonctions de la partie User & Modération. ###

L'utilisateur “lambda” doit pouvoir :

- créer un compte avec : nom - prénom - email - mot de passe.
- Se logger à partir de son email & mot de passe.
- Ajouter un avatar .
- L’utilisateur doit pouvoir poster un texte et/ou une image.
- L’utilisateur doit pouvoir modifier ou supprimer son post.
- L’utilisateur doit pouvoir voir les posts des autres utilisateurs et retrouver simplement un post : 
1. Option A : Faire apparaitre les posts du plus récent au plus anciens 
2. Option B : thématique de post 
3. Option C : Intégration d’un bloc “ mes posts commentés”.
- L’utilisateur doit pouvoir liker un post.
- L’utilisateur doit pouvoir commenter un post.

Le modérateur doit pouvoir :

- créer un post.
- supprimer un post.
- supprimer un commentaire.
- Commenter un post.

<br>

 ## Installation des prérequis et lancement de l'application : ##

   ### Installation : ###

Veuillez cloner ce dépôt : il vous fournira les deux dossiers nécessaires : backend et frontend.

- Accès à la base de données :

- Vous devez avoir MySQL installé sur votre ordinateur. Cette application utilise le plugin dotenv pour masquer les données de connexion. 
- Dans le dossier backend, vous trouverez un fichier ".env__", qui vous donnera accès à la base de données MySQL de groupomania. 
- Veuillez d’abord créer dans MySQL une base de données, un utilisateur avec son mot de passe qui aura accès à cette base de données.
- Puis remplissez avec les valeurs correctes pour les variables "DB_DATABASE", "DB_USER" et "DB_PASS", dans le ficher ".env__" et changez son nom en ".env".

   ### Executer l'application : ###

- Vous aurez besoin de deux fenêtres de terminal : une pour le frontend, une pour le backend. 
- Sur le terminal backend : exécutez "npm install, puis "npm start". 
- Le serveur doit fonctionner sur localhost avec le port par défaut 3306. 
- Puis, sur le terminal frontend : lancez "npm install pour installer tous les plugins nécessaires, puis "npm run dev". 
- Le frontend de l'application est visible sur http:// localhost: 3000/.
    
    
    ### L'application :  ###
   
Lancez l'application : ouvrez l'application en cliquant sur http://localhost:3000/

Pour l'Utilisation de l'application : 

- Créez votre compte
- Puis, Accédez au fil d'actualité en vous identifiant.

Sécurité, Conditions pour la création du mot de passe utilisateur :
- Minimum de 8 caractères.
- Devant contenir au moins une majuscule, au moins une minuscule, au moins 2 chiffres, aucun espace.
- Interdiction de ces valeurs : password1234, motdepasse1234.

<br>

 
<p align="center">
<img src= "https://user-images.githubusercontent.com/90606431/151551702-2b52d4ca-f247-4eb4-8f9c-60e1b13ef2ad.jpg"/>
 </p>
 
<br>

 ### Project 7 : Groupomania ###

  ## This is an exercice as part of my developer training for OpenClassrooms : ##


GROUPOMANIA

As a new develloper of the company, I have to set up an internal social network in order to allow a better cohesion within the Groupomania group. I was given carte blanche to set up the back-end and the front-end with the objective to develloper an application close to Reddit or 9GAG.
Context:

## Here are the requirements of the management committee: ##
The presentation of the functionalities must be simple :
- Tthe creation of an account must be simple and possible from a cell phone.
- The profile must contain very little information so that its completion is fast; - the deletion of the account must be possible.
- Access to a forum where employees can publish multimedia content must be available.
- Access to a forum where employees publish texts must be present.
- Users must be able to easily locate the latest contributions of employees.
- The Groupomania communication manager must be able to moderate interactions between employees and the Groupomania communication manager must be able to display the latest employee contributions.
- The database must be manipulated with the SQL language.
- The connection data must be secure.
- The project must be inclusive by respecting the WACG standards.

## Functional reflections on the User & Moderation part: ##

Lambda" user must be able to :
- create an account with : name - first name - email - password. 
- Log in with his email & password.
- Add an avatar (and a description to his profile).
- The user must be able to post a text and/or an image or a link.
- User must be able to edit or delete their post.
        
        
 The user must be able to see the posts of other users and easily find a post: 
-  Option A: Display the posts from the most recent to the oldest .
-  Option B : Post theme 3.option .
-  Option C : Integration of a block "my commented posts.
The user must be able to like a post.
The user must be able to comment a post.

 The moderator must be able to:
- create a post.
- delete a post.
- delete a comment.
- Comment on a post.

## Technologies, software, languages, frameworks, plugins used : ##

- HTML5, CSS3, JavaScript, Node.js, Vue.js, Express, SQL & MySQL, CRUD Operations, OWASP & RGPD Standards.
- Dependances : Bcrypt, Dotenv, Express, Express-rate-limit, Helmet, Jsonwebtoken, Multer, Password-validator.

<br>

## Front-end : How to make this project work. ##

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Vetur]((and disable Volar)

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```
<br>

## Back-end : How to make this project work: 

Pre setup

Complete the env file with your own USER, PASSWORD and JWT_SECRET_TOKEN
Import the database .sql 

Project setup

npm install
npm install -g nodemon

Compiles and hot-reloads for development

nodemon server



<p align="center">
<img src= "https://user-images.githubusercontent.com/90606431/151660985-c0a30670-7d3b-4b86-89fe-566e96a15e79.jpg" />
</p>
