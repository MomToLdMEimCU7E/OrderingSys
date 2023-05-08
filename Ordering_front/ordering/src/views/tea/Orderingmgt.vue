<template>
  <div class="pm_div">
    <div>
      <div class="an_div">
        <el-button
          type="success"
          icon="el-icon-plus"
          @click="newMeetingDialogVisible = true"
          size="mini"
          >新建订货会</el-button
        >
      </div>
    </div>
    <el-dialog
      title="添加订货会"
      width="20%"
      :visible.sync="newMeetingDialogVisible"
    >
      <el-form ref="newMeetingData" :model="newMeetingData">
        <el-form-item label="班级">
          <el-select
            v-model="newMeetingData.groupId"
            placeholder="请选择班级"
            style="width: 75%"
          >
            <el-option
              v-for="group in classData"
              :key="group.groupId"
              :label="group.week"
              :value="group.groupId"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item style="margin-left: 45%">
          <el-button @click="newMeetingDialogVisible = false" size="mini"
            >取消</el-button
          >
          <el-button type="primary" size="mini" @click="addMeeting"
            >确认添加</el-button
          >
        </el-form-item>
      </el-form>
    </el-dialog>
    <div class="bg_div">
      <el-table
        :data="meetingData"
        v-loading="loading"
        style="width: 100%"
        :header-cell-style="tableHeaderColor"
      >
        <el-table-column prop="meetingName" label="订货会名称" width="230">
        </el-table-column>
        <el-table-column prop="groupName" label="班级" width="160"> </el-table-column>
        <el-table-column prop="status" label="订货会状态" width="120">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.status === '已结束'" type="info"
              >已结束</el-tag
            >
            <el-tag v-else-if="scope.row.status === '选单中'" type="success"
              >选单中</el-tag
            >
            <el-tag v-else-if="scope.row.status === '投放广告中'" type="warning"
              >投放广告中</el-tag
            >
            <el-tag v-else>未开始</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="time" label="当前订货年度" width="120">
        </el-table-column>
        <el-table-column label="操作" width="500">
          <template slot-scope="scope">
            <el-button type="text" @click="openHistoryDialog(scope.row)">
              历史查询
            </el-button>
            <el-button type="text" @click="openAdvmgtDialog(scope.row)">
              广告投放管理
            </el-button>
            <el-button type="text" @click="toMeetingDetail(scope.row)">
              订货会管理
            </el-button>
            <el-button type="text" @click="openBossListDialog(scope.row)">
              查看市场老大
            </el-button>
            <el-button
              v-if="scope.row.status === '未开始'"
              type="text"
              @click="beginMeeting(scope.row)"
            >
              开始订货会
            </el-button>
            <el-button
              v-if="scope.row.status === '选单中'"
              type="text"
              @click="endMeeting(scope.row)"
            >
              结束订货会
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <el-dialog
      title="市场老大"
      :visible.sync="BossDialogFlag"
      :close-on-click-modal="false"
      @close="BossDialogClose"
      :append-to-body="true"
    >
      <div style="height: 60%">
        <el-table
          :data="bossData"
          style="width: 100%"
          :span-method="objectSpanMethod"
          :header-cell-style="tableHeaderColor"
          border
        >
          <el-table-column prop="market" label="市场" width="150">
          </el-table-column>
          <el-table-column prop="product" label="产品"> </el-table-column>
          <el-table-column prop="username" label="市场老大"> </el-table-column>
        </el-table>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="BossDialogClose">关 闭</el-button>
      </span>
    </el-dialog>
    <AdvmgtDialog
      :meetingId.sync="meetingId"
      :AdvmgtDialogFlag.sync="AdvmgtDialogFlag"
      :meetingStatus.sync="meetingStatus"
      :lock.sync="lock"
    />
    <HistoryDialog
      :groupId.sync="groupId"
      :year.sync="year"
      :HistoryDialogFlag.sync="HistoryDialogFlag"
      :lock.sync="lock"
    />
  </div>
</template>

<script>
export default {
  components: {
    AdvmgtDialog: () => import("../../components/advmgt.vue"),
    HistoryDialog: () => import("../../components/history.vue"),
    // BossListDialog: () => import("../../components/bosslist.vue"),
  },
  data() {
    return {
      lock:0,
      teacherUid: this.$store.getters.getUser.role.uid,
      loading: false,
      newMeetingDialogVisible: false,
      BossDialogFlag: false,
      AdvmgtDialogFlag: false,
      HistoryDialogFlag: false,
      newMeetingData: {
        class: "",
        groupId: "",
        meeitngName: "",
      },
      groupId: "",
      year: "",
      meetingId: "",
      meetingStatus: '',
      meetingData: [],
      classData: [],
      bossData: [],
    };
  },
  mounted() {
    this.loadMeeting();
    this.loadClass();
  },

  methods: {
    loadClass() {
      this.getRequest(
        "/user/getTeacherGroups?teacherUid=" + this.teacherUid
      ).then((resp) => {
        if (resp) {
          this.classData = resp.data.data;
        }
      });
    },
    loadMeeting() {
      this.loading = true;
      this.getRequest(
        "/market/getMeetingList?teacherUid=" + this.teacherUid
      ).then((resp) => {
        if (resp) {
          this.loading = false;
          this.meetingData = resp.data.data;
        }
      });
    },
    addMeeting() {
      this.postRequest(
        "/market/createMeeting?teacherUid=" +
          this.teacherUid +
          "&groupId=" +
          this.newMeetingData.groupId
      ).then((resp) => {
        if (resp.data.msg === "成功") {
          this.loading = true;
          this.loadMeeting();
          this.$message({
            message: "添加成功",
            type: "success",
          });
        } else {
          this.$message({
            message: "添加失败",
            type: "error",
          });
        }
      });
      this.newMeetingDialogVisible = false;
    },
    tableHeaderColor({ row, column, rowIndex, columnIndex }) {
      if (rowIndex === 0) {
        return "background-color: #fff;color:black;font-size:15px;font-weight: 900;";
      }
    },
    openHistoryDialog(data) {
      this.HistoryDialogFlag = true;
      this.groupId = String(data.groupId);
      this.year = data.time;
    },
    openAdvmgtDialog(data) {
      this.AdvmgtDialogFlag = true;
      this.meetingId = String(data.meetingId);
      this.meetingStatus = data.status;
    },
    openBossListDialog(data) {
      this.BossDialogFlag = true;
      this.getRequest("/user/getBossList?meetingId=" + data.meetingId).then(
        (resp) => {
          if (resp) {
            this.bossData = resp.data.data;
          }
        }
      );
    },
    BossDialogClose() {
      this.BossDialogFlag = false;
    },
    objectSpanMethod({ row, column, rowIndex, columnIndex }) {
      if (columnIndex === 0) {
        if (rowIndex % 4 === 0) {
          return {
            rowspan: 4,
            colspan: 1,
          };
        } else {
          return {
            rowspan: 0,
            colspan: 0,
          };
        }
      }
    },
    tableHeaderColor({ row, column, rowIndex, columnIndex }) {
      if (rowIndex === 0) {
        return "background-color: #fff;color:black;font-size:15px;font-weight: 900;";
      }
    },
    toMeetingDetail(data) {
      console.log(data.time)
      this.$router.push({
        path: "/meetingdetail",
        query: {
          meetingId: data.meetingId,
          year: data.time,
          groupId: data.groupId,
        },
      });
    },
    beginMeeting(rowData) {
      this.putRequest(
        "/market/startMeeting?meetingId=" + rowData.meetingId
      ).then((resp) => {
        if (resp.data.msg === "成功") {
          this.loadMeeting();
          this.$message({
            message: "操作成功，订货会已开始",
            type: "success",
          });
        } else {
          this.$message({
            message: "操作失败",
            type: "error",
          });
        }
      });
    },
    endMeeting(rowData) {
      this.putRequest(
        "/market/finishMeeting?meetingId=" +
          rowData.meetingId +
          "&teacherUid=" +
          this.teacherUid
      ).then((resp) => {
        if (resp.data.msg === "成功") {
          this.loadMeeting();
          this.$message({
            message: "操作成功，订货会已开始",
            type: "success",
          });
        } else {
          this.$message({
            message: "操作失败",
            type: "error",
          });
        }
      });
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
  width: 1200px;
}
.an_div {
  display: flex;
  justify-content: flex-end;
  margin-left: 1%;
  margin-right: 1%;
}
.bg_div {
  display: flex;
  flex-direction: column;
  /* background-color: white; */
  padding: 1%;
}
</style>