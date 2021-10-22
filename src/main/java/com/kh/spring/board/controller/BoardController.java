package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.Reply;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		/* 1. @RequestParam(value="currentPage") int currentPage --> 값이 넘어오지 않을 때 에러 (값을 주입할 수 없어서)
		 * 
		 * 2. @RequestParam(value="currentPage", required=false) int currentPage
		 * -->required : 해당하는 파라미터가 값이 꼭 필수인가 아닌가를 정할 수 있음 (true =필수)
		 * 따라서 required = false로 지정하여 값을 받아줄 필요가 없다고 선언 --> null이 들어올수있음
		 * --> null은 기본형 int에 들어갈 수 없기 때문에 에러가 발생
		 * 
		 * 3. @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
		 * --> defaultValue : 넘어오는 값이 null일 경우 해당 파라미터의 기본 값을 지정할 수 있다.
		 * */
		int listCount = boardService.selectListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10,5);
		ArrayList<Board> list = boardService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "board/boardListView";
	}
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, HttpServletRequest request, Model model,
								@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		System.out.println(b);
		System.out.println(file.getOriginalFilename());
		
		if(!file.getOriginalFilename() .equals("")) {	//전달되는 파일이 있으면
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				b.setOriginName(file.getOriginalFilename());
				b.setChangeName(changeName);
			}
		}
		boardService.insertBoard(b);
		return "redirect:list.bo";
	}
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		System.out.println("savePath : "+savePath);
		
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext= originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+ext;
		
		try {
			file.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("File Upload Error");
		}
		return changeName;
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		Board b = boardService.selectBoard(bno);
		
		mv.addObject("b", b).setViewName("board/boardDetailView");
		
		return mv;
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, String fileName, HttpServletRequest request) {
		boardService.deleteBoard(bno);
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		return "redirect:list.bo";
	}
	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\upload_files\\";
		System.out.println("savePath : "+savePath);
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();
		
	}
	@RequestMapping("updateForm.bo")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		mv.addObject("b",boardService.selectBoard(bno))
			.setViewName("board/boardUpdateForm");
		return mv;
	}
	
	@RequestMapping("update.bo")
	public ModelAndView updateBoard(Board b, ModelAndView mv, HttpServletRequest request,
										@RequestParam(name="reUploadFile", required=false) MultipartFile file) {
		/*
		 * 1. 기존의 첨부파일 X, 새로 첨부된 파일 X 	
		 * 	  --> originName : null, changeName : null
		 * 
		 * 2. 기존의 첨부파일 X, 새로 첨부된 파일 O		
		 * 	  --> 서버에 업로드 후 
		 * 	  --> originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
		 * 
		 * 3. 기존의 첨부파일 O, 새로 첨부된 파일 X		
		 * 	  --> originName : 기존첨부파일원본명, changeName : 기존첨부파일수정명
		 * 
		 * 4. 기존의 첨부파일 O, 새로 첨부된 파일 O  
		 * 	  --> 서버에 업로드 후	
		 * 	  --> originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
		 */
		
		if(!file.getOriginalFilename().equals("")) { 	//새로운 첨부 파일 
			if(b.getChangeName() != null) {				//기존에 있었으면 
				deleteFile(b.getChangeName(), request);	//삭제
			}
			String changeName = saveFile(file, request);
			b.setOriginName(file.getOriginalFilename());
			b.setChangeName(changeName);
		}
		boardService.updateBoard(b);
		mv.addObject("bno",b.getBoardNo()).setViewName("redirect:detail.bo");
		
		return mv;
	}
	
	/* @ResponseBody : 서버에서 클라이언트로 응답 데이터를 전송하기 위해서 @ResponseBody를 사용하여
	 *  				자바 객체를 HTTP 응답 본문의 객체로 변환하여 클라이언트로 전송 하는 역할
	 * 
	 * @RequestBody : 클라이언트에서 서버로 JSON 데이터 전송 시 , 서버에서는 @RequestBody를 사용하여
	 * 					HTTP 요청 본문에 담긴 값들을 자바 객체로 변환시켜 객체에 저장
	 */
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces = "application/json; charset=utf-8")
	public String selectReplyList(int bno) {
		ArrayList<Reply> list = boardService.selectReplyList(bno);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.bo")
	public String insertReply(Reply r) {
		int result = boardService.insertReply(r);
		
		return String.valueOf(result) ;
	}
	
	@ResponseBody
	@RequestMapping(value="topList.bo")
	public ArrayList<Board> selectTopList () {
		ArrayList<Board> list = boardService.selectTopList();
		return list;
	}

}
