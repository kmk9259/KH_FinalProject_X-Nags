package com.kh.spring.attendance.model.service;

import java.util.ArrayList;

import com.kh.spring.attendance.model.vo.AttStatus;

public interface AttendanceService {

	ArrayList<AttStatus> selectAttStatus();

}
