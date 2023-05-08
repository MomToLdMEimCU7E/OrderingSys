<template>
  <div>
    <div class="searchArea">
      <!-- <el-select
        v-model="searchYear"
        placeholder="请选择年度"
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
    <div class="tableArea">
      <div>
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
      <div style="margin-left: 5%">
        <el-table
          :data="statusData"
          style="width: 100%"
          border
          :header-cell-style="tableHeaderColor"
        >
          <el-table-column prop="username" label="企业名称" width="180">
          </el-table-column>
          <el-table-column prop="market" label="当前状态" width="180">
            <template slot-scope="scope">
              <el-tag type="success" v-if="scope.row.market != ''">{{
                "待选择" + scope.row.market
              }}</el-tag>
              <el-tag type="info" v-else>尚未选择</el-tag>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </div>
    <div class="buttonArea">
      <el-button type="primary" @click="gotoOrdermgt()">返回</el-button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      statusData: [],
      orderData: [],
      searchMarket: "",
      searchYear: "",
      searchName: "",
      searchProduct: "",
      //   yearArray: [
      //     { year: 1 },
      //     { year: 2 },
      //     { year: 3 },
      //     { year: 4 },
      //     { year: 5 },
      //     { year: 6 },
      //   ],
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
  mounted() {
    this.loadStatus();
    this.loadHistory();
    this.timer = setInterval(() => {
      this.loadStatus();
      this.loadHistory();
    }, 5000);
  },
  beforeDestroy() {
    clearInterval(this.timer);
  },
  methods: {
    loadHistory() {
      // console.log(this.$route.query.year)
      this.getRequest(
        "/user/historyQuery?year=" +
          this.$route.query.year +
          "&market=" +
          this.searchMarket +
          "&username=" +
          this.searchName +
          "&groupId=" +
          this.$route.query.groupId +
          "&product=" +
          this.searchProduct
      ).then((resp) => {
        if (resp) {
          this.orderData = resp.data.data;
        }
      });
    },
    loadStatus() {
      // console.log(this.$route.query.meetingId)
      this.getRequest(
        "/user/getUserSelectStatus?meetingId=" + this.$route.query.meetingId
      ).then((resp) => {
        if (resp) {
          this.statusData = resp.data.data;
        }
      });
    },
    tableHeaderColor({ row, column, rowIndex, columnIndex }) {
      if (rowIndex === 0) {
        return "background-color: #fff;color:black;font-size:15px;font-weight: 900;";
      }
    },
    gotoOrdermgt() {
      this.$router.push({ path: "/orderingmgt" });
    },
  },
};
</script>
<style scoped>
.searchArea {
  padding: 20px;
}
.tableArea {
  /* margin-top: 1%; */
  display: flex;
  padding: 0 20px;
  justify-content: flex-start;
}
.buttonArea {
  margin-top: 2%;
  padding-left: 20px;
}
</style>