<template>
  <div>
    <el-form
      :rules="registerRules"
      v-loading="loading"
      element-loading-text="注册中,请稍等"
      element-loading-spinner="el-icon-loading"
      element-loading-background="rgba(0,0,0,0.8)"
      ref="registerForm"
      :model="registerForm"
      class="loginContainer"
    >
      <h3 class="loginTitle">注册</h3>
      <el-form-item prop="username">
        <el-input
          type="text"
          auto-complete="false"
          v-model="registerForm.username"
          placeholder="请输入用户名"
        ></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          type="password"
          auto-complete="false"
          v-model="registerForm.password"
          placeholder="请输入密码"
        ></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          type="password"
          auto-complete="false"
          v-model="registerForm.groupId"
          placeholder="请选择班级"
        ></el-input>
      </el-form-item>
      <div class="buttonArea">
        <el-button type="info" style="width: 40%" @click="gotoLogin"
          >返回登录</el-button
        >
        <el-button type="primary" style="width: 40%" @click="submitLogin"
          >注册</el-button
        >
      </div>
    </el-form>
  </div>
</template>

<script>
import { postRequest } from "@/utils/api";
export default {
  name: "Login",
  data() {
    return {
      loading: false,
      registerForm: {
        username: "",
        password: "",
        groupId: ""
      },
      registerRules: {
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
    gotoLogin() {
      this.$router.push({ path: "/" });
    },
    submitLogin() {
      this.$refs.registerForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          this.postRequest(
            "/user/register?username=" +
              this.registerForm.username +
              "&password=" +
              this.registerForm.password +
              "&groupId" +
              this.registerForm.groupId
          ).then((resp) => {
            if (resp.data.code == "0") {
              //存储用户token
              // const tokenStr = resp.obj.tokenHead + resp.obj.token;
              // window.sessionStorage.setItem("tokenStr", tokenStr);
            //   this.$store.dispatch("asyncUpdateUser", { role: resp.data.data });
              //跳转页面
              this.$router.replace("/");
              this.$message({
                message: "注册成功",
                type: "success",
              });
            } else {
              this.loading = false;
              this.$message.error("注册失败，请检查输入信息");
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
.buttonArea {
  text-align: center;
}
</style>