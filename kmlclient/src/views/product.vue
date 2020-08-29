<template>
    <div class="product">
        <Header></Header>
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
                    v-for="(item,index) of products"
                    :key="index"
                  >
                   <router-link :to="`/detail/${item.pid}`">
                      <div class="pic-item">
                     
                        <van-image use-loading-slot width="100%"
                        height="100%"
                        :src="item.pic">
                          <van-loading slot="loading" type="spinner" size="20" vertical />
                        </van-image>
                      <!-- <van-image
                        width="100%"
                        height="100%"
                        lazy-load
                        :src="item.pic"
                      >
                        <template v-slot:loading>
                          <van-loading color="pink" type="spinner" size="20" />
                        </template>
                      </van-image> -->
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
    </div>  
</template>
<script>
import Header from '../components/KmlHeader.vue'
export default {
    props:['value'],
    components:{Header},
    data() {
    return {
      page:1,
      pagecount:'',
      products: [],
      loading: false,
      finished: false,
      refreshing: false,
    };
  },
  methods: {
    onLoad() {
      this.loading = true;
      this.axios.get('/goods/v1/fuzzysearch?kw='+this.value+'&page='+this.page).then(res=>{
          console.log(res.data.results);
          this.pagecount=res.data.pagecount;
          // this.products=res.data.results;
          let data = res.data.results;
          data.forEach(item => {
            if(data!=0){
              this.products.push(item);
            }
          })
          // console.log(this.products,this.pagecount);
          this.loading=false; 
          console.log(this.page)
          if(this.page>=this.pagecount){
            this.finished = true;
          }
          this.page++;
      });
      // this.finished = true;
    
    },
    onRefresh() {
      // 清空列表数据
      this.finished = false;
      // 重新加载数据
      // 将 loading 设置为 true，表示处于加载状态
      this.loading = true;
      this.onLoad();
    },
    addcart(i){
       var shop={
           is_checked:false,
           cid:this.products[i].pid,
           title:this.products[i].title,
           spec:this.products[i].spec,
           price:this.products[i].price,
           count:1,
           pic:this.products[i].pic
       }
       console.log(shop)
       this.$store.commit('addToCart',shop);
       this.$toast('添加成功');
    },
  },
  mounted(){
    // this.onLoad()
  },
  // keep-alive 配合 路由守卫  
  beforeRouteEnter(to, from, next){
    console.log(to);
    console.log(from);
    console.log("进入商品列表页面");
    next();
  },
  beforeRouteLeave(to, from , next){
    console.log("离开商品列表页面");
    if(to.name=="Detail"){
      if(!from.meta.keepAlive){
        from.meta.keepAlive=true;
      }
      next();
    }else{
      from.meta.keepAlive=false;
      to.meta.keepAlive=false;
      this.$destroy();
      next()
    }
    
  }
}
</script>

<style scoped>
.list{
  position: relative;
  top: 110px;
  padding-bottom: 60px;
  /* margin-bottom: 60px; */
}
.desc{
  padding: 10px;
}
</style>