package com.team.project.board;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.project.TokenMaker;
import com.team.project.banner.BannerDAO;
import com.team.project.member.Member;
import com.team.project.member.MemberDAO;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO bDAO;

	@Autowired
	private MemberDAO mDAO;

	@Autowired
	private BannerDAO baDAO;

	// BOARD버튼 클릭시 요청 페이지
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String goBoard(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		bDAO.countAllBoard();
		bDAO.searchClear(req);
		bDAO.getBoardMsg(1, req);
		TokenMaker.makeToken(req);
//			req.getSession().setAttribute("cp", "\"board/board.jsp\"");
//			String cp = (String) req.getSession().getAttribute("cp");
		req.setAttribute("cp", "board/board.jsp");
		req.getSession().setAttribute("currentPage", "board");
		return "index";

	}

	// NOTICE버튼 클릭시 공지글페이지
	@RequestMapping(value = "/notice.go", method = RequestMethod.GET)
	public String goNotice(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		bDAO.countAllBoard();
		bDAO.searchClear(req);
		bDAO.getNoticeMsg(1, req);
		TokenMaker.makeToken(req);
//			req.getSession().setAttribute("cp", "\"board/board.jsp\"");
//			String cp = (String) req.getSession().getAttribute("cp");
		req.setAttribute("cp", "board/noticeBoard.jsp");
		req.getSession().setAttribute("currentPage", "notice");
		return "index";

	}

	// 하단 페이지 번호 눌렀을 때 해당 페이지로 이동하는 method
	@RequestMapping(value = "/board.page", method = RequestMethod.GET)
	public String goBoardPage(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		bDAO.countAllBoard();
		int p = Integer.parseInt(req.getParameter("p"));
		bDAO.getBoardMsg(p, req);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "board/board.jsp");
		return "index";

	}

	// 하단 페이지 번호 눌렀을 때 해당 공지글페이지로 이동하는 method
	@RequestMapping(value = "/notice.page", method = RequestMethod.GET)
	public String goNoticePage(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		bDAO.countAllBoard();
		int p = Integer.parseInt(req.getParameter("p"));
		bDAO.getNoticeMsg(p, req);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "board/noticeBoard.jsp");
		return "index";

	}

	// 게시글 클릭시 해당 게시글 전체 내용 있는 페이지로 이동하는 method
	@RequestMapping(value = "/board.view", method = RequestMethod.GET)
	public String boardViewPage(HttpServletRequest req, Reply r) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		int tp_b_no = Integer.parseInt(req.getParameter("tp_b_no"));
		bDAO.viewBoard(tp_b_no, req);
		bDAO.getReply(req);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "board/boardView.jsp");
		req.getSession().setAttribute("currentPage", "viewBoard");
		return "index";
	}

	// 입력한 검색어 적용해서 페이지 불러오는 method
	@RequestMapping(value = "/board.search", method = RequestMethod.GET)
	public String searchBoard(HttpServletRequest req) {
		mDAO.loginCheck(req);
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		bDAO.searchBoard(req);
		bDAO.getBoardMsg(1, req);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "board/board.jsp");
		return "index";
	}

	// 글쓰기 버튼 눌렀을 때 글쓰기 페이지로 이동하는 method
	@RequestMapping(value = "/board.write.go", method = RequestMethod.GET)
	public String boardWritePage(HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		if (mDAO.loginCheck(req)) {
			TokenMaker.makeToken(req);
			req.setAttribute("cp", "board/boardWrite.jsp");
		} else {
			bDAO.searchClear(req);
			bDAO.getBoardMsg(1, req);
			req.setAttribute("cp", "board/board.jsp");
		}
		return "index";
	}

	// 작성 버튼 눌렀을 때 board로 돌아가는 method
	@RequestMapping(value = "/board.write", method = RequestMethod.POST)
	public String writeSave(Board b, HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		mDAO.loginCheck(req);
		bDAO.writeBoard(b, req);
		bDAO.searchClear(req);
		bDAO.getBoardMsg(1, req);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "board/board.jsp");
		return "index";
	}

	// 삭제 버튼 눌렀을 때 게시글 삭제 후 board로 돌아가는 method
	@RequestMapping(value = "/board.delete", method = RequestMethod.POST)
	public String boardDelete(HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		if (mDAO.loginCheck(req)) {
			int tp_b_no = Integer.parseInt(req.getParameter("tp_b_no"));
			bDAO.deleteBoard(tp_b_no, req);
			bDAO.getBoardMsg(1, req);
			TokenMaker.makeToken(req);
			req.setAttribute("cp", "board/board.jsp");
		} else {
			bDAO.searchClear(req);
			bDAO.getBoardMsg(1, req);
			req.setAttribute("cp", "board/board.jsp");
		}
		return "index";
	}

	// 수정 버튼 눌렀을 때 boardUpdate.jsp로 이동
	@RequestMapping(value = "/board.update.go", method = RequestMethod.POST)
	public String boardUpdateGo(HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		if (mDAO.loginCheck(req)) {
			int tp_b_no = Integer.parseInt(req.getParameter("tp_b_no"));
			bDAO.viewBoard(tp_b_no, req);
			TokenMaker.makeToken(req);
			req.setAttribute("cp", "board/boardUpdate.jsp");
		} else {
			bDAO.searchClear(req);
			bDAO.getBoardMsg(1, req);
			req.setAttribute("cp", "board/board.jsp");
		}
		return "index";
	}

	// 내용 입력 후 수정하면 해당 board로 다시 돌아오는 method
	@RequestMapping(value = "/board.update", method = RequestMethod.POST)
	public String boardUpdate(Board b, HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		int tp_b_no = (Integer) req.getSession().getAttribute("boardNo");
		if (mDAO.loginCheck(req)) {
			bDAO.updateBoard(b, req);
			bDAO.viewBoard(tp_b_no, req);
			bDAO.getReply(req);
			TokenMaker.makeToken(req);
			req.setAttribute("cp", "board/boardView.jsp");
		} else {
			bDAO.viewBoard(tp_b_no, req);
			bDAO.getReply(req);
			TokenMaker.makeToken(req);
			req.setAttribute("cp", "board/boardView.jsp");
		}
		return "index";
	}

	@RequestMapping(value = "/board.like.go", method = RequestMethod.GET)
	public String boardLike(Board b, HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		int tp_b_no = (Integer) req.getSession().getAttribute("boardNo");
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String tp_m_id = m.getTp_m_id();
		if (mDAO.loginCheck(req)) {
			if (bDAO.boardLikeCheck(req, tp_b_no, tp_m_id)) {
				bDAO.boardLikeId(req, tp_b_no, tp_m_id);
				bDAO.viewBoard(tp_b_no, req);
				bDAO.getReply(req);
				TokenMaker.makeToken(req);
				req.setAttribute("cp", "board/boardView.jsp");
			} else {
				bDAO.viewBoard(tp_b_no, req);
				bDAO.getReply(req);
				TokenMaker.makeToken(req);
				req.setAttribute("cp", "board/boardView.jsp");
			}
		} else {
			bDAO.viewBoard(tp_b_no, req);
			bDAO.getReply(req);
			TokenMaker.makeToken(req);
			req.setAttribute("cp", "board/boardView.jsp");
		}
		return "index";
	}

	// 댓글 작성하는 method
	@RequestMapping(value = "/reply.write", method = RequestMethod.POST)
	public String writeReply(HttpServletRequest req, Reply r) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		int tp_b_no = (Integer) req.getSession().getAttribute("boardNo");
		mDAO.loginCheck(req);
		bDAO.writeReply(tp_b_no, req, r);
		bDAO.viewBoard(tp_b_no, req);
		bDAO.getReply(req);
		TokenMaker.makeToken(req);
		req.setAttribute("cp", "board/boardView.jsp");
		return "index";
	}

	// 댓글 삭제하는 method
	@RequestMapping(value = "/reply.delete", method = RequestMethod.POST)
	public String replyDelete(HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		int tp_b_no = (Integer) req.getSession().getAttribute("boardNo");
		int tp_r_no = Integer.parseInt(req.getParameter("tp_r_no"));
		if (mDAO.loginCheck(req)) {
			bDAO.deleteReply(tp_b_no, tp_r_no, req);
			bDAO.getReply(req);
			bDAO.viewBoard(tp_b_no, req);
			TokenMaker.makeToken(req);
			req.setAttribute("cp", "board/boardView.jsp");
		} else {
			bDAO.getReply(req);
			bDAO.viewBoard(tp_b_no, req);
			req.setAttribute("cp", "board/boardView.jsp");
		}
		return "index";
	}

	// 댓글 수정하는 method
	@RequestMapping(value = "/reply.update", method = RequestMethod.POST)
	public String replyUpdate(Reply r, HttpServletRequest req) {
		baDAO.bannerEvent(req);
		baDAO.getWeather(req);
		int tp_b_no = (Integer) req.getSession().getAttribute("boardNo");
		BigDecimal tp_r_no = new BigDecimal(Integer.parseInt(req.getParameter("tp_r_no")));
		String tp_r_text = req.getParameter("tp_r_text");
		if (mDAO.loginCheck(req)) {
			bDAO.updateReply(tp_r_no, tp_r_text, r, req);
			bDAO.getReply(req);
			bDAO.viewBoard(tp_b_no, req);
			TokenMaker.makeToken(req);
			req.setAttribute("cp", "board/boardView.jsp");
		} else {
			bDAO.getReply(req);
			bDAO.viewBoard(tp_b_no, req);
			req.setAttribute("cp", "board/boardView.jsp");
		}
		return "index";
	}

}
