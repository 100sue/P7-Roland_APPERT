import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";


const app = createApp(App)

app.directive("click-outside", {
  mounted(el, binding) {
    el.clickOutsideEvent = function (event) {
      if (!(el == event.target || el.contains(event.target))) {
        binding.value(event, el);
      }
    };
    document.body.addEventListener("click", el.clickOutsideEvent);
  },
  unmounted: function (el) {
    document.body.removeEventListener("click", el.clickOutsideEvent);
  },
});



app.use(router);
app.mount("#app");
