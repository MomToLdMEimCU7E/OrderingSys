<template>
  <div>
    <div class="topView">
      <el-tag style="margin-right: 1%" effect="dark"
        >当前订货会编号: {{ meetingId }}</el-tag
      >
      <el-tag effect="dark">当前年度: {{ year }}</el-tag>
    </div>
    <div class="AdvView">
      <div class="cardArea">
        <el-card style="width: 20%" shadow="hover">
          <div slot="header" class="clearfix">
            <span>P1广告费</span>
            <el-button
              style="float: right; padding: 3px 0"
              type="text"
              @click="clearP1"
              >清空</el-button
            >
          </div>
          <div>
            <el-form :model="P1bdform">
              <el-form-item label="本地">
                <el-input
                  v-model="P1bdform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="bdShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P1qyform">
              <el-form-item label="区域">
                <el-input
                  v-model="P1qyform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="qyShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P1gnform">
              <el-form-item label="国内">
                <el-input
                  v-model="P1gnform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="gnShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P1yzform">
              <el-form-item label="亚洲">
                <el-input
                  v-model="P1yzform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="yzShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P1gjform">
              <el-form-item label="国际">
                <el-input
                  v-model="P1gjform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="gjShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
        <el-card style="width: 20%" shadow="hover">
          <div slot="header" class="clearfix">
            <span>P2广告费</span>
            <el-button
              style="float: right; padding: 3px 0"
              type="text"
              @click="clearP2"
              >清空</el-button
            >
          </div>
          <div>
            <el-form :model="P2bdform">
              <el-form-item label="本地">
                <el-input
                  v-model="P2bdform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="bdShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P2qyform">
              <el-form-item label="区域">
                <el-input
                  v-model="P2qyform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="qyShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P2gnform">
              <el-form-item label="国内">
                <el-input
                  v-model="P2gnform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="gnShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P2yzform">
              <el-form-item label="亚洲">
                <el-input
                  v-model="P2yzform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="yzShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P2gjform">
              <el-form-item label="国际">
                <el-input
                  v-model="P2gjform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="gjShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
        <el-card style="width: 20%" shadow="hover">
          <div slot="header" class="clearfix">
            <span>P3广告费</span>
            <el-button
              style="float: right; padding: 3px 0"
              type="text"
              @click="clearP3"
              >清空</el-button
            >
          </div>
          <div>
            <el-form :model="P3bdform">
              <el-form-item label="本地">
                <el-input
                  v-model="P3bdform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="bdShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P3qyform">
              <el-form-item label="区域">
                <el-input
                  v-model="P3qyform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="qyShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P3gnform">
              <el-form-item label="国内">
                <el-input
                  v-model="P3gnform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="gnShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P3yzform">
              <el-form-item label="亚洲">
                <el-input
                  v-model="P3yzform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="yzShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P3gjform">
              <el-form-item label="国际">
                <el-input
                  v-model="P3gjform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="gjShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
        <el-card style="width: 20%" shadow="hover">
          <div slot="header" class="clearfix">
            <span>P4广告费</span>
            <el-button
              style="float: right; padding: 3px 0"
              type="text"
              @click="clearP4"
              >清空</el-button
            >
          </div>
          <div>
            <el-form :model="P4bdform">
              <el-form-item label="本地">
                <el-input
                  v-model="P4bdform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="bdShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P4qyform">
              <el-form-item label="区域">
                <el-input
                  v-model="P4qyform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="qyShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P4gnform">
              <el-form-item label="国内">
                <el-input
                  v-model="P4gnform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="gnShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P4yzform">
              <el-form-item label="亚洲">
                <el-input
                  v-model="P4yzform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="yzShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
            <el-form :model="P4gjform">
              <el-form-item label="国际">
                <el-input
                  v-model="P4gjform.money"
                  style="width: 70%"
                  size="mini"
                  :disabled="gjShowFlag"
                ></el-input>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
      </div>
      <div class="buttonArea">
        <el-button type="info" @click="gotoOrderall()">返回</el-button>
        <!-- <el-button type="success">暂存</el-button> -->
        <el-button type="primary" @click="addAdv">提交</el-button>
      </div>
    </div>
    <!-- <div class="AdvView">
      <el-form ref="advform" :model="advform.item">
        <el-table :data="advform.tableData">
          <el-table-column
            prop="market"
            label="产品"
            width="80"
          ></el-table-column>
          <el-table-column prop="name" label="本地市场" width="120">
            <template slot-scope="scope">
              <el-form-item>
                <el-input v-model="scope.row.name"></el-input>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column prop="name" label="区域市场" width="120">
            <template slot-scope="scope">
              <el-form-item>
                <el-input v-model="scope.row.name"></el-input>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column prop="name" label="国内市场" width="120">
            <template slot-scope="scope">
              <el-form-item>
                <el-input  :disabled="true"></el-input>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column prop="name" label="亚洲市场" width="120">
            <template slot-scope="scope">
              <el-form-item>
                <el-input  :disabled="true"></el-input>
              </el-form-item>
            </template>
          </el-table-column>
          <el-table-column prop="name" label="国际市场" width="120">
            <template slot-scope="scope">
              <el-form-item>
                <el-input  :disabled="true"></el-input>
              </el-form-item>
            </template>
          </el-table-column>
        </el-table>
        <div class="buttonArea">
          <el-button type="info" @click="gotoOrderall()">返回</el-button>
          <el-button type="success">暂存</el-button>
          <el-button type="primary">提交</el-button>
        </div>
      </el-form>
    </div> -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      meetingId: this.$route.query.meetingId,
      year: this.$route.query.year,
      bdShowFlag: false,
      qyShowFlag: false,
      gnShowFlag: false,
      yzShowFlag: false,
      gjShowFlag: false,
      advData: [],
      advDataF: [],
      P1bdform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "1",
        money: "",
      },
      P1qyform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "5",
        money: "",
      },
      P1gnform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "9",
        money: "",
      },
      P1yzform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "13",
        money: "",
      },
      P1gjform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "17",
        money: "",
      },
      P2bdform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "2",
        money: "",
      },
      P2qyform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "6",
        money: "",
      },
      P2gnform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "10",
        money: "",
      },
      P2yzform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "14",
        money: "",
      },
      P2gjform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "18",
        money: "",
      },
      P3bdform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "3",
        money: "",
      },
      P3qyform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "7",
        money: "",
      },
      P3gnform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "11",
        money: "",
      },
      P3yzform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "15",
        money: "",
      },
      P3gjform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "19",
        money: "",
      },
      P4bdform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "4",
        money: "",
      },
      P4qyform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "8",
        money: "",
      },
      P4gnform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "12",
        money: "",
      },
      P4yzform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "16",
        money: "",
      },
      P4gjform: {
        uid: this.$store.getters.getUser.role.uid,
        meetingId: this.$route.query.meetingId,
        marketId: "20",
        money: "",
      },
      advform: {
        name: "",
        tableData: [
          {
            market: "P1",
          },
          {
            market: "P2",
          },
          {
            market: "P3",
          },
          {
            market: "P4",
          },
        ],
      },
    };
  },
  mounted() {
    this.loadMarket();
    this.FlagChange();
  },
  methods: {
    FlagChange() {
      if (this.$route.query.year === "1") {
        this.qyShowFlag = true;
        this.gnShowFlag = true;
        this.yzShowFlag = true;
        this.gjShowFlag = true;
      } else if (this.$route.query.year === "2") {
        this.gnShowFlag = true;
        this.yzShowFlag = true;
        this.gjShowFlag = true;
      } else if (this.$route.query.year === "3") {
        this.yzShowFlag = true;
        this.gjShowFlag = true;
      } else if (this.$route.query.year === "4") {
        this.gjShowFlag = true;
      }
    },
    addAdv() {
      this.advData.push(
        this.P1bdform,
        this.P2bdform,
        this.P3bdform,
        this.P4bdform,
        this.P1qyform,
        this.P2qyform,
        this.P3qyform,
        this.P4qyform,
        this.P1gnform,
        this.P2gnform,
        this.P3gnform,
        this.P4gnform,
        this.P1yzform,
        this.P2yzform,
        this.P3yzform,
        this.P4yzform,
        this.P1gjform,
        this.P2gjform,
        this.P3gjform,
        this.P4gjform
      );
      for (var i = 0; i < 20; i++) {
        if (this.advData[i].money != "") this.advDataF.push(this.advData[i]);
      }
      this.$confirm("确定提交吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then((resp) => {
          this.postRequest("/market/saveAdvertiseFee", this.advDataF).then(
            (resp) => {
              if (resp.data.msg == "成功") {
                this.qyShowFlag = true;
                this.gnShowFlag = true;
                this.yzShowFlag = true;
                this.gjShowFlag = true;
                this.bdShowFlag = true;
                this.tjShowFlag = false;
                this.$store.dispatch("asyncUpdateAdv", { advShowFlag: true });
                this.$router.replace({ path: "/orderall" });
                this.$message({
                  message: "投放成功",
                  type: "success",
                });
              } else {
                this.$message.error("投放失败");
              }
            }
          );
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消提交",
          });
        });

      // console.log(this.advDataF);
    },
    gotoOrderall() {
      this.$router.push({ path: "/orderall" });
    },
    loadMarket() {
      this.getRequest("/market/getMarketByYear?year=" + this.year).then(
        (resp) => {
          if (resp) {
            this.mktInfo = resp.data.data;
            // console.log(resp.data.data);
          }
        }
      );
    },
    onReset() {
      this.adv_form.groupName = "";
      this.adv_form.marketId = "";
      this.adv_form.money = "";
    },
    clearP1() {
      this.P1bdform = "";
      this.P1gjform = "";
      this.P1gnform = "";
      this.P1qyform = "";
      this.P1yzform = "";
    },
    clearP2() {
      this.P2bdform = "";
      this.P2gjform = "";
      this.P2gnform = "";
      this.P2qyform = "";
      this.P2yzform = "";
    },
    clearP3() {
      this.P3bdform = "";
      this.P3gjform = "";
      this.P3gnform = "";
      this.P3qyform = "";
      this.P3yzform = "";
    },
    clearP4() {
      this.P4bdform = "";
      this.P4gjform = "";
      this.P4gnform = "";
      this.P4qyform = "";
      this.P4yzform = "";
    },
  },
};
</script>
<style scoped>
.AdvView {
  display: block;
  border-radius: 15px;
  background-clip: padding-box;
  width: 80%;
  padding: 15px 35px;
  background-color: #fff;
  border: 1px solid #eaeaee;
  /* box-shadow: 0 0 25px #cac6; */
}
.cardArea {
  display: flex;
  justify-content: space-around;
}
.buttonArea {
  margin-top: 2%;
  text-align: right;
}
.topView {
  display: flex;
  justify-content: flex-start;
  font-size: 120%;
  margin-bottom: 1%;
}
</style>