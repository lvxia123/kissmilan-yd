<template>
    <div class="order">
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
        <van-tabs class="tabs" type="card">
            <van-tab title="我的订单">我的订单</van-tab>
            <van-tab title="门店订单">门店订单</van-tab>
        </van-tabs>
        <Footer></Footer>
    </div>
</template>
<script>
import {getters} from 'vuex'
import Footer from '../components/KmlFooter.vue'
export default {
    components:{Footer},
    data(){
        return{
            
        }
    },
    methods:{
        onClickLeft(){
            this.$router.go(-1);
        },
        onClickRight(){
            this.$router.push('/cart')
        },  
    }
}
</script>
<style>

.van-tabs__nav--card .van-tab.van-tab--active{
    color: #fff;
    background-color: #a36663;
}
.van-tabs__nav--card .van-tab {
    color: #a36663;
    border-right: 1px solid #a36663;
}
.van-tabs__nav--card {
    box-sizing: border-box;
    height: 30px;
    margin: 0 16px;
    border: 1px solid #a36663;
    border-radius: 2px;
}
.van-tab__pane, .van-tab__pane-wrapper{
    text-align: center;
}
</style>
<style scoped>
/* .tabs{
    position: relative;
    top: 55px;
} */
</style>
