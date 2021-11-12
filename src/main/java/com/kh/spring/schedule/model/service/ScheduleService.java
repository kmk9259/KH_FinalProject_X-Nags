package com.kh.spring.schedule.model.service;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.schedule.model.vo.Schedule;

public interface ScheduleService {

	int insertSchedule(Schedule sc);

	Employee selectEmployee(Member mem);

//	int updateSchedule(Schedule sc);
//
//	int deleteSchedule(Schedule sc);

}
