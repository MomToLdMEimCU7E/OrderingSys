<template>
  <div>
    <el-dialog
      title="市场老大"
      :visible.sync="visible"
      :close-on-click-modal="false"
      @close="BossDialogClose"
      :append-to-body="true"
    >
      <div class="bg_div">
        <el-table
          :data="bossData"
          style="width: 100%"
          height="250"
          :span-method="objectSpanMethod"
          :header-cell-style="tableHeaderColor"
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
  </div>
</template>

<script>
export default {
  name: "BossListDialog",
  props: {
    BossDialogFlag: {
      default: false,
    },
    meetingId: {
      type: String,
    },
  },
  data() {
    return {
      visible: false,
      CmeetingId: "",
      teacherUid: this.$store.getters.getUser.role.uid,
      bossData: [],
    };
  },
//   methods: {
//     BossDialogClose() {
//       this.$emit("update:BossDialogFlag", false);
//       //   console.log(this.OrderinfoDialogFlag)
//     },
//     loadBossList() {
//       this.getRequest("/user/GetBossList?meetingId=" + this.CmeetingId).then(
//         (resp) => {
//           if (resp) {
//             this.bossData = resp.data.data;
//           }
//         }
//       );
//     },
//     objectSpanMethod({ row, column, rowIndex, columnIndex }) {
//       if (columnIndex === 0) {
//         if (rowIndex % 4 === 0) {
//           return {
//             rowspan: 4,
//             colspan: 1,
//           };
//         } else {
//           return {
//             rowspan: 0,
//             colspan: 0,
//           };
//         }
//       }
//     },
//     tableHeaderColor({ row, column, rowIndex, columnIndex }) {
//       if (rowIndex === 0) {
//         return "background-color: #fff;color:black;font-size:15px;font-weight: 900;";
//       }
//     },
//   },

  watch: {
    AdvmgtDialogFlag() {
      this.visible = this.BossDialogFlag;
      this.CmeetingId = this.meetingId;
    //   this.loadBossList();
    },
  },
};
</script>
<style scoped>
</style>