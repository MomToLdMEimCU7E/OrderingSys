<template>
  <div class="homeHeader">
    <div class="title">ERP订货会</div>
    <el-dropdown class="userinfo" @command="handleCommand">
      <span class="el-dropdown-link">
        {{ username }}<i><img src="@/static/user.png" alt="" /></i>
      </span>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item command="changePwd">修改密码</el-dropdown-item>
        <!-- <el-dropdown-item>设置</el-dropdown-item> -->
        <el-dropdown-item command="logout">注销登录</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
    <el-dialog
      title="修改密码"
      :visible.sync="pwdDialogFlag"
      width="30%"
      :before-close="handleClose"
      :append-to-body="true"
    >
      <el-form ref="updateGroupData" :model="newClassData">
        <el-form-item label="新密码" label-position="left">
          <el-input
            v-model="updateGroupData.password"
            style="width: 75%"
          ></el-input>
        </el-form-item>
        <div style="margin-left: 45%">
          <span slot="footer">
            <el-button @click="pwdDialogFlag = false" size="mini"
              >取消</el-button
            >
            <el-button type="primary" size="mini" @click="updatePwd"
              >确认添加</el-button
            >
          </span>
        </div>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      pwdDialogFlag: false,
      username: this.$store.getters.getUser.role.username,
      updateGroupData: {
        uid: this.$store.getters.getUser.role.uid,
        username: this.$store.getters.getUser.role.username,
        password: this.$store.getters.getUser.role.password,
        role: this.$store.getters.getUser.role.role,
        groupId: this.$store.getters.getUser.role.groupId,
      },
      // user: JSON.parse(window.sessionStorage.getItem('user')),
    };
  },
  // mounted(){
  //   console.log(this.$store.getters.getUser.role.uid)
  // },
  methods: {
    // menuClick(index) {
    //   this.$router.push(index);
    // },
    handleCommand(command) {
      if (command == "logout") {
        sessionStorage.clear();
        this.$router.replace("/");
        this.$message({
          message: "注销成功",
          type: "success",
        });
      } else if (command == "changePwd") this.pwdDialogFlag = true;
    },
    updatePwd() {
      this.$confirm("确定修改吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then((resp) => {
          this.putRequest("/user/updateUser", this.updateGroupData).then(
            (resp) => {
              if (resp.data.msg === "成功") {
                this.$message({
                  message: "修改成功",
                  type: "success",
                });
                this.$store.dispatch("asyncUpdateUser", { role: this.updateGroupData });
                this.pwdDialogFlag = false;
              } else {
                this.$message({
                  message: "修改失败",
                  type: "error",
                });
              }
            }
          );
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消提交",
          });
        });
    },
  },
};
</script>
<style scoped>
.homeHeader {
  background-color: LightSkyBlue;
  opacity: 0.8;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 15px;
}
.homeHeader .title {
  font-size: 30px;
}
.homeHeader .userinfo {
  cursor: pointer;
}
.el-dropdown-link {
  display: flex;
  justify-content: center;
  align-items: center;
}
.el-dropdown-link img {
  width: 48px;
  height: 48px;
  border-radius: 24px;
  margin-left: 8px;
}
</style>