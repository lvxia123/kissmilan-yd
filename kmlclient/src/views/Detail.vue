<template>
   <div class="detail">
       <!-- 头部 -->
       <!-- <Headergoods></Headergoods> -->
       <div class="header">
        <van-nav-bar
         :title="product.title"
         left-text=""
         right-text="按钮"
         left-arrow
         @click-left="onClickLeft"
         @click-right="onClickRight"
        >
          <template #right>
            <van-icon name="shopping-cart" size="24" :badge="$store.getters.getAllCount" />
          </template>
        </van-nav-bar>
      </div>
       <!-- 详情 -->
       <div class="top">
           <img :src="(product.pic || '').split('|')[0]" alt="">
       </div>
       <div class="info">
           <h1 class="name" v-text="product.title"></h1>
           <div class="desc">
               <p class="Msnormal" v-text="product.subtitle"></p>
               <p class="remind" v-text="(product.remind || '').split('。')[0]"></p>
               <p class="remind" v-text="(product.remind || '').split('。')[1]"></p>
           </div>
           <div class="spec">
               <span>规格数量选择  （{{product.spec}}）    ×  {{num}}</span>
               <span @click="show"  class="my-icon my-icon-yincangxiangqing"></span>
           </div>
           <div class="proinfo">
               <img :src="(product.pic || '').split('|')[1]" alt="">
               <img :src="(product.pic || '').split('|')[2]" alt="">
               <img :src="(product.pic || '').split('|')[3]" alt="">
               <img :src="(product.pic || '').split('|')[4]" alt="">
               <img :src="(product.pic || '').split('|')[5]" alt="">
               <img :src="(product.pic || '').split('|')[6]" alt="">
           </div>
           <div class="attr-box" v-show="isShow">
               <h1 v-text="`¥${product.price}`"></h1>
               <img :src="(product.pic || '').split('|')[7]" alt="">
               <div class="specs">
                   <span class="cur" >
                       <van-icon name="success" />
                        {{product.spec}} 
                    </span>   
               </div>
               <div class="quantity">
                   <label>数量</label>
                   <van-stepper v-model="num" input-width="24px" button-size="32px" />
                   <!-- <span >-</span>
                   <span class="num" ></span>
                   <span >+</span> -->
               </div>
               <p><span @click="affirm">确定</span></p>
           </div>
       </div>
       <div class="footer">
           <span @click="addcart()">加入购物车</span>
           <span>立即购买</span>
       </div>
   </div> 
</template>
<script>

import {getters} from 'vuex'
export default {
    props:["lid"],
    data(){
        return {
            product: 'pic:,spec:,',
            isShow:false,
            num:1,
            count:0,
        }
    },
    methods:{
        loadPage(){
            this.axios.get("/details/v1",{
                params:{lid:this.lid}
            }).then(result => {
               this.product = result.data.result[0];
               console.log(this.product);
            })
        },
         onClickLeft(){
           this.$router.go(-1);
         },
         onClickRight(){
              this.$router.push('/cart')
         },
        show(){
            this.isShow=true;
        },
        affirm(){
            this.isShow=false;
        },
        addcart(){
            var shop={
                is_checked:false,
                cid:this.product.cid,
                title:this.product.title,
                spec:this.product.spec,
                price:this.product.price,
                count:this.num,
                pic:(this.product.pic).split('|')[0]
            }
            console.log(shop)
            this.$store.commit('addToCart',shop);
            this.$toast('添加成功');
        }
    },
    mounted(){
        this.loadPage();
    },
    beforeRouteLeave(to, from, next){
        console.log(`路由离开details...`);
        if(to.name=="Product"){
            to.meta.keepAlive=true;
        }
        next();
    },
    beforeRouteEnter(to, from,next){
        console.log(`路由进入detais...`);
        next();
    }
}
</script>

<style scoped>
.header{
     position: fixed;
     top: 0;
     left: 0;
     right: 0;
}
.detail{
    position: relative;
    top: 40px;
}
.detail>.top{
    width: 100%;
}
.detail>.top>img,.detail>.info>.proinfo>img{
    width: 100%;
    height: 100%;
}
.detail>.info{
    padding: 0 15px 20px;
    margin: 10px 0px 60px;
    background: #fff;
}
.detail>.info>.name{
    color: #522725;
    font-size: 14px;
    margin: 10px 0;
    line-height: 1.3;
}
.detail>.info>.desc,.detail>.info>.proinfo{
    margin: 10px 0;
}
.detail>.info>.desc>.Msnormal{
    font-size: 12px;
    color: #76361F;
}
.detail>.info>.desc>.remind{
    margin: 10px 0;
    font-size: 12px;
    color: #f00;
}
.detail>.info>.spec{
    display: flex;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    height: 33px;
    line-height: 33px;
    border-top: 1px solid #e8e8e8;
    border-bottom: 1px solid #e8e8e8;
    color: #76361f;
    margin-top: -1px;
}
.detail>.info>.attr-box{
    position: fixed;
    z-index: 2;
    top: 50px;
    left: 0;right: 0;bottom: 0;
    background: hsla(0,0%,100%,.9);
    overflow: hidden;
    padding-bottom: 20px;
}
.detail>.info>.attr-box>*{
    padding: 0 15px;
}
.detail>.info>.attr-box>img{
    width: 100%;
    margin: 10px 0;
    padding: 0;
}
.detail>.info>.attr-box>h1{
    font-size: 16px;
    color: #522725;
    padding-top: 10px;
    margin: 0;
}
.detail>.info>.attr-box>.specs>span{
    margin: 5px;
    color: #753724;
    font-size: 12px;
    padding: 8px 15px;
    display: inline-block;
}
.detail>.info>.attr-box>.specs>.cur{
    background: #fff;
    border: 1px solid #753724;
    position: relative;
}
.detail>.info>.attr-box>.quantity{
    margin-top: 20px;
    height: 30px;
    line-height: 30px;
}
.detail>.info>.attr-box>.quantity>span{
    display: inline-block;
    width: 28px;
    height: 28px;
    line-height: 28px;
    text-align: center;
    background: #753724;
    border: #753724;
    margin: 0 2px;
    color: #fff;
    font-size: 16px;
    vertical-align: middle;
}
.detail>.info>.attr-box>.quantity>.num{
    background: #fff;
    color: #753724;
    font-size: 12px;
}
.detail>.info>.attr-box>p{
    text-align: center;
}
.detail>.info>.attr-box>p>span{
    height: 30px;
    line-height: 30px;
    display: inline-block;
    border: 1px solid #7b4342;
    color: #7b4342;
    padding: 0px 20px;
}
.detail>.footer{
    position: fixed;
    padding: 10px 0;
    background: #e1e1e1;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 1;
    text-align: center;
}
.detail>.footer>span{
    display: inline-block;
    height: 40px;
    line-height: 40px;
    background: #4a2321;
    color: #fff;
    width: 45%;
    font-size: 14px;
    text-align: center;
}
.detail>.footer>span:last-child{
    background: #7b4342;
}
</style>