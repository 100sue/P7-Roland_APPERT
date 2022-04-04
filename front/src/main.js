import { createApp, h } from "vue";
import App from "./App.vue";
import router from "./router";


const app = createApp({ 
  render: () => h(App) 
});

app.directive("click-outside", {
  mounted(el, binding, vnode) {
    el.clickOutsideEvent = function (event) {
      if (!(el == event.target || el.contains(event.target))) {
        vnode.context[binding.expression](event, el);
      }
    };
    document.body.addEventListener("click", el.clickOutsideEvent);
  },
  unbind: function (el) {
    document.body.removeEventListener("click", el.clickOutsideEvent);
  },
});



app.use(router);
app.mount("#app");
