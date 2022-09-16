import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Wall from'../views/Wall.vue'
import Profil from '../views/Profil.vue'
import Community from '../views/Community.vue'
import ModifyPost from '../views/ModifyPost.vue'



const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/wall',
    name: 'Wall',
    component: Wall
  },
  {
    path: '/profil',
    name: 'Profil',
    component: Profil
  },
  {
    path: '/community',
    name: 'Community',
    component: Community
  },
  {
    path: '/modifyPost/:id',
    name: 'ModifyPost',
    component: ModifyPost
  }
]


const router = new createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, from, next) => {
  const publicPages = ['/login', '/signup', '/'];
  const authRequired = !publicPages.includes(to.path);
  const loggedIn = localStorage.getItem('userId');
  if (authRequired && !loggedIn) {
    next('/login');
  } else {
    next();
  }
});


export default router