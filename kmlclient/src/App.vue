<template>
  <div id="app">
    <!-- <kml-header></kml-header> -->
    <!-- 识别完整路径 -->
    <!-- <router-view :key="$route.fullPath" /> -->
    <!-- <kml-footer></kml-footer>  -->
    <keep-alive>
      <router-view :key="$route.fullPath" v-if="$route.meta.keepAlive"/>
    </keep-alive>
    <router-view :key="$route.fullPath" v-if="!$route.meta.keepAlive"></router-view>
    <Top></Top> 
  </div>
</template>
<script>
export default {
   
}
</script>
<style>

</style>
