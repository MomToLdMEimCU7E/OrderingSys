<template>
  <div class="pm_div">
    <div class="bg_div">
      <el-table
        :data="meetingData"
        v-loading="loading"
        style="width: 100%"
        :header-cell-style="tableHeaderColor"
      >
        <el-table-column prop="meetingId" label="订货会编号"> </el-table-column>
        <el-table-column prop="meetingName" label="订货会名称" width="200">
        </el-table-column>
        <el-table-column prop="time" label="订货会年度" width="120">
        </el-table-column>
        <el-table-column prop="status" label="订货会状态" width="120">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.status === '已结束'" type="info"
              >已结束</el-tag
            >
            <el-tag v-else-if="scope.row.status === '投放广告中'" type="warning"
              >投放广告中</el-tag
            >
            <el-tag v-else-if="scope.row.status === '选单中'" type="success"
              >选单中</el-tag
            >
            <el-tag v-else>未开始</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="300">
          <template slot-scope="scope">
            <el-button
              type="text"
              @click="gotoAdvertising(scope.row)"
              v-if="scope.row.isAd !== '是' && scope.row.status === '投放广告中'"
            >
              广告投放
            </el-button>
            <el-button
              type="text"
              @click="openAdvDialog(scope.row)"
              v-if="scope.row.isAd === '是'"
            >
              查看广告费
            </el-button>
            <el-button
              type="text"
              @click="gotoOrdering(scope.row)"
              v-if="scope.row.status === '选单中'"
            >
              订货中心
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <el-dialog title="已投放广告费" :visible.sync="advDialogFlag" width="25%">
      <span>
        <el-table
          :data="userFeeData"
          style="width: 100%"
          border
          :header-cell-style="tableHeaderColor"
        >
          <el-table-column prop="market" label="市场"> </el-table-column>
          <el-table-column prop="money" label="已投放金额" width="180">
          </el-table-column>
        </el-table>
      </span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="advDialogFlag = false" type="primary"
          >关 闭</el-button
        >
      </span>
    </el-dialog>
    <div>
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      timer: "",
      uid: this.$store.getters.getUser.role.uid,
      advDialogFlag: false,
      loading: false,
      newMeetingData: {
        class: "",
        year: "",
        term: "",
      },
      meetingData: [],
      userFeeData: [],
    };
  },
  mounted() {
    this.loadMeeting();
    this.timer = setInterval(() => {
      this.loadMeeting();
    }, 5000);
  },
  beforeDestroy() {
    clearInterval(this.timer);
  },
  methods: {
    openAdvDialog(data) {
      this.advDialogFlag = true;
      this.getRequest(
        "/user/getUserFee?uid=" + this.uid + "&meetingId=" + data.meetingId
      ).then((resp) => {
        if (resp) {
          this.userFeeData = resp.data.data;
        }
      });
    },
    gotoAdvertising(data) {
      this.$router.push({
        path: "/advertising",
        query: {
          year: data.time,
          meetingId: data.meetingId,
        },
      });
    },
    gotoOrdering(data) {
      this.$router.push({
        path: "/ordering",
        query: {
          meetingId: data.meetingId,
        },
      });
    },
    loadMeeting() {
      this.loading = true;
      this.getRequest("/market/stuGetMeetingList?uid=" + this.uid).then(
        (resp) => {
          if (resp) {
            this.loading = false;
            this.meetingData = resp.data.data;
            // console.log(this.meetingData);
          }
        }
      );
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
.pm_div {
  display: flex;
  flex-direction: column;
  margin-left: 1%;
  margin-right: 2%;
  width: 1000px;
}
.bg_div {
  display: flex;
  flex-direction: column;
  /* background-color: white; */
  padding: 1%;
}
</style>