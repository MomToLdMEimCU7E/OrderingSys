package com.example.demo.service.Impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.demo.Vo.AdvertiseFeeVo;
import com.example.demo.common.Result;
import com.example.demo.entity.GroupClass;
import com.example.demo.entity.Meeting;
import com.example.demo.entity.UserMarket;
import com.example.demo.mapper.GroupClassMapper;
import com.example.demo.mapper.MarketMapper;
import com.example.demo.mapper.MeetingMapper;
import com.example.demo.mapper.UserMarketMapper;
import com.example.demo.service.IMarketService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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

    @Override
    public Result<?> getMarketByYear(String year) {
        return Result.success(marketMapper.getMarketByYear("%" + year + "%"));
    }

    @Override
    public Result<?> saveAdvertiseFee(List<AdvertiseFeeVo> advertiseFeeVoList) {
        advertiseFeeVoList.forEach(advertiseFeeVo -> {
            UserMarket userMarket = new UserMarket();
            userMarket.setMarketId(advertiseFeeVo.getMarketId());
            userMarket.setMeetingId(advertiseFeeVo.getMeetingId());
            userMarket.setUid(advertiseFeeVo.getUid());
            userMarket.setMoney(advertiseFeeVo.getMoney());
            userMarketMapper.insert(userMarket);
        });
        return Result.success();
    }

    @Override
    public Result<?> createMeeting(Integer teacherUid, Integer groupId, String meetingName) {
        Integer year;
        if(meetingMapper.getGroupMeetingYear(groupId) == null){
            year = 1;//若group没有进行过meeting，则设置为第一年
        }else {
            year = Integer.parseInt(meetingMapper.getGroupMeetingYear(groupId)) + 1;
        }//meeting的年份为group进行到的年份+1，因为到下一年了

        Meeting meeting = new Meeting();
        meeting.setTime(year.toString());
        meeting.setGroupId(groupId);
        meeting.setTeacherUid(teacherUid);
        meeting.setMeetingName(meetingName);
        meetingMapper.insert(meeting);

        GroupClass groupClass;
        groupClass = groupClassMapper.selectOne(Wrappers.<GroupClass>lambdaQuery().eq(GroupClass::getGroupId, groupId));
        groupClass.setYear(year.toString());//group中year也加1
        groupClassMapper.updateById(groupClass);
        return Result.success();
    }

}
