<template>
  <div>
    <el-dialog
      title="历史管理"
      :visible.sync="visible"
      :close-on-click-modal="false"
      @close="HistoryDialogClose"
      :append-to-body="true"
      width="60%"
    >
      <div class="searchArea">
        <!-- <el-select
          v-model="searchYear"
          placeholder="请选择年份"
          style="width: 150px; margin-right: 2%"
        >
          <el-option
            v-for="item in yearArray"
            :key="item.year"
            :label="item.year"
            :value="item.year"
          >
          </el-option>
        </el-select> -->
        <el-select
          v-model="searchMarket"
          placeholder="请选择市场"
          style="width: 150px; margin-right: 2%"
          clearable
        >
          <el-option
            v-for="item in marketArray"
            :key="item.marketId"
            :label="item.marketName"
            :value="item.marketId"
          >
          </el-option>
        </el-select>
        <el-select
          v-model="searchProduct"
          placeholder="请选择产品"
          style="width: 150px; margin-right: 2%"
          clearable
        >
          <el-option
            v-for="item in productArray"
            :key="item.productId"
            :label="item.producttName"
            :value="item.productId"
          >
          </el-option>
        </el-select>
        <el-input
          class="ss_input"
          prefix-icon="el-icon-search"
          placeholder="请输入公司名称进行搜索"
          v-model="searchName"
          clearable
          style="width: 250px; margin-right: 2%"
        ></el-input>
        <el-button type="primary" icon="el-icon-search" @click="loadHistory"
          >搜索</el-button
        >
      </div>
      <div class="bg_div">
        <el-table :data="orderData" style="width: 100%" height="250">
          <el-table-column fixed prop="orderId" label="订单编号" width="150">
          </el-table-column>
          <el-table-column prop="time" label="年度"> </el-table-column>
          <el-table-column prop="product" label="产品"> </el-table-column>
          <el-table-column prop="market" label="市场"> </el-table-column>
          <el-table-column prop="amount" label="数量"> </el-table-column>
          <el-table-column prop="price" label="单价"> </el-table-column>
          <el-table-column prop="total" label="总价"> </el-table-column>
          <!-- <el-table-column prop="period" label="账期"> </el-table-column> -->
          <el-table-column prop="username" label="归属公司"> </el-table-column>
        </el-table>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="HistoryDialogClose">关闭</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "HistoryDialogFlag",
  props: {
    HistoryDialogFlag: {
      default: false,
    },
    groupId: {
      type: String,
    },
    year: {
      type: String,
    },
    lock: {
      default: 0,
    }
  },
  data() {
    return {
      clock: "",
      visible: false,
      searchMarket: "",
      searchYear: "",
      searchName: "",
      searchProduct: "",
      CgroupId: "",
      Cyear: "",
      orderData: [
        {
          number: "B00023",
          year: "1",
          market: "本地",
          amount: "2",
          price: "5",
          total: "10",
          period: "3",
          urgent: "1",
          company: "米奇妙妙屋",
        },
      ],
      // yearArray: [
      //   { year: 1 },
      //   { year: 2 },
      //   { year: 3 },
      //   { year: 4 },
      //   { year: 5 },
      //   { year: 6 },
      // ],
      marketArray: [
        {
          marketId: "本地",
          marketName: "本地",
        },
        {
          marketId: "区域",
          marketName: "区域",
        },
        {
          marketId: "国内",
          marketName: "国内",
        },
        {
          marketId: "亚洲",
          marketName: "亚洲",
        },
        {
          marketId: "国际",
          marketName: "国际",
        },
      ],
      productArray: [
        {
          productId: "P1",
          producttName: "P1",
        },
        {
          productId: "P2",
          producttName: "P2",
        },
        {
          productId: "P3",
          producttName: "P3",
        },
        {
          productId: "P4",
          producttName: "P4",
        },
      ],
    };
  },
  methods: {
    HistoryDialogClose() {
      this.$emit("update:HistoryDialogFlag", false);
      this.searchMarket = "";
      this.searchYear = "";
      this.searchName = "";
      this.searchProduct = "";
      //   console.log(this.OrderinfoDialogFlag)
    },
    loadHistory() {
      this.getRequest(
        "/user/historyQuery?year=" +
          this.Cyear +
          "&market=" +
          this.searchMarket +
          "&username=" +
          this.searchName +
          "&groupId=" +
          this.CgroupId +
          "&product=" +
          this.searchProduct
      ).then((resp) => {
        if (resp) {
          this.orderData = resp.data.data;
        }
      });
    },
  },
  watch: {
    HistoryDialogFlag() {
      this.clock = this.lock;
      this.visible = this.HistoryDialogFlag;
      this.CgroupId = this.groupId;
      this.Cyear = this.year;
      if (this.clock == 0) {
        this.loadHistory();
        this.clock += 1;
        // console.log(this.groupId, this.Cyear);
      }
    },
  },
};
</script>
<style scoped>
</style>