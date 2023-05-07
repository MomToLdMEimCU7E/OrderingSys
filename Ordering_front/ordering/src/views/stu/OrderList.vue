<template>
  <div>
    <div class="searchArea">
      <el-select
        v-model="searchMeetingId"
        placeholder="请选择订货会"
        style="width: 250px; margin-right: 2%"
        clearable
      >
        <el-option
          v-for="item in meetingData"
          :key="item.meetingId"
          :label="item.meetingName"
          :value="item.meetingId"
        >
        </el-option>
      </el-select>
      <el-button type="primary" icon="el-icon-search" @click="loadOrder"
        >搜索</el-button
      >
    </div>
    <div class="bg_div">
      <el-table
        border
        :data="orderData"
        v-loading="loading"
        style="width: 100%"
        :header-cell-style="tableHeaderColor"
      >
        <div slot="empty">
          <div v-if="this.searchMeetingId === ''">请选择订货会进行查询</div>
          <div v-else>暂无数据</div>
        </div>
        <el-table-column prop="orderId" label="竞单编号"> </el-table-column>
        <el-table-column
          prop="product"
          label="产品"
          width="200px"
        ></el-table-column>
        <el-table-column prop="market" label="区域"> </el-table-column>
        <el-table-column prop="amount" label="数量"> </el-table-column>
        <el-table-column prop="price" label="单价"> </el-table-column>
        <el-table-column prop="total" label="总价"> </el-table-column>
        <el-table-column prop="period" label="账期"> </el-table-column>
        <el-table-column prop="urgent" label="条件">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.urgent === '0'"></el-tag>
            <el-tag v-else-if="scope.row.urgent === '1'" type="warning"
              >加急</el-tag
            >
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchMeetingId: "",
      orderData: [],
      meetingData: [],
      multipleSelection: [],
      uid: this.$store.getters.getUser.role.uid,
      meetingId: "3",
      loading: false,
    };
  },
  mounted() {
    // this.loadOrder();
    this.loadMeeting();
  },
  methods: {
    loadMeeting() {
      this.getRequest("/market/stuGetMeetingList?uid=" + this.uid).then(
        (resp) => {
          if (resp) {
            this.meetingData = resp.data.data;
          }
        }
      );
    },
    loadOrder() {
      this.loading = true;
      if (this.searchMeetingId != "") {
        this.getRequest(
          "/order/getSelectedOrders?uid=" +
            this.uid +
            "&meetingId=" +
            this.searchMeetingId
        ).then((resp) => {
          if (resp) {
            this.loading = false;
            this.orderData = resp.data.data;
          }
        });
      }
      else{
        this.$message({
            type: "warning",
            message: "请选择订货会进行搜索",
          });
      }
    },
    tableHeaderColor({ row, column, rowIndex, columnIndex }) {
      if (rowIndex === 0) {
        return "background-color: #fff;color:black;font-size:15px;font-weight: 900;";
      }
    },
  },
};
</script>
<style scoped>
.searchArea {
  padding: 1%;
}
.bg_div {
  display: flex;
  flex-direction: column;
  /* background-color: white; */
  padding: 1%;
}
</style>