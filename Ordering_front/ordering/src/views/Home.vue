<template>
  <div>
    <el-container>
      <el-header style="margin: 0px; padding: 0px">
        <Header></Header>
      </el-header>
      <el-container>
        <el-aside width="200px">
          <Side></Side>
          <!-- <el-menu router>
            <template v-for="(item, index) in this.$router.options.routes">
              <el-submenu :index="index + ''" :key="index" v-if="!item.hidden">
                <template slot="title">
                  <i class="el-icon-location"></i>
                  <span>{{ item.name }}</span>
                </template>
                <el-menu-item
                  :index="children.path"
                  v-for="(children, index2) in item.children"
                  :key="index2"
                >
                  {{ children.name }}
                </el-menu-item>
              </el-submenu>
            </template>
          </el-menu> -->
        </el-aside>
        <el-main>
          <el-breadcrumb v-if="this.$router.currentRoute.path!='/home'" style="margin-bottom:1%">
            <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>{{this.$router.currentRoute.name}}</el-breadcrumb-item>
             <!-- <el-breadcrumb-item :to="current.path" v-if="current" >{{current.label}}</el-breadcrumb-item> -->
          </el-breadcrumb>
          <div class="homeWelcome" v-if="this.$router.currentRoute.path=='/home'">
            欢迎来到ERP订货会
          </div>
          <router-view></router-view
        ></el-main>
      </el-container>
    </el-container>
  </div>
</template>
<script>
import Side from "../components/side.vue";
import Header from "../components/header.vue";
export default {
  components: {
    Side,
    Header,
  },
  data() {
    return {
      // breadcrumbList: [],
    };
  },
  // created(){
  //   console.log(this.$router)
  // },
  computed:{
    breadcrumbList(){

    }
  },
  methods: {},
};
</script>
<style scoped>
.el-aside::-webkit-scrollbar {
  display: none;
}
.homeWelcome{
  text-align: center;
  font-size: 30px;
  /* color: #409eff; */
  padding-top: 50px;
}
</style>