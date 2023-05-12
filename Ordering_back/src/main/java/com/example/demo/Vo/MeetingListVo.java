package com.example.demo.Vo;

import lombok.Data;

@Data
public class MeetingListVo {
    private Integer meetingId;
    private String meetingName;
    private String time;
    private Integer teacherUid;
    private String groupName;
    private Integer groupId;
    private String status;

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public MeetingListVo(Integer meetingId, String meetingName, String time, Integer teacherUid, String groupName, Integer groupId, String status) {
        this.meetingId = meetingId;
        this.meetingName = meetingName;
        this.time = time;
        this.teacherUid = teacherUid;
        this.groupName = groupName;
        this.groupId = groupId;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMeetingName() {
        return meetingName;
    }

    public void setMeetingName(String meetingName) {
        this.meetingName = meetingName;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Integer getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Integer meetingId) {
        this.meetingId = meetingId;
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
}
