import Vue from 'vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App.vue'
import store from './store'
import router from './router'

import { postRequest } from './utils/api'
import { putRequest } from './utils/api'
import { getRequest } from './utils/api'
import { deleteRequest } from './utils/api'

Vue.use(ElementUI)
// Vue.config.productionTip = false
Vue.prototype.postRequest = postRequest
Vue.prototype.getRequest = getRequest
Vue.prototype.putRequest = putRequest
Vue.prototype.deleteRequest = deleteRequest


// Vue.config.globalProperties.$getRequest = getRequest ;

// router.beforeEach((to,form,next)=>{
//   if(window.sessionStorage.getItem('tokenStr')){
//     if (!window.sessionStorage.getItem('user')){
//       return getRequest('').then(resp=>{
//         if(resp){
//           window.sessionStorage.setItem('user',JSON.stringify(resp));
//           next();
//         }
//       })
//     }
//     next();
//   }else {
//     next();
//   }
// })

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
