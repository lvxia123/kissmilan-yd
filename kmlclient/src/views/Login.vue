<template>
    <div class="login" v-show="noLogin">
        <div class="cv">
            <div class="m">
                
                 <div class="logo-title">
                    <span class="cur-bg">密码登录</span>
                 </div>
                 <input v-model="phone" @blur="checkphone()"  placeholder="手机号" name="phone" class="ipt">
                 <span v-text="phonemsg"></span>
                 <input v-model="password" @blur="checkpassword()" type="password" placeholder="密码" name="password" class="ipt">
                 <span  v-text="passwordmsg"></span>
                 <span class="btn tc t-bg" @click="handle()">立即登录</span>
                 <br>
                 <p class="tip fsz12 tc">
                     提示:还不是会员？通过短信登录，
                     <router-link to="/reg" class="">自动注册</router-link>
                     为会员~
                 </p>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            noLogin:true,
            phone:'',
            password:'',
            phonemsg:'',
            passwordmsg:''
        }
    },
    methods:{
        checkphone(){
            let phone=this.phone;
            let phonereg=/^1[3-9]\d{9}$/;
            if(phonereg.test(phone)){
               this.phonemsg="√"
            return true;
               
            }else{
                this.phonemsg="请输入正确的手机号"   
                // alert("请输入正确的手机号")
                return false;
            }
        },
        checkpassword(){
            let password=this.password;
            let passwordreg=/^[0-9A-Za-z_]{6,12}$/;
            if(passwordreg.test(password)){
                this.passwordmsg="√"
                return true;
            }else{
                this.passwordmsg="请使用6~12位的大小写字母数字或下划线"
                // alert("请使用6~12位的大小写字母数字或下划线");
                return false;
            }
        },
        handle(){
           this.axios.post('/users/login/v1','phone='+this.phone+'&password='+this.password).then(res=>{
               console.log(res.data)
               if(res.data.code == 1){
                    //修改Vuex中的state
                    this.$store.commit('logined_mutations',res.data.result);
                    localStorage.setItem('isLogined',true);
                    localStorage.setItem('uid',res.data.result.uid);
                    localStorage.setItem('phone',res.data.result.phone);
                    localStorage.setItem('nickname',res.data.result.nickname);
                    localStorage.setItem('uname',res.data.result.uname);
                    localStorage.setItem('email',res.data.result.email);
                    localStorage.setItem('birthday',res.data.result.birthday);
                    localStorage.setItem('gender',res.data.result.gender);
                    this.$router.push('/');
               }else{
                   alert("对不起,用户或密码错误");
               }
           })
        }
    }    
}
</script>
<style scoped>
.login,.login>.cv{
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    z-index: 2;
}
.login>.cv{
    background-color: rgba(0,0,0,.8);
    z-index: 2;
}
.login>.cv>.m{
    position: absolute;
    background: #fff;
    padding: 10px;
    width: 325px;
    height: 205px;
    left: 50%;
    top: 50%;
    text-align: center;
    margin: -104px 0 0 -175px;
    border: 4px solid #dadada;
    z-index: 2;
}
.login>.cv>.m>.logo-title{
    height: 24px;
    line-height: 24px;
    font-size: 16px;
    color: #fff;
    background: #522725;
    margin-bottom: 10px;
}

.login>.logo-title>span{
    float: left;
    display: block;
    cursor: pointer;
    width: 50%;
    height: 100%;
    color: #fff;
    text-align: center;
}
.login>.cv>.m>input{
    border: 1px solid #ebebeb;
    height: 25px;
    line-height: 25px;
    width: 210px;
    margin-bottom: 10px;
    margin-top: 10px;
    outline: none;
    text-indent: 10px;
}

.login>.cv>.m>.btn {
    display: inline-block;
    border: none;
    color: #fff;
    cursor: pointer;
    margin-top: 9px;
}
.login>.cv>.m>p{
    margin: 0;
}
.login>.cv>.m .btn,.login>.cv>.m .ipt {
    border: 1px solid #ebebeb;
    height: 20px;
    line-height: 20px;
    width: 210px;
    margin-bottom: 10px;
    outline: none;
    text-indent: 10px;
}
.login>.cv>.m>.tc {
    text-align: center;
}
.login>.cv>.m>.t-bg{
    background-color: #522725;
}
.login>.cv>.m>.tip{
    border-top: 1px solid #dcdcdc;
    padding-top: 10px;
    color: #854d4b;
    font-size: 10px;
}
.login>.cv>.m>.tip>a {
    text-decoration: underline;
    color: #595757;
}
</style>