<template>
  <div class="home">
    <Header></Header>

    <div class="swiper">
      <van-swipe :autoplay="3000">
        <van-swipe-item v-for="(image,index) in imgList" :key="index">
          <img class="swipeimg" :src="image.img" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <div class="family">
      <router-link :to="`/goods/${t.tid}`" v-for="(t,i) in car" :key="i">
        <img :src="t.img" alt="">
      </router-link>
    </div>
    <div class="foot">
        <p>客服中心: <router-link to="">4001-023-866</router-link></p>
        <p>重庆市江北区北滨一路456号S1栋四层商业3号商铺</p>
        <p><router-link to="">渝ICP备13001878号-3</router-link></p>
        <p>COPYRIGHT©2013-2022 Kissmilan 版权所有 </p>
        <p>技术支持：迈小步科技</p>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from '../components/KmlHeader.vue'
import Footer from '../components/KmlFooter.vue'
export default {
  components:{Header,Footer},
  data(){
    return{
      // url传参
      lid:'',
      imgList:[],         
      car:[],
      active: 'index',
      // 搜索的值
      value:''
    }
  },
  methods:{
    onSearch(val) {
      Toast(val);
    },
  },
  mounted(){
    this.axios.get('/header/v1').then(res=>{
                this.cityname=res.data;
                console.log(res.data)
            })
    this.axios.get(
       '/index/v1/carousel').then(res=>{
         console.log(res.data);
         this.imgList = res.data;
    });
    this.axios.get(
      '/index/v1').then(res=>{
        console.log(res.data);
        this.car = res.data
     });
    // console.log(`向"/index"发送请求`);
  },
  watch:{
    $route(){
       this.lid=this.$route.params.lid;
    }
  },
  beforeRouteLeave(to,from,next){
    console.log(`路由离开Index...`);
    //如果从首页跳到products
    console.log(to);
    if(to.name=="Product"){
      to.meta.keepAlive=false;
    }
    next();
  },
  beforeRouteEnter(to,from,next){
    console.log(`路由进入Index...`);
    next();
  }
}
</script>
<style>
.van-search__action{
  color: #fff;
}
</style>
<style scoped>
.home{
  position: relative;
  top: 95px;
}
.swiper{
  overflow: hidden;
  position: relative;
  height: 100%;
  width: 100%;
}
.swiper img{
  width: 100%;
  height: 100%;
}
.family{
    width: 100%;
    top: calc(100% - 50px);
    padding-bottom: 60px;
}
.family img{
    width: 100%;
    margin-top: 10px;
    vertical-align: middle;
}
p{
    margin: 0;
}
.home .foot{
    font-size: 12px;
    color: #8f5451;
    line-height: 1.3;
    padding: 15px 0;
    text-align: center;
    margin-bottom: 50px;
}
</style>