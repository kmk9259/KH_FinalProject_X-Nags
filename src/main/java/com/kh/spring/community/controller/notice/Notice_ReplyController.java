package com.kh.spring.community.controller.notice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.community.model.service.notice.Notice_ReplyService;
import com.kh.spring.community.model.vo.Notice_Reply;
@Controller
public class Notice_ReplyController {


	@Autowired 
	private Notice_ReplyService notice_ReplyService;
	
	
	@RequestMapping(value = "nrinsert.bo")
	@ResponseBody
	public String insertReply(Notice_Reply nr) {
		int result = notice_ReplyService.insertNoticeReply(nr);
		System.out.println(nr.getNoticeNo() + "bdn");
		return String.valueOf(result);
	}

	@RequestMapping(value = "nrlist.bo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectReplyList(int bno) {
		System.out.println(bno + "bno");
		ArrayList<Notice_Reply> list = notice_ReplyService.selectNoticeReplyList(bno);
		System.out.println(list + "리스트");
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create().toJson(list);
	}
	/*
	@RequestMapping(value = "rupdate.bo")
	@ResponseBody
	public String updateReply(Board_Reply br) {
		int result = board_ReplyService.updateReply(br);
		System.out.println(br.getBoardNo() + "bdn");
		return String.valueOf(result);
	}
	*/
}
