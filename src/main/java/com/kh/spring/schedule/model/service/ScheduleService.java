package com.kh.spring.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.spring.schedule.model.vo.ConvertScheduleVo;
import com.kh.spring.schedule.model.vo.Schedule;

public interface ScheduleService {

	int insertSchedule(Schedule sc);

	ArrayList<Schedule> scheduleMain(Map<String,String> paramMap);

//	Employee selectEmployee(Member mem);

//	int updateSchedule(Schedule sc);
//
//	int deleteSchedule(Schedule sc);

}
