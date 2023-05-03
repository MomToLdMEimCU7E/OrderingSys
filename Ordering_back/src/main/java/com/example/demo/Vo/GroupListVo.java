package com.example.demo.Vo;

import lombok.Data;

@Data
public class GroupListVo {
    private Integer groupId;
    private Integer teacherUid;
    private String yearOfTerm;
    private String term;
    private String week;
    private String year;
    private Integer lastMeetingId;

    public GroupListVo(Integer groupId, Integer teacherUid, String yearOfTerm, String term, String week, String year, Integer lastMeetingId) {
        this.groupId = groupId;
        this.teacherUid = teacherUid;
        this.yearOfTerm = yearOfTerm;
        this.term = term;
        this.week = week;
        this.year = year;
        this.lastMeetingId = lastMeetingId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getTeacherUid() {
        return teacherUid;
    }

    public void setTeacherUid(Integer teacherUid) {
        this.teacherUid = teacherUid;
    }

    public String getYearOfTerm() {
        return yearOfTerm;
    }

    public void setYearOfTerm(String yearOfTerm) {
        this.yearOfTerm = yearOfTerm;
    }

    public String getTerm() {
        return term;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Integer getLastMeetingId() {
        return lastMeetingId;
    }

    public void setLastMeetingId(Integer lastMeetingId) {
        this.lastMeetingId = lastMeetingId;
    }
}
