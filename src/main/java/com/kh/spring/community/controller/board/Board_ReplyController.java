package com.kh.spring.community.controller.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.community.model.service.board.Board_ReplyService;
import com.kh.spring.community.model.vo.Board_Reply;

@Controller
public class Board_ReplyController {

	@Autowired
	private Board_ReplyService board_ReplyService;

	@RequestMapping(value = "rinsert.bo")
	@ResponseBody
	public String insertReply(Board_Reply br) {
		int result = board_ReplyService.insertReply(br);
		return String.valueOf(result);
	}

	@RequestMapping(value = "rlist.bo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectReplyList(int bno) {
		ArrayList<Board_Reply> list = board_ReplyService.selectReplyList(bno);
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(list);
	}

	@RequestMapping(value = "updateReply.bo")
	@ResponseBody
	public String updateReply(Board_Reply br) {
		int result = board_ReplyService.updateReply(br);
		return String.valueOf(result);
	}

	@RequestMapping(value = "deleteReply.bo")
	@ResponseBody
	public String deleteReply(Board_Reply br) {
		int result = board_ReplyService.deleteReply(br);
		return String.valueOf(result);
	}
}
