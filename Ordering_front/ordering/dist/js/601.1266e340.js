"use strict";(self["webpackChunkordering"]=self["webpackChunkordering"]||[]).push([[601],{9601:function(t,e,a){a.r(e),a.d(e,{default:function(){return n}});var s=function(){var t=this,e=t._self._c;return e("div",[e("el-dialog",{attrs:{title:"广告投放管理",visible:t.visible,"close-on-click-modal":!1,"append-to-body":!0,width:"30%"},on:{"update:visible":function(e){t.visible=e},close:t.AdvmgtDialogClose}},[e("div",{staticClass:"bg_div"},[e("el-table",{staticStyle:{width:"100%"},attrs:{data:t.groupData,height:"250"}},[e("el-table-column",{attrs:{prop:"username",label:"公司名称",width:"150"}}),e("el-table-column",{attrs:{label:"是否提交"},scopedSlots:t._u([{key:"default",fn:function(a){return["是"===a.row.status?e("el-tag",{attrs:{type:"success"}},[t._v("是")]):"否"===a.row.status?e("el-tag",{attrs:{type:"danger"}},[t._v("否")]):t._e()]}}])}),e("el-table-column",{scopedSlots:t._u([{key:"default",fn:function(a){return[e("el-popover",{attrs:{placement:"right",width:"300",trigger:"click"}},[e("el-table",{attrs:{data:t.userFeeData}},[e("el-table-column",{attrs:{width:"100",property:"market",label:"市场"}}),e("el-table-column",{attrs:{width:"150",property:"money",label:"已投入广告费"}})],1),e("el-button",{attrs:{slot:"reference",size:"mini"},on:{click:function(e){return t.showMoney(a.row)}},slot:"reference"},[t._v("点击查看广告费")])],1)]}}])})],1)],1),e("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[e("el-button",{on:{click:t.AdvmgtDialogClose}},[t._v("关 闭")]),e("el-button",{attrs:{type:"success"},on:{click:function(e){return t.loadStatus()}}},[t._v("刷新状态")]),!1===t.endAdvFlag?e("el-button",{attrs:{type:"primary"},on:{click:t.endAdv}},[t._v("结束广告投放")]):t._e()],1)])],1)},i=[],l={name:"AdvmgtDialog",props:{AdvmgtDialogFlag:{default:!1},meetingId:{type:String},meetingStatus:{type:String},lock:{default:0}},data(){return{clock:0,visible:!1,CmeetingId:"",endAdvFlag:!0,teacherUid:this.$store.getters.getUser.role.uid,groupData:[],userFeeData:[]}},methods:{AdvmgtDialogClose(){this.$emit("update:AdvmgtDialogFlag",!1)},loadStatus(){this.getRequest("/user/advertiseStatus?meetingId="+this.CmeetingId).then((t=>{t&&(this.groupData=t.data.data)}))},endAdv(){this.putRequest("/market/startOrder?meetingId="+this.CmeetingId+"&teacherUid="+this.teacherUid).then((t=>{"成功"==t.data.msg?(this.endAdvFlag=!0,this.$emit("update:AdvmgtDialogFlag",!1),this.postRequest("/order/generateSequence?meetingId="+this.CmeetingId),this.$parent.loadMeeting(),this.$message({message:"成功结束",type:"success"})):(this.loading=!1,this.$message.error("结束失败"))}))},showMoney(t){this.getRequest("/user/getUserFee?uid="+t.uid+"&meetingId="+this.CmeetingId).then((t=>{t&&(this.userFeeData=t.data.data)}))}},watch:{AdvmgtDialogFlag(t){!0===t?(this.visible=this.AdvmgtDialogFlag,this.CmeetingId=this.meetingId,this.endAdvFlag=!0,"投放广告中"===this.meetingStatus&&(this.endAdvFlag=!1),this.loadStatus()):this.visible=this.AdvmgtDialogFlag}}},r=l,o=a(1001),d=(0,o.Z)(r,s,i,!1,null,"6d97939d",null),n=d.exports}}]);
//# sourceMappingURL=601.1266e340.js.map