<template>
<div class="footer"> 
    <van-tabbar  v-model="active"  inactive-color="#b58c78" active-color="#b58c78">
      <van-tabbar-item  class="my-icon my-icon-home">首页</van-tabbar-item>
      <van-tabbar-item  class="my-icon my-icon-4ge-01">蛋糕名目</van-tabbar-item>
      <van-tabbar-item  class="my-icon my-icon-dingdan">我的订单</van-tabbar-item>
      <van-tabbar-item  class="my-icon my-icon-huiyuanzhongxin">会员中心</van-tabbar-item>
    </van-tabbar>
</div>
</template>
<script>
export default {
  // props:[ "lid" ],
  data() {
    return {
       active: '0',
    }; 
  },
  watch:{
    active(){
      switch(this.active){
        case 0:
          this.$router.push('/')
          break;
        case 1:
          this.$router.push(`/goods/0`)  
          break;
        case 2:
          this.$router.push('/user/order')
          break;
        case 3:
          this.$router.push('/user')
          break;
      }
    }
  }
};
</script>
<style scoped>

</style>