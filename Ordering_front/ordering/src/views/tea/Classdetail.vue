<template>
  <div>
    <div class="topView">
      <el-tag style="margin-right: 1%" effect="dark"
        >当前班级:
        {{ yearOfTerm + "学年" + "第" + term + "学期" + week + "班" }}</el-tag
      >
      <el-button size="mini" type="info" @click="gotoClassmgt"
        >返回管理界面</el-button
      >
      <el-button
        type="success"
        icon="el-icon-plus"
        @click="newGroupDialogVisible = true"
        size="mini"
        >新增企业</el-button
      >
    </div>
    <el-dialog
      title="添加企业"
      width="23%"
      :visible.sync="newGroupDialogVisible"
    >
      <div class="newClass">
        <el-form ref="newClassData" :model="newGroupData">
          <el-form-item label="企业名称">
            <el-input
              v-model="newGroupData.username"
              style="width: 75%"
            ></el-input>
          </el-form-item>
          <div style="margin-left: 52%">
            <span slot="footer">
              <el-button @click="newGroupDialogVisible = false" size="mini"
                >取消</el-button
              >
              <el-button type="primary" size="mini" @click="addGroup"
                >确认添加</el-button
              >
            </span>
          </div>
        </el-form>
      </div>
    </el-dialog>
    <div class="bg_div">
      <el-table
        :data="groupData"
        style="width: 50%"
        :header-cell-style="tableHeaderColor"
      >
        <el-table-column prop="username" label="企业名称" width="200">
        </el-table-column>
        <el-table-column prop="password" label="密码" width="200">
          <template slot-scope="scope">
            <el-row>
              <el-col :span="10">
                <span :v-bind="pwdHideList[scope.$index]">{{
                  pwdHideList[scope.$index]
                }}</span>
              </el-col>
              <el-col :span="2" :offset="3">
                <i
                  :class="pwdIconList[scope.$index]"
                  :style="pwdStyleList[scope.$index]"
                  @click="seePassword(scope.$index, scope.row)"
                />
              </el-col>
            </el-row>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="300">
          <template slot-scope="scope">
            <el-button type="text" @click="openUpdateGroupDialog(scope.row)">
              更改信息
            </el-button>
            <el-button type="text" @click="deleteGroup(scope.row)">
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <el-dialog
      title="修改企业信息"
      width="23%"
      :visible.sync="updateGroupDialogVisible"
    >
      <div class="newClass">
        <el-form ref="updateGroupData" :model="updateGroupData">
          <el-form-item label="名称">
            <el-input
              v-model="updateGroupData.username"
              style="width: 75%"
            ></el-input>
          </el-form-item>
          <el-form-item label="密码">
            <el-input
              v-model="updateGroupData.password"
              style="width: 75%"
            ></el-input>
          </el-form-item>
          <div style="margin-left: 52%">
            <span slot="footer">
              <el-button @click="updateGroupDialogVisible = false" size="mini"
                >取 消</el-button
              >
              <el-button type="primary" size="mini" @click="updateGroup"
                >确认修改</el-button
              >
            </span>
          </div>
        </el-form>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      updateGroupDialogVisible: false,
      newGroupDialogVisible: false,
      week: this.$route.query.week,
      yearOfTerm: this.$route.query.yearOfTerm,
      term: this.$route.query.term,
      newGroupData: {
        username: "",
      },
      updateGroupData: {
        uid: "",
        username: "",
        password: "",
        role: "",
        groupId: "",
      },
      groupData: [],
      pwdHideList: ["*****", "*****", "*****", "*****", "*****", "*****"],
      // pwdIcon:'el-icon-watermelon',
      pwdIconList: [
        "el-icon-watermelon",
        "el-icon-watermelon",
        "el-icon-watermelon",
        "el-icon-watermelon",
        "el-icon-watermelon",
        "el-icon-watermelon",
      ],
      // pwdStyle:'transform:rotate(-45deg)',
      pwdStyleList: [
        "transform:rotate(-45deg)",
        "transform:rotate(-45deg)",
        "transform:rotate(-45deg)",
        "transform:rotate(-45deg)",
        "transform:rotate(-45deg)",
        "transform:rotate(-45deg)",
      ],
    };
  },
  mounted() {
    this.loadGroup();
  },
  methods: {
    loadGroup() {
      this.getRequest(
        "/user/getClassDetail?groupId=" + this.$route.query.groupId
      ).then((resp) => {
        if (resp) {
          this.groupData = resp.data.data;
        }
      });
    },
    gotoClassmgt() {
      this.$router.push({ path: "/classmgt" });
    },
    tableHeaderColor({ row, column, rowIndex, columnIndex }) {
      if (rowIndex === 0) {
        return "background-color: #fff;color:black;font-size:15px;font-weight: 900;";
      }
    },
    seePassword(index, row) {
      //如果是闭眼图标，点击按键后将密码转换成实际数据，图标转换成睁眼图标
      if (this.pwdIconList[index] === "el-icon-watermelon") {
        console.log(index + row);
        // this.pwdHideList[index] = row.password;
        this.$set(this.pwdHideList, index, row.password);
        this.pwdIconList[index] = "el-icon-view";
        this.pwdStyleList[index] = "transform:rotate(0deg)";
        // alert(index + ":seePassword:" + this.pwdHideList[index] + this.pwdIconList[index]);
      } else {
        //如果是睁眼图标，点击按键后将密码转换成加密数据，图标转换成闭眼图标
        // this.pwdHideList[index] = "*****";
        this.$set(this.pwdHideList, index, "*****");
        this.pwdIconList[index] = "el-icon-watermelon";
        this.pwdStyleList[index] = "transform:rotate(-45deg)";
        // alert(index + ":HidePassword:" + this.pwdHideList[index]);
      }
    },
    addGroup() {
      this.postRequest(
        "/user/register?username=" +
          this.newGroupData.username +
          "&groupId=" +
          this.$route.query.groupId
      ).then((resp) => {
        if (resp.data.msg === "成功") {
          this.loadGroup();
          this.newGroupData.username = '';
          this.$message({
            message: "添加成功",
            type: "success",
          });
          this.newGroupDialogVisible = false;
        } else {
          this.$message({
            message: "添加失败",
            type: "error",
          });
        }
      });
    },
    deleteGroup(data) {
      this.$confirm("此操作将永久删除该企业, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then((resp) => {
          this.deleteRequest("/user/deleteUser?uid=" + data.uid).then(
            (resp) => {
              if (resp.data.msg === "成功") {
                this.loadGroup();
                this.$message({
                  message: "删除成功",
                  type: "success",
                });
                this.newGroupDialogVisible = false;
              } else {
                this.$message({
                  message: "删除失败",
                  type: "error",
                });
              }
            }
          );
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
    openUpdateGroupDialog(data) {
      this.updateGroupDialogVisible = true;
      this.updateGroupData.username = data.username;
      this.updateGroupData.password = data.password;
      this.updateGroupData.uid = data.uid;
      this.updateGroupData.role = data.role;
      this.updateGroupData.groupId = this.$route.query.groupId;
    },
    updateGroup() {
      this.putRequest("/user/updateUser", this.updateGroupData).then((resp) => {
        if (resp.data.msg === "成功") {
          this.loadGroup();
          this.$message({
            message: "修改成功",
            type: "success",
          });
          this.updateGroupDialogVisible = false;
        } else {
          this.$message({
            message: "修改失败",
            type: "error",
          });
        }
      });
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
.bg_div {
  display: flex;
  flex-direction: column;
  /* background-color: white; */
  padding: 1%;
}
</style>