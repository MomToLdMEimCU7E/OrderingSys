<template>
  <div>
    <el-form
      :rules="loginRules"
      v-loading="loading"
      element-loading-text="正在登录,请稍等"
      element-loading-spinner="el-icon-loading"
      element-loading-background="rgba(0,0,0,0.8)"
      ref="loginForm"
      :model="loginForm"
      class="loginContainer"
    >
      <h3 class="loginTitle">系统登录</h3>
      <el-form-item prop="username">
        <el-input
          type="text"
          auto-complete="false"
          v-model="loginForm.username"
          placeholder="请输入用户名"
        ></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          type="password"
          auto-complete="false"
          v-model="loginForm.password"
          placeholder="请输入密码"
          show-password
        ></el-input>
      </el-form-item>
      <div class="buttonArea">
        <!-- <el-button type="info" style="width: 40%" @click="gotoRegister"
          >注册</el-button
        > -->
        <el-button type="primary" style="width: 40%" @click="submitLogin"
          >登录</el-button
        >
      </div>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      loading: false,
      loginForm: {
        username: "",
        password: "",
      },
      loginRules: {
        username: [
          {
            required: true,
            message: "请输入用户名",
            trigger: "blur",
          },
        ],
        password: [
          {
            required: true,
            message: "请输入密码",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    gotoRegister(){
      this.$router.push({ path:'/register' })
    },
    submitLogin() {
      // if (
      //   this.loginForm.username == "tea" &&
      //   this.loginForm.password == "123456"
      // )
      //   this.$router.replace("/home");
      this.$refs.loginForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          this.postRequest(
            "/user/login?username=" +
              this.loginForm.username +
              "&password=" +
              this.loginForm.password
          ).then((resp) => {
            if (resp.data.code == "0") {
              //存储用户token
              // const tokenStr = resp.obj.tokenHead + resp.obj.token;
              // window.sessionStorage.setItem("tokenStr", tokenStr);
              this.$store.dispatch("asyncUpdateUser", { role: resp.data.data });
              //跳转页面
              this.$router.replace("/home");
              this.$message({
                message: "登录成功",
                type: "success",
              });
            } else {
              this.loading = false;
              this.$message.error("登陆失败，请检查账号密码");
            }
          });
        } else {
          this.$message.error("请输入所有信息");
          return false;
        }
      });
    },
  },
};
</script>

<style scoped>
.loginContainer {
  border-radius: 15px;
  background-clip: padding-box;
  margin: 100px auto;
  width: 350px;
  padding: 15px 35px;
  background-color: #fff;
  border: 1px solid #eaeaee;
  box-shadow: 0 0 25px #cac6;
}
.loginTitle {
  margin: 5%;
  text-align: center;
}
.buttonArea{
  text-align: center;
}
</style>