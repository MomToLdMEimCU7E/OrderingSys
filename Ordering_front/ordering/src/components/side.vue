<template>
  <div>
    <el-menu @select="menuClick" :default-openeds="openeds">
      <el-submenu index="1" v-if="role == '教师'">
        <template slot="title">
          <i class="el-icon-location"></i>教师功能
        </template>
        <el-menu-item index="/classmgt">班级管理</el-menu-item>
        <el-menu-item index="/orderingmgt">订货会</el-menu-item>
      </el-submenu>
      <el-submenu index="2" v-if="role == '学生'">
        <template slot="title">
          <i class="el-icon-location"></i>学生功能
        </template>
        <el-menu-item index="/orderall">订货会</el-menu-item>
        <el-menu-item index="/orderlist">已选订单</el-menu-item>
      </el-submenu>
    </el-menu>
  </div>
</template>

<script>
export default {
  data() {
    return {
      //  v-if="role == '教师'"
      //  v-if="role == '学生'"
      // role: '学生'
      role: this.$store.getters.getUser.role.role,
      openeds: [],
    };
  },
  created() {
    // console.log(this.$store.getters.getUser.role);
    // this.setIndex();
  },
  methods: {
    menuClick(index) {
      //存储面包屑数据
      // this.$store.commit('selectMenu',index);
      //跳转路由
      this.$router.push(index);
    },
    // setIndex() {
    //   if (this.role == "教师") this.openeds = [1];
    //   else if (this.role == "学生") this.openeds = [2];
    // },
  },
};
</script>
<style scoped>
</style>