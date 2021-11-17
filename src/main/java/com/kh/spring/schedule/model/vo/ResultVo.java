package com.kh.spring.schedule.model.vo;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResultVo {
	private Object data;
	private HttpStatus status;
	private String reason;
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public HttpStatus getStatus() {
		return status;
	}
	public void setStatus(HttpStatus status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public ResponseEntity<ResultVo> build() {
		return new ResponseEntity<ResultVo>(this, status);
	}

	
}
