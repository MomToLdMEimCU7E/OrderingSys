<template>
  <div>
    <el-dialog
      title="可选订单"
      :visible.sync="visible"
      :close-on-click-modal="false"
      @close="OrderinfoDialogClose"
      :append-to-body="true"
    >
      <div class="topView">
        <el-tag style="margin-right: 1%" effect="dark"
          >当前市场已投放广告费: {{ advFeeData }}</el-tag
        >
        <el-tag style="margin-right: 1%" effect="dark"
          >可选择订单数: {{ maxOrder }}</el-tag
        >
      </div>
      <div class="bg_div">
        <el-table
          ref="multipleTableRef"
          :data="orderData"
          style="width: 100%"
          height="250"
          @selection-change="handleSelectionChange"
        >
          <el-table-column type="selection"></el-table-column>
          <el-table-column fixed prop="orderId" label="订单编号" width="90">
          </el-table-column>
          <el-table-column prop="time" label="年度"> </el-table-column>
          <el-table-column prop="market" label="市场"> </el-table-column>
          <el-table-column prop="amount" label="数量"> </el-table-column>
          <el-table-column prop="price" label="单价"> </el-table-column>
          <el-table-column prop="total" label="总价"> </el-table-column>
          <el-table-column prop="period" label="账期"> </el-table-column>
          <el-table-column label="条件">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.urgent === '加急'">加急</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="iso认证" width="130">
            <template slot-scope="scope">
              <el-tag v-if="scope.row.iso === 'ISO9000'">ISO9000</el-tag>
              <el-tag v-else-if="scope.row.iso === 'ISO14000'">ISO14000</el-tag>
              <el-tag v-else-if="scope.row.iso === 'ISO9000/ISO14000'"
                >ISO9000/ISO14000</el-tag
              >
            </template>
          </el-table-column>
          <!-- <el-table-column fixed="right" label="操作" width="100">
            <template slot-scope="scope">
              <el-button
                v-if="isChosed[scope.$index] === -1"
                @click="chooseOrder(scope.$index, scope.row)"
                type="primary"
                size="small"
                >选择</el-button
              >
              <el-button
                v-else-if="isChosed[scope.$index] === scope.$index"
                @click="withdrawOrder(scope.$index, scope.row)"
                type="danger"
                size="small"
                >退选</el-button
              >
            </template>
          </el-table-column> -->
        </el-table>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="OrderinfoDialogClose">取 消</el-button>
        <el-button type="primary" @click="chooseOrder">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "OrderinfoDialog",
  props: {
    OrderinfoDialogFlag: {
      default: false,
    },
    meetingId: {
      type: String,
    },
    marketId: {
      type: String,
    },
  },
  data() {
    return {
      visible: false,
      uid: this.$store.getters.getUser.role.uid,
      CmeetingId: "",
      CmarketId: "",
      orderVoList: [],
      orderData: [],
      chosedOrderData: [],
      maxOrder: "",
      advFeeData: "",
    };
  },
  methods: {
    handleSelectionChange(val, row) {
      if (val.length > this.maxOrder) {
        let del_row = val.shift();
        this.$refs.multipleTableRef.toggleRowSelection(del_row, false);
        this.orderVoList = val;
      } else {
        this.orderVoList = val;
      }
      // console.log(this.orderVoList);
    },
    calculateMaxOrder() {
      this.getRequest(
        "/order/getCurrentMarketAdFee?uid=" +
          this.uid +
          "&meetingId=" +
          this.CmeetingId +
          "&marketId=" +
          this.CmarketId
      ).then((resp) => {
        if (resp) {
          this.advFeeData = resp.data.data;
          this.maxOrder = Math.round(this.advFeeData / 2);
          console.log(this.maxOrder);
        }
      });
    },
    chooseOrder() {
      this.$confirm("确定提交吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then((resp) => {
          this.postRequest(
            "/order/selectOrder?uid=" +
              this.uid +
              "&meetingId=" +
              this.CmeetingId +
              "&marketId=" +
              this.CmarketId,
            this.orderVoList
          ).then((resp) => {
            if (resp.data.msg == "成功") {
              this.$message({
                message: "选择成功",
                type: "success",
              });
              this.$emit("update:OrderinfoDialogFlag", false);
              this.orderVoList = [];
            } else {
              this.$message.error("选择失败");
            }
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消提交",
          });
        });
    },
    OrderinfoDialogClose() {
      this.$emit("update:OrderinfoDialogFlag", false);
      this.$parent.loadStatus();
      //   console.log(this.OrderinfoDialogFlag)
    },
    loadOrder() {
      this.getRequest(
        "/order/getOrderAvailable?meetingId=" +
          this.CmeetingId +
          "&marketId=" +
          this.CmarketId +
          "&uid=" +
          this.uid
      ).then((resp) => {
        if (resp) {
          this.orderData = resp.data.data;
          // for (var i = 0; i < this.orderData.length; i++) {
          //   this.isChosed[i] = -1;
          // }
        }
      });
    },
  },
  watch: {
    OrderinfoDialogFlag(data) {
      if (data == true) {
        this.visible = this.OrderinfoDialogFlag;
        this.CmarketId = this.marketId;
        this.CmeetingId = this.meetingId;
        this.loadOrder();
        this.calculateMaxOrder();
      } else {
        this.visible = this.OrderinfoDialogFlag;
      }
      // console.log(this.isChosed[0]);
      // console.log(this.CmarketId);
      // console.log(this.CmeetingId);
    },
  },
};
</script>
<style scoped>
.topView {
  display: flex;
  justify-content: flex-start;
  font-size: 120%;
  margin-bottom: 1%;
}
</style>