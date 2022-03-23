<template>
    <section class="login-container">

        <h1>Identifiez-vous</h1>

        <!-- Formulaire de connexion -->
        <form class="form-card" v-on:submit.prevent="envoiForm">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" v-model="formData.email" id="email" class="form-control" aria-invalid="false" required>
                <div class="form-err"></div>
            </div>
            <div class="form-group">
                <label for="password">Mot de passe</label>
                <input type="password" v-model="formData.password" id="password" class="form-control" aria-invalid="false" required>
                <div class="form-err"></div>
            </div>
            <button class="form-btn">Se connecter</button>
        </form>

        <div class="sign-card">
            <p>Pas encore inscrit ? <a href="" @click.prevent="changeForm(true)">Créez un compte !</a></p>
        </div>

    </section>
</template>


<script>
    import axios from 'axios'; 
    export default {
        name: 'Login',
        props: {
            changeForm: Function 
        },
        data() {
            return {
                formData: {
                    email: '',
                    password: ''
                },
                registerActive: false,
            }
        },
        methods: {
            // Login de l'utilisateur à son compte 
            envoiForm() {
                axios.post('http://localhost:3000/api/users/login', {
                    email: this.formData.email,
                    password: this.formData.password
                })
                .then ( (response) => {
                    localStorage.setItem('id',response.data.userId) 
                    localStorage.setItem('token',response.data.token) 
                    localStorage.setItem('email',response.data.email) 
                    this.$router.push({ name:'Wall' }); 
                })
                .catch(() => {
                    window.alert("Identifiant ou mot de passe incorrect");
                });    
            }  
        },
    }
    
</script>


<style scoped>
    * {
        font-family: 'Titillium Web', sans-serif;
        background-color: #315EF0;
        border-radius: 5px;
    }
    .login-container {
        padding: 0.5%;
    }
    h1 {
        text-align: center;
        font-size: 2em;
        color: white;
    }
    .form-card {
        margin-left: 5%;
        margin-right: 5%;
    }
    .form-group {
        display: flex;
        flex-direction: column;
    }
    input {
        margin-bottom: 3%;
        height: 2rem;
    }
    .form-btn {
        width: 100%;
        margin-top: 3%;
        background-color: #FD340A;
        color: white;
        height: 3em;
        border-radius: 10px;
        font-size: 18px;
    }
    .sign-card {
        font-style: italic;
        text-align: center;
        color: white;
    }
    /* Small device (smartphone, to 767px max) */
    @media screen and (max-width: 767px) {
        h1 {
            font-size: 1.5em;
        } 
    }
</style>