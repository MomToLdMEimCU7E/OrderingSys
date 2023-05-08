<template>
  <div>
    <div class="topView">
      <el-button size="mini" type="info" @click="gotoOrderall"
        >返回订货会</el-button
      >
    </div>
    <el-table
      :data="meetingData"
      :span-method="objectSpanMethod"
      :cell-style="columnbackgroundStyle"
      :header-cell-style="tableHeaderColor"
      :row-style="{ height: '30px' }"
      border
      style="width: 50%; margin-top: 20px"
    >
      <el-table-column prop="market" label="市场" width="80" align="center">
      </el-table-column>
      <el-table-column prop="product" label="产品" width="200" align="center">
      </el-table-column>
      <el-table-column prop="status" label="当前状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === '0'">可选单</el-tag>
          <el-tag v-else-if="scope.row.status === '1'" type="success"
            >已完成</el-tag
          >
          <el-tag v-else-if="scope.row.status === '排队中'" type="info"
            >排队中</el-tag
          ><el-tag v-else-if="scope.row.status === '待选择'" type="success"
            >待选择</el-tag
          >
          <el-tag v-else-if="scope.row.status === '选择中'" type="success"
            >选择中</el-tag
          >
          <el-tag v-else-if="scope.row.status === '已完成'" type="success"
            >已完成</el-tag
          >
          <!-- <el-tag v-if="scope.row.status != ''">{{ scope.row.status }}</el-tag> -->
        </template>
      </el-table-column>
      <el-table-column label="操作" width="150">
        <template slot-scope="scope">
          <el-button
            type="primary"
            @click="OrderClick(scope.row)"
            v-if="
              scope.row.status === '待选择' || scope.row.status === '选择中'
            "
            size="mini"
            >进入选单</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <OrderinfoDialog
      :marketId.sync="marketId"
      :meetingId.sync="meetingId"
      :OrderinfoDialogFlag.sync="OrderinfoDialogFlag"
      :lock.sync="lock"
    />
  </div>
</template>

<script>
export default {
  components: {
    OrderinfoDialog: () => import("../../components/orderinfo.vue"),
  },
  data() {
    return {
      lock: 0,
      timer: "",
      uid: this.$store.getters.getUser.role.uid,
      marketId: "",
      meetingId: "",
      meetingData: [],
      OrderinfoDialogFlag: false,
    };
  },
  mounted() {
    this.loadStatus();
    this.timer = setInterval(() => {
      this.loadStatus();
    }, 5000);
  },
  beforeDestroy() {
    clearInterval(this.timer);
  },
  methods: {
    loadStatus() {
      this.getRequest(
        "/order/getSelectStatus?uid=" +
          this.uid +
          "&meetingId=" +
          this.$route.query.meetingId
      ).then((resp) => {
        if (resp) {
          this.meetingData = resp.data.data;
        }
      });
    },
    gotoOrderall() {
      this.$router.push({ path: "/orderall" });
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
    columnbackgroundStyle({ row, column, rowIndex, columnIndex }) {
      if (columnIndex == 0) {
        return "background:AliceBlue;";
      }
      if (columnIndex == 1) {
        return "background:AliceBlue;";
      }
    },
    OrderClick(data) {
      this.OrderinfoDialogFlag = true;
      // console.log(data)
      this.marketId = String(data.marketId);
      this.meetingId = this.$route.query.meetingId;
    },
    tableHeaderColor({ row, column, rowIndex, columnIndex }) {
      if (rowIndex === 0) {
        return "background: Azure;color:black;font-size:15px;font-weight: 900;";
      }
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
<!-- <template>
  <div>
    <div class="bg_div">
      <el-table
        border
        ref="multipleTable"
        :data="orderData"
        v-loading="loading"
        style="width: 100%"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" width="55"> </el-table-column>
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
        <el-table-column prop="urgent" label="条件"> </el-table-column>
      </el-table>
      <div style="margin-top: 20px">
    <el-button @click="submitOrder()">提交订单</el-button>
    <el-button @click="toggleSelection()">取消选择</el-button>
  </div>
    </div>
  </div>
</template>

<script>
import { getRequest } from "@/utils/api";
export default {
  data() {
    return {
      orderData: [],
      orderList: [],
      multipleSelection: [],
      year: "1",
    };
  },
  mounted() {
    this.loadOrder();
  },
  methods: {
    loadOrder() {
      getRequest("/order/getOrdersByYear?year=" + this.year).then((resp) => {
        if (resp) {
          this.orderData = resp.data.data;
        }
      });
    },
    toggleSelection(rows) {
        if (rows) {
          rows.forEach(row => {
            this.$refs.multipleTable.toggleRowSelection(row);
          });
        } else {
          this.$refs.multipleTable.clearSelection();
        }
      },
       handleSelectionChange(val) {
        this.orderList = val;
      }
  },
};
</script>
<style scoped>
.bg_div {
  display: flex;
  flex-direction: column;
  /* background-color: white; */
  padding: 1%;
}
</style> !-->