<template>
    <div class="cart">
      <!-- 头部 -->
      <div>
        <van-nav-bar
         title="购物车"
         left-text=""
         right-text="按钮"
         left-arrow
         @click-left="onClickLeft"
         @click-right="onClickRight"
        >
          <template #right>
            <van-icon name="delete" size="24" />
          </template>
        </van-nav-bar>
      </div>
      <!-- 购物车商品详情 -->
      <div v-for="(item,index) of cartItem" :key="index">
        <van-card
          :price="item.price.toFixed(2)"
          :desc="item.spec"
          :title="item.title"
          :thumb="item.pic"
        >
          <template #tags>
            <van-tag plain >
              <input type="checkbox" :checked="item.is_checked" @click="select(item)">
              <!-- <van-icon name="success" @click="select(item)" /> -->
            </van-tag>
          </template>
          <template #footer>
             <van-stepper v-model="item.count" input-width="24px" button-size="32px" @change="numsub(item.count)"/>
          </template>
        </van-card>
      </div> 
      <!-- 提交购物 -->
      <div class="handle">
        <input type="checkbox" :checked="checkedAll"  @click="selectAll">
        <!-- <span class="my-icon my-icon-duihao" @click="selectAll"></span> -->
        <span v-text="`商品总价：¥${total.toFixed(2)}`"></span>
        <span @click="onSubmit">去结算</span>
      </div> 
    </div>
</template>
<script>
import {mapMutations,mapGetters,mapState} from 'vuex'
export default {
    data(){
        return{
          cartItem:[],
          checkedAll:'',
          iscartItem:[] 
        }
    },
    methods:{
       ...mapMutations(['clearCart','delCart']),
      // 返回上一页
      onClickLeft(){
        this.$router.go(-1);
      },
      // 删除购物车记录
      onClickRight(){
        console.log(this.cartItem)
        this.cartItem.forEach(item=>{
          this.delCart(item)
          console.log(item)
        })
      },
      // 计步器提交数量到localstrong
      numsub(i){
        console.log(this.$store.state.cart)
        localStorage.setItem('cart',JSON.stringify(this.$store.state.cart))
      },
      // 点击选择某一项
      select(i){
        // 判断某一项
        if(i.is_checked){
           i.is_checked=false;
          localStorage.setItem('cart',JSON.stringify(this.$store.state.cart))
        }else{
          i.is_checked=true;
          localStorage.setItem('cart',JSON.stringify(this.$store.state.cart))
        }
        console.log(i.is_checked)
        // 判断全局
         let result1=this.cartItem.every(function(value){
          return value.is_checked==true 
        });
        if(result1){
          this.checkedAll=true
        }else(
          this.checkedAll=false
        )
      },
      // 选择全部
      selectAll(){
        let result1=this.cartItem.every(function(value){
          return value.is_checked==true 
        });
        console.log(result1)
        if(result1){
          this.cartItem.forEach(item=>{
            item.is_checked=false
          })
        }else{
          this.cartItem.forEach(item=>{
            item.is_checked=true
          })
          // this.checked=false;
        }
      },
      // 获取添加到购物车的数据
      ...mapGetters(['getCart','']),
      getFromCart(){
        this.cartItem = this.getCart()
        console.log(this.cartItem)
      },
        // 结算
      onSubmit(){
        this.phone = JSON.parse(localStorage.getItem('phone'))
          console.log(this.phone)
          if(!this.phone){
              console.log(this.phone)
              alert('您还没登陆')
              this.$router.push('/login')
          }else{
              for(var i of this.cartItem){
                if(i.is_checked){
                  // i.uid =  localStorage.getItem('uid');
                  this.iscartItem.push(i)
                }
                  // console.log(i.uid)
              }
              console.log(this.iscartItem);
              let data = {cartItem:this.iscartItem};
              console.log(data);
              this.axios.post(
                '/cartItems/v1/add',this.$qs.stringify(data)
                // {
                //   url:'/cartItems/v1/add',  
                //   data:data
                // }
              ).then(res=>{
                  console.log(res.data)
                   alert('即将跳入支付页面')
              }).then(()=>{
                  // 结算后 清空 购物车
                  this.onClickRight()
              })
          }
      },
    },
    // 挂载加载购物车数据
    mounted(){
      this.getFromCart()
      
    },
    // 计算商品的总价格
    computed:{
        total(){
            let total=0
            for(let p of this.cartItem){
              if(p.is_checked){
                 total+=p.price*p.count;
              }    
            }
            return total;
        }
    },
}
</script>
<style>
.van-nav-bar{
  box-shadow: 0 2px 10px #ccc;
}
.van-nav-bar__title{
  color: #a36663;
}
.van-nav-bar .van-icon {
    color: #a36663;
}
.van-card__title{
  font-size: 12px;
  color: #9a5b57;
  padding: 20px 0px 10px 30px;
}
.van-card__desc{
  color: #9a5b57;
  padding-left: 30px;
}
.van-card__price{
  color: #9a5b57;
  padding: 10px 0px 0px 30px;
}
.van-card__thumb img {
    border-radius: 2px;
    width: 100px;
    height: 100px;
}
.van-card {
    position: relative;
    box-sizing: border-box;
    padding: 10px;
    color: #9a5b57;
    font-size: 12px;
    -webkit-box-shadow: 0 2px 10px #ccc;
    box-shadow: 0 2px 10px #ccc;
    background: #fff;
}
.van-stepper__minus, .van-stepper__plus{
    color: #fff;
    background: #753724;
}
.van-tag{
  /* display: inline-block; */
  position:absolute;
  top:37px;
  right: 12px;
  padding: 4px;
}
.van-tag--default.van-tag--plain{
  color: #fff;
}
.van-tag--default.van-tag--plain .changeColor{
  color: #666;
}
</style>
<style scoped>
.cart .handle{
  position: fixed;
  left: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 53px;
  line-height: 53px;
  background: #e5e6e8;
  text-indent: 7px;
  color: #9a5b57;
  z-index: 1;
  font-size: 12px;
}
.cart .handle span:first-child{
  padding-right: 30px;
}
.cart .handle span:nth-child(3){
  float: right;
  padding: 0 20px;
  background: #492321;
  color: #fff;
  text-indent: 0;
  font-size: 14px;
  letter-spacing: 2px;
}
</style>