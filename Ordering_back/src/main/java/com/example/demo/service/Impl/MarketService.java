package com.example.demo.service.Impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.demo.Vo.AdvertiseFeeVo;
import com.example.demo.Vo.MeetingListVo;
import com.example.demo.Vo.StuMeetingVo;
import com.example.demo.common.Result;
import com.example.demo.entity.GroupClass;
import com.example.demo.entity.Meeting;
import com.example.demo.entity.UserMarket;
import com.example.demo.mapper.*;
import com.example.demo.service.IMarketService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class MarketService implements IMarketService {
    @Resource
    MarketMapper marketMapper;
    @Resource
    UserMarketMapper userMarketMapper;
    @Resource
    MeetingMapper meetingMapper;
    @Resource
    GroupClassMapper groupClassMapper;
    @Resource
    UserMapper userMapper;

    @Override
    public Result<?> getMarketByYear(String year) {
        return Result.success(marketMapper.getMarketByYear("%" + year + "%"));
    }

    @Override
    public Result<?> saveAdvertiseFee(List<AdvertiseFeeVo> advertiseFeeVoList) {
        if (advertiseFeeVoList.isEmpty()){
            return Result.success();
        }else if (meetingMapper.getStatus(advertiseFeeVoList.get(0).getMeetingId()).equals("投放广告中")){
            advertiseFeeVoList.forEach(advertiseFeeVo -> {
                UserMarket userMarket = new UserMarket();
                userMarket.setMarketId(advertiseFeeVo.getMarketId());
                userMarket.setMeetingId(advertiseFeeVo.getMeetingId());
                userMarket.setUid(advertiseFeeVo.getUid());
                userMarket.setMoney(advertiseFeeVo.getMoney());
                userMarketMapper.insert(userMarket);
            });
            return Result.success();
        }else return Result.error("01","已结束广告投放");

    }

    @Override
    public Result<?> createMeeting(Integer teacherUid, Integer groupId) {
        Integer year;
        String groupName = groupClassMapper.getGroupName(groupId);
        if(meetingMapper.getGroupMeetingYear(groupId) == null){
            year = 1;//若group没有进行过meeting，则设置为第一年
        }else {
            year = Integer.parseInt(meetingMapper.getGroupMeetingYear(groupId)) + 1;
        }//meeting的年份为group进行到的年份+1，因为到下一年了

        Meeting meeting = new Meeting();
        meeting.setTime(year.toString());
        meeting.setGroupId(groupId);
        meeting.setTeacherUid(teacherUid);
        meeting.setMeetingName(groupName + "第" + year + "次订货会");
        meeting.setStatus("未开始");
        meetingMapper.insert(meeting);

        GroupClass groupClass;
        groupClass = groupClassMapper.selectOne(Wrappers.<GroupClass>lambdaQuery().eq(GroupClass::getGroupId, groupId));
        groupClass.setYear(year.toString());//group中year也加1
        groupClassMapper.updateById(groupClass);
        return Result.success();
    }

    @Override
    public Result<?> startMeeting(Integer meetingId) {
        return Result.success(meetingMapper.startMeeting(meetingId));
    }

    @Override
    public Result<?> startOrder(Integer meetingId, Integer teacherUid) {
        List<Meeting> meetingList = meetingMapper.getMeetingList(teacherUid);
        for (int i = 0; i < meetingList.size(); i++) {
            if (meetingId.equals(meetingList.get(i).getMeetingId())){
                return Result.success(meetingMapper.startOrder(meetingId));
            }
        }
        return Result.error("01","操作失败，非用户订货会");
    }


    @Override
    public Result<?> finishMeeting(Integer meetingId, Integer teacherUid) {
        List<Meeting> meetingList = meetingMapper.getMeetingList(teacherUid);
        for (int i = 0; i < meetingList.size(); i++) {
            if (meetingId.equals(meetingList.get(i).getMeetingId())){
                return Result.success(meetingMapper.finishMeeting(meetingId));
            }
        }
        return Result.error("01","操作失败，非用户订货会");
    }

    @Override
    public Result<?> getMeetingList(Integer teacherUid) {
        List<Meeting> meetingList = meetingMapper.getMeetingList(teacherUid);
        List<MeetingListVo> meetingListVoList = new ArrayList<>();
        for (int i = 0; i < meetingList.size(); i++) {
            meetingListVoList.add(new MeetingListVo(meetingList.get(i).getMeetingId(),meetingList.get(i).getMeetingName(),meetingList.get(i).getTime(),meetingList.get(i).getTeacherUid(),groupClassMapper.getGroupName(meetingList.get(i).getGroupId()),meetingList.get(i).getGroupId(),meetingList.get(i).getStatus()));
        }

        return Result.success(meetingListVoList);
    }

    @Override
    public Result<?> stuGetMeetingList(Integer uid) {
        List<Meeting> meetingList = meetingMapper.stuGetMeetingList(uid);
        List<StuMeetingVo> stuMeetingVoList = new ArrayList<>();
        for (int i = 0; i < meetingList.size(); i++) {
            List<UserMarket> fee = userMarketMapper.getUserMarketByUidAndMeetingId(uid, meetingList.get(i).getMeetingId());
            String isAd = "否";
            if (fee.size() > 0){
                isAd = "是";
            }

            stuMeetingVoList.add(new StuMeetingVo(meetingList.get(i).getMeetingId(), meetingList.get(i).getMeetingName(), meetingList.get(i).getTime(), meetingList.get(i).getTeacherUid(), meetingList.get(i).getGroupId(), meetingList.get(i).getStatus(), isAd));
        }


        return Result.success(stuMeetingVoList);
    }

    @Override
    public Result<?> getMeetingDetail(Integer meetingId) {
        Integer groupId = meetingMapper.getGroupId(meetingId);

        return Result.success(userMapper.getUserInfo(groupId));
    }

    @Override
    public Result<?> getUserMarket(Integer uid, Integer meetingId) {
        return Result.success(userMarketMapper.getUserMarketByUidAndMeetingId(uid, meetingId));
    }

}
