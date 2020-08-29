import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogined: localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : false,
    uid: localStorage.getItem('uid') || 0,
    phone: localStorage.getItem('phone') || '',
    nickname: localStorage.getItem('nickname') || '',
    uname: localStorage.getItem('uname') || '',
    email: localStorage.getItem('email') || '',
    gender: localStorage.getItem('gender') || '',
    birthday: localStorage.getItem('birthday') || '',
    // JSON.parse 将JSON字符串转换为对象
    cart: JSON.parse(localStorage.getItem('cart')||'[]')
  },
  getters:{
    //用来获取右上角加入购物车的数量(有多少条)，总数量c
    getAllCount(state){
      var count =0;
      state.cart.forEach(item=>{
        count++;
      })
      return count;
      },
    getCart(state){
      return state.cart
    },
  },
  mutations: {
    logined_mutations:(state,payload)=>{
      //将用户登录状态改为真
      state.isLogined = true;
    },
    logout_mutations:(state)=>{
      //将用户登录状态改为假
      state.isLogined = false;
      //清理掉webStroage
      localStorage.clear();
      state.cart=[];
    },
    addToCart:(state,goods)=>{
      // 定义一个flag,设置flase,表示未找到数据
      let flag=false;
      state.cart.forEach(item =>{
        if(item.cid==goods.cid){
          item.count+=parseInt(goods.count)
          flag=true;
          return true;
        }
      });
      // 如果整个循环结束,得到的flag还是false,则直接给添加商品
      if(!flag){
        state.cart.push(goods)
      }
      // 把cart中的值传到localstronge中   JSON.stringify()将JSON对象转为字符串
      localStorage.setItem('cart',JSON.stringify(state.cart))
    },
    // 删除商品
    delCart(state,goods){
      // 判断是否为全部选中
      let result1=state.cart.every(function(value){
        return value.is_checked==true 
      });  //全部选中清除购物车
      if(result1){
        state.cart = []
        localStorage.setItem('cart',JSON.stringify(state.cart));
        location.reload();
      }  //否则判断那一项被选中，删除选中项
      else{
        state.cart.forEach((item,index) => {
          if(item.is_checked==true ){
            console.log(index,goods.cid)
            state.cart.splice(index,1)
          }
        })
      }  
    },
     // 用户结算后清空前端购物车缓存
     clearCart(state){
      state.cart = []
      //把cart 存储到本地的localstorage里面
      localStorage.setItem('cart',JSON.stringify(state.cart))
      location.reload();
    }
  },
  actions: {
  },
  modules: {
  }
})
