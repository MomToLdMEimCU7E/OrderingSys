package com.example.demo.Vo;

import lombok.Data;

@Data
public class StuMeetingVo {
    private Integer meetingId;
    private String meetingName;
    private String time;
    private Integer teacherUid;
    private Integer groupId;
    private String status;
    private String isAd;

    public StuMeetingVo(Integer meetingId, String meetingName, String time, Integer teacherUid, Integer groupId, String status, String isAd) {
        this.meetingId = meetingId;
        this.meetingName = meetingName;
        this.time = time;
        this.teacherUid = teacherUid;
        this.groupId = groupId;
        this.status = status;
        this.isAd = isAd;
    }

    public Integer getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Integer meetingId) {
        this.meetingId = meetingId;
    }

    public String getMeetingName() {
        return meetingName;
    }

    public void setMeetingName(String meetingName) {
        this.meetingName = meetingName;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getTeacherUid() {
        return teacherUid;
    }

    public void setTeacherUid(Integer teacherUid) {
        this.teacherUid = teacherUid;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsAd() {
        return isAd;
    }

    public void setIsAd(String isAd) {
        this.isAd = isAd;
    }
}
