package com.kh.spring.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;


import com.kh.spring.schedule.model.vo.Schedule;

public interface ScheduleService {

	int insertSchedule(Schedule sc);
	
	int updateSchedule(Schedule sc);

	int deleteSchedule(Schedule sc);

	ArrayList<Schedule> scheduleMain(Map<String,String> paramMap);

	ArrayList<Schedule> scheduleList(String empId);

	int resizeUpdateSchedule(Schedule sc);

	int dropUpdateSchedule(Schedule sc);




}
