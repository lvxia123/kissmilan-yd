<template>
    <div class="user">
        <div class="header">
            <van-nav-bar
            title="会员中心"
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
       <div class="member">
           <div class="member-top">
               <van-row>
                   <van-col span="8" class="radius">
                       <img style="width:100%" src="img/user/67bc3378f89ec850.jpeg" alt="">
                   </van-col>
                   <van-col span="14">
                       <div class="member-info">
                           <div class="info">
                               <p>
                                   <van-icon name="manager" class="tit"  color="#a36663" />
                                   <span>昵称：暂无</span>
                               </p>
                               <p>
                                   <van-icon name="phone" class="tit" color="#a36663" />
                                   <span>{{$store.state.phone}}</span>
                                   <router-link to="/user/set" class="pos my-icon my-icon-yincangxiangqing"></router-link>
                               </p>
                               <p>
                                   <van-icon name="gold-coin" class="tit" color="#a36663" />
                                   <span>余额：0.00</span>
                               </p>
                               <p>
                                   <van-icon name="medal" class="tit" color="#a36663" />
                                   <span>付费等级：无</span>
                               </p>
                           </div>  
                       </div>
                   </van-col>
                </van-row>
           </div>
           <div class="member-con">
              <van-grid :column-num="6">
                 <van-grid-item icon="bill-o" text="待付款" />
                 <van-grid-item icon="logistics" text="待收货" />
                 <van-grid-item icon="certificate" text="已完成" />
                 <van-grid-item icon="phone-o" text="客服" />
                 <van-grid-item  text=">" />
                 <van-grid-item icon="records" text="我的订单" to="/user/order" />
                 <van-grid-item icon="location-o" text="收货地址" />
                 <van-grid-item  text="0 积分" />
                 <van-grid-item  text="0 我的礼卷" />
                 <van-grid-item icon="gift" text="礼卷领取" />
                 <van-grid-item text=">" />
                 <van-grid-item icon="bookmark" text="我的权益" />
              </van-grid>
           </div>
       </div>
       <Footer></Footer>
    </div>
</template>
<script>
import Footer from '../components/KmlFooter.vue'
import {mapState,getters} from 'vuex'
export default {
   components:{Footer},
   data() {
    return {
      show: false,
    };
  },
  computed:{
      
  },
  methods: {
     onClickLeft(){
       this.$router.go(-1);
     },
     onClickRight(){
       this.$router.push('/cart')
     },  
    showPopup() {
      this.show = true;
    },
  },
}
</script>

<style scoped>
.member{
    position: relative;
    /* top: 55px; */
    margin: 3%;
    font-size: 12px;
    color: #a36663;
}
.radius{
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
    margin-right: 24px;
}
.member>.member-top .member-info{
    width: 65%;
    margin-bottom: 20px;
}
.member>.member-top .member-info .info{
    margin-top: 15px;
}
.member>.member-top .member-info .info p {
    margin: 10px 0 0 10px;
}
.tit{
    margin-right: 10px
}
.member>.userset{
    width: 60px;
    height: 60px;
    position: relative;
    top: 0px;
    right: 10px;
}
.pos{
  color: #a36663;
  right: -88px;
  font-size: 24px;
  position: relative;
}
</style>
