<template>
  <div class="goods">
   <!-- <Headergoods></Headergoods>  -->
    <div class="header">
      <van-nav-bar
       title="蛋糕名目"
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
   <!-- 循环从数据库获取分类项 -->
    <div class="nav">
      <ul  v-for="(item,index) of nav" :key="index" >
        <li v-bind:class="{active:currentIndex == index}">
          <span   v-text="item.fname" @click="goto(parseInt(item.fid))" ></span>
       </li>
      </ul> 
    </div>
   <!-- 商品分类详情 -->
    <div class="list">
     <van-pull-refresh v-model="refreshing" @refresh="onRefresh">
       <van-list
         v-model="loading"
         :finished="finished"
         finished-text="没有更多了"
         @load="onLoad"
       >
        <van-row>
           <van-col
             span="12"
             class="pic-box"
             v-for="(item,index) of goodsall"
             :key="index"
           >
            <router-link :to="`/detail/${item.pid}`">
               <div class="pic-item">
               <van-image
                 width="100%"
                 height="100%"
                 lazy-load
                 :src="item.pic"
               >
                 <template v-slot:loading>
                   <van-loading color="pink" type="spinner" size="20" />
                 </template>
               </van-image>
             </div>
            </router-link>
             <div class="desc">
               <router-link :to="`/detail/${item.pid}`">
                 <p v-text="item.title" ></p>
                 <p v-text="item.subtitle"></p>
               </router-link>
               <span class="price-red" v-text="`¥${item.price.toFixed(2)}`"></span>
               <span v-text="item.spec"></span>
               <i class="my-icon my-icon-gouwuchejiahaojian" @click="addcart(index)"></i>
             </div>
           </van-col>
         </van-row>
       </van-list>
     </van-pull-refresh>
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
import {getters} from 'vuex'
import Footer from '../components/KmlFooter.vue'
export default {
  components:{Footer},
  props:[ "lid" ],
  data(){
    return{
      // navbar导航栏数据
      nav: '',
      // 所有商品
      goodsall: [],
      // lid: '',
      // 页码
      page: '1',
      // 总页数
      pagecount: 0,
      // 当前页码
      currentIndex: '',
      // 用于标记当前服务器可以处理请求
      loading: false,
      finished: false,
      refreshing: false,
    }
  },
  methods:{
     onClickLeft(){
       this.$router.go(-1);
     },
     onClickRight(){
       this.$router.push('/cart')
     },
    goto(lid){
        this.$router.push(`/goods/${lid}`);
        this.currentIndex=lid;
        // console.log(this.currentIndex);
    },
     addcart(i){
          var shop={
              is_checked:false,
              cid:this.goodsall[i].pid,
              title:this.goodsall[i].title,
              spec:this.goodsall[i].spec,
              price:this.goodsall[i].price,
              count:1,
              pic:this.goodsall[i].pic
          }
          console.log(shop)
          this.$store.commit('addToCart',shop);
          this.$toast('添加成功');
      },
    onLoad(){
      //地址栏不变化但有参数  
      // 判断得到的参数 执行全局查找
       this.loading = true;
       if(this.$route.params.lid==0){
          // this.busy=true;
          this.axios.get(
          '/goods/v1/list?page='+this.page).then(res=>{
            let data = res.data.results;
            data.forEach(item => {
              this.goodsall.push(item);
            })
            this.pagecount = res.data.pagecount;
            this.loading=false; 
            console.log(this.page);
            if(this.page>=this.pagecount){
               this.finished = true;
             }
            this.page++;
        })
        // 或者分类查找
       }else{
            // 分类查找，通过分类号
            // this.busy=true;
            this.axios.get('/goods/v1/search?pid='+this.$route.params.lid+'&page='+this.page).then(res=>{
            this.pagecount = res.data.pagecount;
            let data = res.data.results;
            data.forEach(item => {
              if(data!=0){
                this.goodsall.push(item);
              }
            })
           this.loading=false; 
            console.log(this.page)
            if(this.page>=this.pagecount){
               this.finished = true;
             }
            this.page++;  
          }) 
        } 
    },
    // 向下滚动时加载更多数据
    onRefresh() {
      // 清空列表数据
      this.finished = false;
      // console.log(this.page)
      // 重新加载数据
      // 将 loading 设置为 true，表示处于加载状态
      this.loading = true;
      this.onLoad();
    },
  },
 mounted(){
      this.axios.get('/goods/v1/nav').then(res=>{
        res.data.unshift({fname:'全部',fid:0});
        this.nav=res.data;
        console.log(this.nav)
      });
      this.page = 1;
      this.onLoad();  
  },

  watch:{
     active(){
          // 切换时清空数组
          this.goodsall=[];
          // 因为每次切换时，会带由原来的page，所以每次切换给一个初始值1
          this.page=1;
          // 加载数据
          this.load();
      },
  }
}
</script>

<style scoped>
   .header{
     position: fixed;
     top: 0;
     left: 0;
     right: 0;
     z-index: 3;
   }
   .nav{
     position: relative;
     z-index: 3;
     top: 50px;
     width: 100%;
     position: fixed;
     top: 50px;
     left: 0;
     overflow: hidden;
     overflow-x: scroll;
     height: 35px;
     line-height: 35px;
     border-bottom: 1px solid #492321;
     white-space: nowrap;
     background: #fff;
   }
   .nav>ul>li.active{
     display: inline-block !important;
     /* background: gray; */
     border-bottom:2px solid #522725 !important;
   }
   .nav ul li{
     float: left;
   }
   .nav span {
    padding: 0 15px;
    display: inline-block;
    color: #492321;
  }
  .list{
    margin-top: 90px;
    margin-left: 2px;
  }
  .desc{
    padding: 10px;
  }
  .foot{
    font-size: 12px;
    color: #8f5451;
    line-height: 1.3;
    padding: 20px 0;
    text-align: center;
    margin-bottom: 50px;
  }
</style>
