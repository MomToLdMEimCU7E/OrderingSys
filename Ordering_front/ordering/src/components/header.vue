<template>
  <div class="homeHeader">
    <div class="title">ERP订货会</div>
    <el-dropdown class="userinfo" @command="handleCommand">
      <span class="el-dropdown-link">
        {{ username }}<i><img src="@/static/user.png" alt="" /></i>
      </span>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item command="userinfo"> 个人中心</el-dropdown-item>
        <!-- <el-dropdown-item>设置</el-dropdown-item> -->
        <el-dropdown-item command="logout">注销登录</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: this.$store.getters.getUser.role.username,
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
      }
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