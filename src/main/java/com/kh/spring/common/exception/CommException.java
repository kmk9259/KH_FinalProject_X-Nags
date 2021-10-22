package com.kh.spring.common.exception;
//spring에서는 RuntimeException 으로 처리, uncheckedException
public class CommException extends RuntimeException {
	public CommException() {}
	public CommException(String msg) {
		super(msg);
	}
}
