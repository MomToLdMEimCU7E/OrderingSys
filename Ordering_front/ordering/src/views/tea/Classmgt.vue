<template>
  <div class="pm_div">
    <div>
      <div class="an_div">
        <el-button
          type="success"
          icon="el-icon-plus"
          @click="newClassDialogVisible = true"
          size="mini"
          >新增班级</el-button
        >
      </div>
    </div>
    <el-dialog
      title="添加班级"
      width="23%"
      :visible.sync="newClassDialogVisible"
    >
      <div class="newClass">
        <el-form ref="newClassData" :model="newClassData">
          <el-form-item label="班级">
            <el-input
              v-model="newClassData.week"
              style="width: 75%"
              placeholder="如：周三345"
            ></el-input>
          </el-form-item>
          <el-form-item label="年度" label-position="left">
            <el-input
              v-model="newClassData.yearOfTerm"
              style="width: 75%"
              placeholder="如：2023"
            ></el-input>
          </el-form-item>
          <el-form-item label="学期" label-position="left">
            <el-select
              v-model="newClassData.term"
              placeholder="请选择学期"
              style="width: 75%"
            >
              <el-option
                v-for="term in termOption"
                :key="term.value"
                :label="term.label"
                :value="term.value"
              >
              </el-option>
            </el-select>
          </el-form-item>
          <div style="margin-left: 45%">
            <span slot="footer">
              <el-button @click="newClassDialogVisible = false" size="mini"
                >取消</el-button
              >
              <el-button type="primary" size="mini" @click="addClass"
                >确认添加</el-button
              >
            </span>
          </div>
        </el-form>
      </div>
    </el-dialog>
    <div class="bg_div">
      <el-table
        :data="classData"
        v-loading="loading"
        style="width: 100%"
        :header-cell-style="tableHeaderColor"
      >
        <el-table-column prop="week" label="班级"> </el-table-column>
        <el-table-column prop="yearOfTerm" label="学年"> </el-table-column>
        <el-table-column prop="term" label="学期"> </el-table-column>
        <el-table-column prop="year" label="当前订货年度" width="120">
        </el-table-column>
        <el-table-column label="操作" width="300">
          <template slot-scope="scope">
            <el-button type="text" @click="gotoClassDetail(scope.row)">
                班级管理
            </el-button>
            <el-button type="text" @click="deleteClass(scope.row)">
                删除班级
            </el-button>
            <!-- <el-button type="text" @click="openClassDialog(scope.row)">
              查看企业
            </el-button>
            <el-button type="text"> 更改 </el-button>
            <el-button type="text"> 删除班级 </el-button> -->
          </template>
        </el-table-column>
      </el-table>
    </div>
    <el-dialog title="企业一览" :visible.sync="ClassDialogFlag" width="20%">
      <el-table :data="groupData" style="width: 100%" border stripe>
        <el-table-column prop="username" label="企业名称">
             <!-- <template slot-scope="scope">
          <span v-if="scope.row.role == '学生'">{{scope.row.username}}</span>
        </template> -->
        </el-table-column>

      </el-table>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="ClassDialogFlag = false"
          >关 闭</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      teacherUid: this.$store.getters.getUser.role.uid,
      loading: false,
      newClassDialogVisible: false,
      ClassDialogFlag: false,
      newClassData: {
        teacherUid: "",
        yearOfTerm: "",
        term: "",
        week: "",
      },
      classData: [],
      groupData: [],
      termOption: [
        {
          value: "1",
          label: "第一学期",
        },
        {
          value: "2",
          label: "第二学期",
        },
      ],
    };
  },
  mounted() {
    this.loadClass();
  },

  methods: {
    loadClass() {
      this.loading = true;
      this.getRequest(
        "/user/getTeacherGroups?teacherUid=" + this.teacherUid
      ).then((resp) => {
        if (resp) {
          this.loading = false;
          this.classData = resp.data.data;
        }
      });
    },
    addClass() {
      this.postRequest(
        "/user/createGroup?teacherUid=" +
          this.teacherUid +
          "&yearOfTerm=" +
          this.newClassData.yearOfTerm +
          "&term=" +
          this.newClassData.term +
          "&week=" +
          this.newClassData.week
      ).then((resp) => {
        if (resp.data.msg === "成功") {
          this.loading = true;
          this.loadClass();
          this.newClassData = {brand_right:0};
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
      this.newClassDialogVisible = false;
    },
    openClassDialog(data) {
      this.ClassDialogFlag = true;
      this.getRequest("/user/getClassDetail?groupId=" + data.groupId).then(
        (resp) => {
          if (resp) {
            this.groupData = resp.data.data;
          }
        }
      );
    },
    gotoClassDetail(data){
      this.$router.push({
        path: "/classdetail",
        query: {
          groupId: data.groupId,
          week: data.week,
          yearOfTerm: data.yearOfTerm,
          term: data.term
        },
      });
    },
    deleteClass(data) {
      this.$confirm("此操作将永久删除该班级, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then((resp) => {
          this.deleteRequest("/user/deleteClass?groupId=" + data.groupId + '&uid=' + this.teacherUid).then(
            (resp) => {
              if (resp.data.msg === "成功") {
                this.loadClass();
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
  width: 800px;
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
.newClass {
  margin: 0 auto;
}
</style>