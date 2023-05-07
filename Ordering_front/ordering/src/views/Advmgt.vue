<template>
  <div class="pm_div">
    <div>
      <div class="an_div">
        <el-select v-model="searchClassId" placeholder="请选择班级">
          <el-option
            v-for="item in classInfo"
            :key="item.classId"
            :label="item.className"
            :value="item.classId"
          >
          </el-option>
        </el-select>
        <el-button type="primary" icon="el-icon-search" @click="loadGroup"
        style="margin-left:1%"
          >搜索</el-button
        >
      </div>
    </div>
    <div class="bg_div">
      <el-table
        :data="advData"
        v-loading="loading"
        style="width: 100%"
      >
        <el-table-column prop="marketLocation" label="市场名称"> </el-table-column>
        <el-table-column prop="groupName" label="小组名称" width="200px">
        </el-table-column>
        <el-table-column prop="money" label="投入广告费" width="200px">
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchGroupId: '',
      classInfo: [{
        classId: '1',
        className: '智能财务'
      },
      {
        classId: '2',
        className: '软件工程'
      }
      ],
      advData:[],
    };
  },

  methods: {},
};
</script>
<style scoped>
.pm_div {
  display: flex;
  flex-direction: column;
  margin-left: 1%;
  margin-right: 2%;
}
.an_div {
  display: flex;
  justify-content: flex-start;
  margin-left: 1%;
  margin-right: 1%;
}
.bg_div {
  display: flex;
  flex-direction: column;
  /* background-color: white; */
  padding: 1%;
  width: 500px;
}
</style>