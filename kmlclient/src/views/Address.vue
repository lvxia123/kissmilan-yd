<template>
    <div class="address">
        <!-- 头部 未完成 -->
        <div class="header">
            <van-nav-bar
            title="我的收货地址"
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
        <!-- 添加地址按钮 -->
        <van-button type="warning">新增地址</van-button>
        <!-- 地址编辑栏 -->
        <van-address-edit
        :area-list="areaList"
        show-postal
        show-delete
        show-set-default
        show-search-result
        :search-result="searchResult"
        :area-columns-placeholder="['请选择', '请选择', '请选择']"
        @save="onSave"
        @delete="onDelete"
        @change-detail="onChangeDetail"
        />
    </div>
</template>
<script>
export default {
    data(){

    }
}
</script>
<style scoped>

</style>