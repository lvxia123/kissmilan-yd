import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'

//import HelloWorld from '@/components/HelloWorld'
const originalPush = VueRouter.prototype.push
   VueRouter.prototype.push = function push(location) {
   return originalPush.call(this, location).catch(err => err)
}
Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Index',
    component: Index,
    meta:{
      keepAlive:true
    }
  },
  {
    path: '/login',
    name: 'Login',
    // route level code-splitting
    // this generates a separate chunk (login.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "login" */ '../views/Login.vue'),
    props:true,
    meta:{
      keepAlive:true
    }
  },
  {
    path: '/goods/:lid',
    name: 'Goods',
    // route level code-splitting
    // this generates a separate chunk (goods.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "goods" */ '../views/Goods.vue'),
    props:true,
    meta:{
      keepAlive:true
    }
  },
  {
    path: '/detail/:lid',
    name: 'Detail',
    // route level code-splitting
    // this generates a separate chunk (detail.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "detail" */ '../views/Detail.vue'),
    props:true,
    meta:{
      keepAlive:true
    }
  },
  {
    path: '/product/:value',
    name: 'Product',
    // route level code-splitting
    // this generates a separate chunk (product.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "product" */ '../views/product.vue'),
    props:true,
    meta:{
      keepAlive:false
    }
  },
  {
    path: '/reg',
    name: 'Reg',
    // route level code-splitting
    // this generates a separate chunk (reg.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "reg" */ '../views/Reg.vue'),
    props:true,
    meta:{
      keepAlive:true
    }
  },
  {
    path: '/user',
    name: 'User',
    meta: {
      title: '用户中心',
      type: 'login'
    },
    // route level code-splitting
    // this generates a separate chunk (user.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "user" */ '../views/User.vue'),
    props:true,
    meta:{
      keepAlive:true
    }
  },
  {
    path: '/user/order',
    name: 'Order',
    meta: {
      title: '用户中心',
      type: 'login'
    },
    // route level code-splitting
    // this generates a separate chunk (order.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "order" */ '../views/Order.vue'),
    props:true,
    meta:{
      keepAlive:true
    }
  },
  {
    path: '/user/set',
    name: 'Set',
    meta: {
      title: '用户中心',
      type: 'login'
    },
    // route level code-splitting
    // this generates a separate chunk (set.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "set" */ '../views/UserSet.vue'),
    props:true,
    meta:{
      keepAlive:true
    }
  },
  {
    path: '/cart',
    name: 'Cart',
    // route level code-splitting
    // this generates a separate chunk (reg.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "reg" */ '../views/Cart.vue'),
    props:true,
    meta:{
      keepAlive:true
    }
  },
 
]

const router = new VueRouter({
  routes
})

export default router
