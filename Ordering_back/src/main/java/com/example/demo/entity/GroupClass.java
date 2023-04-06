package com.example.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class GroupClass {
    @TableId(type = IdType.AUTO)
    private Integer groupId;
    private Integer teacherUid;
    private String groupName;
    private String year;
    private Integer lastMeetingId;


    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Integer getLastMeetingId() {
        return lastMeetingId;
    }

    public void setLastMeetingId(Integer lastMeetingId) {
        this.lastMeetingId = lastMeetingId;
    }

    public Integer getTeacherUid() {
        return teacherUid;
    }

    public void setTeacherUid(Integer teacherUid) {
        this.teacherUid = teacherUid;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
}
