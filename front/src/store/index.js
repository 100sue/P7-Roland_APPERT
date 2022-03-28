import { createStore } from 'vuex'

export default createStore({
    state() {
      return {
        user: {
          idUtilisateurs: "",
          nom: "",
          prenom: "",
          email: "",
          image: "",
          isAdmin: ""
        },
      };
    },
    mutations: {
      collectUserInfos(state, { userId, token }) {
        fetch("http://localhost:3000/api/user/" + userId, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: "Bearer " + token,
          },
        })
          .then((res) => res.json())
          .then((res) => {
              state.user.idUtilisateurs = res.result[0].idUtilisateurs
              state.user.nom = res.result[0].nom,
              state.user.prenom = res.result[0].prenom,
              state.user.email = res.result[0].email,
              state.user.image = res.result[0].image,
              state.user.isAdmin = res.result[0].isAdmin;
          })
          .catch((error) => {
            return error;
          });
      },
      resetUserInfos(state) {
          state.user.idUtilisateurs = "",
          state.user.nom  = "",
          state.user.prenom  = "",
          state.user.email = "",
          state.user.image = "",
          state.user.isAdmin = ""
      },
    },
    actions: {
      getUser(context, { userId, token }) {
        context.commit('collectUserInfos', { userId, token })
      }
    },
  })