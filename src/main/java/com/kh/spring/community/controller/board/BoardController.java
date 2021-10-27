package com.kh.spring.community.controller.board;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.service.board.BoardService;
import com.kh.spring.community.model.vo.Board;
import com.kh.spring.community.model.vo.Board_Attachment;
import com.kh.spring.community.model.vo.PageInfo;


@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	//@Autowired
	//private Board_Attachment boardAttachment;
	
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = boardService.selectListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		//, boardAttachment.getOriginFile(),boardAttachment.getChangeFile()
		ArrayList<Board> list = boardService.selectList(pi);

		System.out.println(list + " 리스트");
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
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {
	//	System.out.println(b);
	//	System.out.println(file.getOriginalFilename());
		/*
		if (!file.getOriginalFilename().equals("")) { // 전달되는 파일이 있으면
			String changeName = saveFile(file, request);

			if (changeName != null) {
				b.setOriginName(file.getOriginalFilename());
				b.setChangeName(changeName);
			}
		}
		*/
		boardService.insertBoard(b);
		return "redirect:list.bo";
	}


	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));
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
		if (!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		return "redirect:list.bo";
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		System.out.println("savePath : " + savePath);

		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();

	}

	@RequestMapping("updateForm.bo")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		mv.addObject("b", boardService.selectBoard(bno)).setViewName("board/boardUpdateForm");
		return mv;
	}

	@RequestMapping("update.bo")
	public ModelAndView updateBoard(Board_Attachment ba, ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "reUploadFile", required = false) MultipartFile file) {
/*
		if (!file.getOriginalFilename().equals("")) {
			if (ba.getChangeName() != null) {
				deleteFile(b.getChangeName(), request);
			}
			String changeName = saveFile(file, request);
			b.setOriginName(file.getOriginalFilename());
			b.setChangeName(changeName);
		}
	
	 */
		if (!file.getOriginalFilename().equals("")) {
			if (ba.getChangeFile() != null) {
				deleteFile(ba.getChangeFile(), request);
			}
			String changeName = saveFile(file, request);
			ba.setOriginFile(file.getOriginalFilename());
			ba.setChangeFile(changeName);
		}
		boardService.updateBoard(ba);
		mv.addObject("bno", ba.getBoardNo()).setViewName("redirect:detail.bo");

		return mv;
	}

	/*
	 * @ResponseBody : 서버에서 클라이언트로 응답 데이터를 전송하기 위해서 @ResponseBody를 사용하여 자바 객체를 HTTP
	 * 응답 본문의 객체로 변환하여 클라이언트로 전송 하는 역할
	 * 
	 * @RequestBody : 클라이언트에서 서버로 JSON 데이터 전송 시 , 서버에서는 @RequestBody를 사용하여 HTTP 요청
	 * 본문에 담긴 값들을 자바 객체로 변환시켜 객체에 저장
	 */

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="rlist.bo", produces =
	 * "application/json; charset=utf-8") public String selectReplyList(int bno) {
	 * ArrayList<Reply> list = boardService.selectReplyList(bno);
	 * 
	 * return new
	 * GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
	 * }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="rinsert.bo") public String insertReply(Reply r) { int
	 * result = boardService.insertReply(r);
	 * 
	 * return String.valueOf(result) ; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="topList.bo") public ArrayList<Board> selectTopList ()
	 * { ArrayList<Board> list = boardService.selectTopList(); return list; }
	 */
}