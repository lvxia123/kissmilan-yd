import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import qs from 'qs'
// import XH from './components/KmlHeader'
// import XF from './components/KmlFooter' 
import Top from './components/Top' 
import Vant from 'vant';
import 'vant/lib/index.css';
import "./assets/css/iconfont.css";

// Vue.component("kml-header",XH);
// Vue.component("kml-footer",XF);
Vue.component("Top",Top);
Vue.config.productionTip = false
// 通过Vue.use()方法注册为插件
Vue.use(Vant);
import { Lazyload } from 'vant';
Vue.use(Lazyload);
// 通过Vue.use()
// Vue.use(MintUI);
// 配置axios基础路径
axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.prototype.axios = axios;

axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
Vue.prototype.$qs = qs;

// 配置路由跳转权限
router.beforeEach((to, from, next) => {
  if (to.meta.title){
    document.title = to.meta.title
  }
  const type = to.meta.type
  // 判断该路由是否需要登陆权限
  if(type === 'login'){
    if(window.localStorage.getItem('isLogined')){
      next()
    }else{
      next('/login')
    }
  }else{
    next()
  }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
