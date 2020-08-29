<template>
    <div class="userset">
       
       <div class="header">
            <van-nav-bar
            title="我的订单"
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
       <div class="person">
            <ul>
                <li>
                    <div>
                        <span>手机号码：</span>
                        <span>{{$store.state.phone}}</span>
                        <span class="my-icon my-icon-yincangxiangqing"></span>
                    </div>                  
                </li>
                <li>
                    <div>
                        <span>昵称：</span>
                        <span v-if="this.$store.state.nickname==0">暂无</span>
                        <span v-else>{{$store.state.nickname}}</span>
                        <span class="my-icon my-icon-yincangxiangqing" @click="showPopup"></span>
                    </div>    
                </li>
                <li>
                    <div>
                        <span>姓名：</span>
                        <span v-if="this.$store.state.uname==0">暂无</span>
                        <span v-else>{{$store.state.uname}}</span>
                        <span class="my-icon my-icon-yincangxiangqing"></span>
                    </div>
                </li>
                <li>
                    <div>
                        <span>邮箱：</span>
                        <span v-if="this.$store.state.email==0">暂无</span>
                        <span v-else>{{$store.state.email}}</span>
                        <span class="my-icon my-icon-yincangxiangqing"></span>
                    </div>
                </li>
                <li>
                    <div>
                        <span>生日：</span>
                        <span v-if="this.$store.state.birthday==0">暂无</span>
                        <span v-else>{{$store.state.birthday}}</span>
                        <span class="my-icon my-icon-yincangxiangqing"></span>
                    </div>
                </li>
                <li>
                    <div>
                        <span>性别：</span>
                        <span v-if="this.$store.state.gender==0">保密</span>
                        <span v-else-if="this.$store.state.gender==1">男</span>
                        <span v-else>女</span>
                        <span class="my-icon my-icon-yincangxiangqing"></span>
                    </div>
                </li>
                <li>
                    <div>
                        <span>修改密码</span>
                        <span class="my-icon my-icon-yincangxiangqing"></span>
                    </div>
                </li>
            </ul> 
       </div>
       <div class="min-box">
           <van-popup v-model="show">
               <p>请输入你的昵称</p>
               <div class="context">
                   <input type="text" v-model="nkname" name="nkname" >
               </div>
               <div class="btn"> 
                   <button @click="hidePopup()">取消</button>
                   <button @click="handle()">确定</button>
               </div>
           </van-popup> 
       </div>
       <div class="footer" type="button" @click="logout">安全退出</div>
    </div>
</template>
<script>
import {mapState,getters} from 'vuex'
export default {
    data(){
        return{
            show: false,
            nkname:'',
            name:'',
            mail:'',
            birth:'',
            sex:'',
            newpassword:''
        }
    },
 
    methods:{
         onClickLeft(){
             this.$router.go(-1);
         },
         onClickRight(){
             this.$router.push('/cart')
         },
        showPopup() {
          this.show = true;
        },
        hidePopup(){
            this.show = false;
        },
        handle(){
            localStorage.setItem('nickname',this.nkname);
            this.$store.state.nickname=this.nkname;
            console.log(this.$store.state.nickname)
            this.show = false;
        },
        logout(){
            this.$store.commit('logout_mutations');
            this.$router.push('/login')
        },
    },

   
}
</script>
<style>
/* .van-tabs__line {
  background-color: #492321 !important;
}
.van-tab {
  color: #492321;
} */
</style>
<style scoped>
.person{
    position: relative;
    /* top: 60px; */
    width: 100%;
    font-size: 12px;
    color: #a36663;
}
.person>ul>li{
    width: 100%;
    list-style: none;
    padding:15px 0;
    border-bottom: 1px solid #a36663;
}
.person>ul>li>div{
    width: 94%;
    height: 30px;
    line-height: 30px;
    padding: 0 3%;
    overflow: hidden;
}
.person>ul>li>div>span:last-child{
    position: absolute;
    right: 20px;
}
.footer{
    position: fixed;
    z-index: 1000;
    bottom: 0;
    left: 0;
    right: 0;
    width: 100%;
    height: 50px;
    line-height: 50px;
    text-align: center;
    background: #522725;
    color: #fff;
    cursor: pointer;
    box-shadow: 0 -2px 10px #ccc;
}
.min-box{
    text-align: center;
}
.min-box .context{
    padding: 10px 20px 15px;
    border-bottom: 1px solid #ddd;
    min-height: 36px;
    position: relative;
}
.min-box button{
   width: 50%; 
   line-height: 35px;
   display: block;
   background-color: #fff;
   -ms-flex: 1;
   flex: 1;
   margin: 0;
   border: 0;
}
.btn{
    display: flex;
    height: 40px;
    line-height: 40px;
}
</style>