<template>
    <div class="header">
        <div class="he">
            <van-nav-bar >
                <template #left>
                    <van-icon name="location" />
                    <span @click="city()" v-text="`${City}`"></span>
                </template>
                <template #title>
                    <img src="img/index/logo0.png" alt="">
                </template>
                <template #right>
                    <van-icon  @click="onClickRight" name="shopping-cart" size="24" :badge="$store.getters.getAllCount" />
                </template>
            </van-nav-bar>
        </div>
        <div class="city-box" v-show="isShow">
           <div class="cv">
               <div class="m" >
                   <h1>选择城市</h1>
                   <ul v-for="(item,k) of cityname" :key='k'>
                       <li v-text="item.cname" @click="select(k)"></li>
                   </ul>
               </div>
           </div>   
        </div> 
        <!-- 搜索 -->
        <van-search
        v-model="value"
        show-action
        shape="round"
        background="#a36663"
        placeholder="请输入搜索关键词"
        @search="onSearch"
        >
            <span slot="left">
                <router-link to="/"><van-icon name="wap-home" color="#fff" /></router-link>
                <!-- <van-icon name="arrow-left"  @click="back()" /> -->
            </span>
            <template #action>
                <div @click="onSearch">搜索</div>
            </template>
        </van-search>
    </div>
    
</template>

<script>
 import {getters} from 'vuex'
    export default {
        data(){
            return {
                // 购物车条目
                count:'0',
                // others:{}
                isShow:false,
                City:'成都',
                cityname:[],
                // 搜索关键字
                value:''
            }
        },
        methods:{
            city(){
                this.isShow=true;
            },
            back(){
                this.$router.go(-1);
            },
            select(i){
                this.isShow=false;
                this.City=this.cityname[i].cname;
            },
            onClickRight(){
              this.$router.push('/cart')
            },
            onSearch() {
                clearTimeout(this.timer);
                this.timer=setTimeout(()=>{
                    if(this.value.trim()!==""){
                        this.$router.push("/product/"+this.value)
                    }
                },1000)
            },
        },
        // mounted(){
            
        // },
        watch:{
            $route(){
                this.value=this.$route.params.value
            }
        }
    }
</script>
<style>
.van-swip{
    top: 50px !important;
}
.van-search__action{
    color: #fff !important;
}
.van-icon-arrow-left{
    color: #fff ;   
    padding: 0 10px ;
}
.van-search {
  padding: 2px 12px !important;
}
</style>
<style scoped>
.header{
    position: fixed ;
    top: 0;
    background: #fff; 
    z-index: 6; 
    height: 50px;
    width: 100%;
    color: #a36663;
    font-size: 14px;
    text-align: center;
    line-height: 50px;
    box-shadow: 0 -2px 10px #ccc;
    /* position: relative; */
}
.header .img{
    max-height: 25px;
    width: 119px;
    vertical-align: middle;
}
.header .city{
   padding-left: 10px;
   max-width: 25%;
   color: #8f5451;
   text-align: left;
}
.header .cart{
    text-align: right;
    padding-right: 10px;
    color: #8f5451;
}
.header .cart span {
    position: absolute;
    /* top: -12px; */
    top: 1px;
    /* right: -8px; */
    right: 1px;
    border: 1px solid #fff;
    background: #8f5451;
    color: #fff;
    height: 17px;
    line-height: 18px;
    padding: 0 5px;
    border-radius: 50%;
    transform: scale(.8);
}
.header>.city-box,.header>.city-box>.cv{
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 2;
}
.header>.city-box>.cv{
    background-color: rgba(0,0,0,.8);
    z-index: 2;
}
.header>.city-box>.cv>.m{
    position: absolute;
    background: #fff;
    padding-bottom: 10px;
    width: 90%;
    left: 5%;
    top: 20%;
    z-index: 2;
}
.header>.city-box>.cv>.m>h1{
    margin: 0;
    line-height: 60px;
    color: #8f5451;
    border-top: 3px solid #8f5451;
    text-align: left;
    font-size: 18px;
    font-weight: 100;
    text-indent: 10px;
}
.header>.city-box>.cv>.m li{
    display: block;
    float: left;
    padding: 0 20px;
    height: 30px;
    line-height: 30px;
    margin: 0 5px 5px;
    color: #8f5451;
    background: #f7f7f7;
}
.he img{
    width: 55%;
    max-width: 200px;
}
</style>