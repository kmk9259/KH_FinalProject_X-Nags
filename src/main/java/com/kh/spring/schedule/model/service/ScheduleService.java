package com.kh.spring.schedule.model.service;

import com.kh.spring.schedule.model.vo.Schedule;

public interface ScheduleService {

	int insertSchedule(Schedule sc);

	int updateSchedule(Schedule sc);

	int deleteSchedule(Schedule sc);

}
