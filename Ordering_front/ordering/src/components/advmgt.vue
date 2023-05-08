<template>
  <div>
    <el-dialog
      title="广告投放管理"
      :visible.sync="visible"
      :close-on-click-modal="false"
      @close="AdvmgtDialogClose"
      :append-to-body="true"
      width="30%"
    >
      <div class="bg_div">
        <el-table :data="groupData" style="width: 100%" height="250">
          <el-table-column prop="username" label="公司名称" width="150">
          </el-table-column>
          <el-table-column label="是否提交">
            <template slot-scope="scope">
              <el-tag type="success" v-if="scope.row.status === '是'"
                >是</el-tag
              >
              <el-tag type="danger" v-else-if="scope.row.status === '否'"
                >否</el-tag
              >
            </template>
          </el-table-column>
          <el-table-column>
            <template slot-scope="scope">
              <el-popover placement="right" width="300" trigger="click">
                <el-table :data="userFeeData">
                  <el-table-column
                    width="100"
                    property="market"
                    label="市场"
                  ></el-table-column>
                  <el-table-column
                    width="150"
                    property="money"
                    label="已投入广告费"
                  ></el-table-column>
                </el-table>
                <el-button
                  slot="reference"
                  @click="showMoney(scope.row)"
                  size="mini"
                  >点击查看广告费</el-button
                >
              </el-popover>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="AdvmgtDialogClose">关 闭</el-button>
        <el-button @click="loadStatus()" type="success">刷新状态</el-button>
        <el-button type="primary" @click="endAdv" v-if="endAdvFlag === false"
          >结束广告投放</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "AdvmgtDialog",
  props: {
    AdvmgtDialogFlag: {
      default: false,
    },
    meetingId: {
      type: String,
    },
    meetingStatus: {
      type: String,
    },
    lock: {
      default: 0,
    },
  },
  data() {
    return {
      clock: 0,
      visible: false,
      CmeetingId: "",
      endAdvFlag: true,
      // null != window.sessionStorage.getItem("endAdvState")
      //   ? JSON.parse(window.sessionStorage.getItem("endAdvState"))
      //   : false,
      teacherUid: this.$store.getters.getUser.role.uid,
      groupData: [],
      userFeeData: [],
    };
  },
  // updated() {
  //   this.timer = setInterval(() => {
  //     this.loadStatus();
  //   }, 5000);
  // },
  // beforeDestroy() {
  //   clearInterval(this.timer);
  // },
  methods: {
    AdvmgtDialogClose() {
      this.$emit("update:AdvmgtDialogFlag", false);
      //   console.log(this.OrderinfoDialogFlag)
    },
    loadStatus() {
      this.getRequest(
        "/user/advertiseStatus?meetingId=" + this.CmeetingId
      ).then((resp) => {
        if (resp) {
          this.groupData = resp.data.data;
        }
      });
    },
    endAdv() {
      this.putRequest(
        "/market/startOrder?meetingId=" +
          this.CmeetingId +
          "&teacherUid=" +
          this.teacherUid
      ).then((resp) => {
        if (resp.data.msg == "成功") {
          this.endAdvFlag = true;
          // window.sessionStorage.setItem("endAdvState", JSON.stringify(this.endAdvFlag));
          this.$emit("update:AdvmgtDialogFlag", false);
          this.postRequest(
            "/order/generateSequence?meetingId=" + this.CmeetingId
          );
          this.$parent.loadMeeting();
          this.$message({
            message: "成功结束",
            type: "success",
          });
        } else {
          this.loading = false;
          this.$message.error("结束失败");
        }
      });
    },
    showMoney(data) {
      this.getRequest(
        "/user/getUserFee?uid=" + data.uid + "&meetingId=" + this.CmeetingId
      ).then((resp) => {
        if (resp) {
          this.userFeeData = resp.data.data;
        }
      });
    },
  },
  watch: {
    AdvmgtDialogFlag() {
      this.clock = this.lock;
      this.visible = this.AdvmgtDialogFlag;
      this.CmeetingId = this.meetingId;
      if (this.clock == 0) {
        this.loadStatus();
        this.clock += 1;
      }
      if (this.meetingStatus === "投放广告中") this.endAdvFlag = false;
    },
  },
};
</script>
<style scoped>
</style>