package com.team.project.board;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team.project.member.Member;
import com.team.project.member.MemberMapper;

@Service
public class BoardDAO {

	private int allBoardCount;
	private int allNoticeCount;
	
	@Autowired
	private SqlSession ss;
	
	// 전체 게시글 수 가져오는 method
	public void countAllBoard() {
		allBoardCount = ss.getMapper(BoardMapper.class).getAllBoardCount();
		allNoticeCount = ss.getMapper(BoardMapper.class).getAllNoticeCount();
	}
	
	// 검색어 초기화 method
	public void searchClear(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
		req.getSession().setAttribute("searchNum", 1);
		req.getSession().setAttribute("pageNum", 1);
		req.getSession().setAttribute("nowPage", 1);
		req.getSession().setAttribute("boardPerPage", 10);
		req.getSession().setAttribute("p", 0); // 검색 초기화가 되면 값이 0이 되는 세션, 페이지 번호가 바뀌면 값이 변함
	}
	
	// 검색어에 해당하는 게시글 가져오는 method
	public void getBoardMsg(int page, HttpServletRequest req) {
		String search = (String) req.getSession().getAttribute("search"); // 검색어
		int boardCount = 0;
		int searchNum = 1; // 검색을 어떤것으로 할지
		int nowPage = 0; // 마지막으로 머물렀던 페이지가 몇 번인지
		if (search == null) { // 전체조회
			boardCount = allBoardCount; // mapper의 sql로 가서 전체 조회한 값
			search = "";
		} else { // 검색
			searchNum = Integer.parseInt(req.getParameter("searchNum"));
			req.getSession().setAttribute("searchNum", searchNum);
			BoardSelector bSel2 = new BoardSelector(search, 0, 0);
			searchNum = Integer.parseInt(req.getParameter("searchNum"));
			if (searchNum == 1) {
				boardCount = ss.getMapper(BoardMapper.class).getSearchTitleCount(bSel2);
			}else if (searchNum == 2) {
				boardCount = ss.getMapper(BoardMapper.class).getSearchTxtCount(bSel2);				
			}else if (searchNum == 3) {
				boardCount = ss.getMapper(BoardMapper.class).getSearchWriterCount(bSel2);				
			}
			
		}
		int PerPage = (Integer) req.getSession().getAttribute("boardPerPage"); // 한 페이지에 몇 개의 게시글을 보여줄지
		req.getSession().setAttribute("boardPerPage", PerPage);
		
		int allPageCount = (int) Math.ceil(boardCount / (double) PerPage);
		req.setAttribute("allPageCount", allPageCount);
		req.getSession().setAttribute("APCSession", allPageCount);
		int start = (PerPage * (page - 1)) + 1;
		int end = (page == allPageCount) ? boardCount : (start + PerPage - 1);
		BoardSelector bSel = new BoardSelector(search, start, end);
		if (page == allPageCount || page + 1 == allPageCount) {
			if (page <= 4 && allPageCount <= 4) {
				req.setAttribute("startPage", 1);
				req.setAttribute("endPage", allPageCount);
			}else {
				req.setAttribute("startPage", allPageCount - 4);
				req.setAttribute("endPage", allPageCount);					
			}
<<<<<<< HEAD
		}else if (page == 1 || page == 2 || page == 3 || page == 4) {
			if (page <= 4 && allPageCount <= 4) {
				req.setAttribute("startPage", 1);					
				req.setAttribute("endPage", allPageCount);
			}else if (page == 1 || page == 2) {
				page = 2;
				req.setAttribute("startPage", page - 1);
				req.setAttribute("endPage", page + 3);					
			}else if (page == 3 || page == 4) { 
				req.setAttribute("startPage", page - 2);
				req.setAttribute("endPage", page + 2);
			}
=======
>>>>>>> yang2
		}else if (page + 3 == allPageCount) {
			req.setAttribute("startPage", page - 2);
			req.setAttribute("endPage", allPageCount);
		}else if (page == 1 || page == 2 || page == 3 || page == 4) {
			if (page <= 4 && allPageCount <= 4) {
				req.setAttribute("startPage", 1);					
				req.setAttribute("endPage", allPageCount);
			}else if (page == 1 || page == 2) {
				page = 2;
				req.setAttribute("startPage", page - 1);
				req.setAttribute("endPage", page + 3);					
			}else if (page == 3 || page == 4) { 
				req.setAttribute("startPage", page - 2);
				req.setAttribute("endPage", page + 2);
			}
		}else {
			req.setAttribute("startPage", page - 2);
			req.setAttribute("endPage", page + 2);
		}
		List<Board> notices = ss.getMapper(BoardMapper.class).getAllNotice();
		List<Board> boards = null;
		if (searchNum == 1) {
			boards = ss.getMapper(BoardMapper.class).getAllTitle(bSel);	
		}else if (searchNum == 2) {
			boards = ss.getMapper(BoardMapper.class).getAllTxt(bSel);									
		}else if (searchNum == 3) {
			boards = ss.getMapper(BoardMapper.class).getAllWriter(bSel);																
		}
		List<Board> imps = ss.getMapper(BoardMapper.class).getAllNoticeImp();
		req.setAttribute("boardMsg", boards);
		req.setAttribute("notice", notices);
		req.setAttribute("imp", imps);
		req.getSession().setAttribute("searchNum", searchNum);
		
		if ((Integer) req.getSession().getAttribute("p") == 0) { // 검색 초기화가 발생하면
			nowPage = 1; // 페이지를 1번으로
		} else {
			nowPage = Integer.parseInt(req.getParameter("p")); // 그 외에는 파라미터 값으로
		}
		req.getSession().setAttribute("nowPage", nowPage);
		req.getSession().setAttribute("p", nowPage); // 0이었던 세션 값을 바꿈
		
		
		Date sysdate = new Date(); // 하루 이상 지난 게시글들은 날짜가 간략하게 표시되게 하기 위한 기준점
		sysdate.setHours(0);
		sysdate.setMinutes(0);
		sysdate.setSeconds(0);
		req.getSession().setAttribute("sysdate", sysdate);
	}
	
	// 검색어에 해당하는 공지글 가져오는 method
		public void getNoticeMsg(int page, HttpServletRequest req) {
			String search = (String) req.getSession().getAttribute("search"); // 검색어
			int noticeCount = 0;
			int searchNum = 1;
			if (search == null) { // 전체조회
				noticeCount = allNoticeCount; // 23
				search = "";			
			} else { // 검색
				BoardSelector bSel2 = new BoardSelector(search, 0, 0);
				searchNum = Integer.parseInt(req.getParameter("searchNum"));
				req.getSession().setAttribute("searchNum", searchNum);
				noticeCount = ss.getMapper(BoardMapper.class).getSearchNoticeCount(bSel2);
				if (searchNum == 1) {
					noticeCount = ss.getMapper(BoardMapper.class).getSearchNTitleCount(bSel2);
				}else if (searchNum == 2) {
					noticeCount = ss.getMapper(BoardMapper.class).getSearchNTxtCount(bSel2);				
				}else if (searchNum == 3) {
					noticeCount = ss.getMapper(BoardMapper.class).getSearchNWriterCount(bSel2);				
				}
			}
			int PerPage = (Integer) req.getSession().getAttribute("boardPerPage");
			int allPageCountNotice = (int) Math.ceil(noticeCount / (double) PerPage);
			req.setAttribute("APCN", allPageCountNotice);
			req.getSession().setAttribute("APCNSession", allPageCountNotice);
			int start = (PerPage * (page - 1)) + 1;
			int end = (page == allPageCountNotice) ? noticeCount : (start + PerPage - 1);
			BoardSelector bSel = new BoardSelector(search, start, end);
			if (page == allPageCountNotice || page + 1 == allPageCountNotice) {
				if (page <= 4 && allPageCountNotice <= 4) {
					req.setAttribute("startPage", 1);
					req.setAttribute("endPage", allPageCountNotice);
				}else {
					req.setAttribute("startPage", allPageCountNotice - 4);
					req.setAttribute("endPage", allPageCountNotice);					
				}
<<<<<<< HEAD
			}else if (page == 1 || page == 2 || page == 3 || page == 4) {
				if (page <= 4 && allPageCountNotice <= 4) {
					req.setAttribute("startPage", 1);					
					req.setAttribute("endPage", allPageCountNotice);
				}else if (page == 1 || page == 2) {
					page = 2;
					req.setAttribute("startPage", page - 1);
					req.setAttribute("endPage", page + 3);					
				}else if (page == 3 || page == 4) { 
					req.setAttribute("startPage", page - 2);
					req.setAttribute("endPage", page + 2);
				}
=======
>>>>>>> yang2
			}else if (page + 3 == allPageCountNotice) {
				req.setAttribute("startPage", page - 2);
				req.setAttribute("endPage", allPageCountNotice);
			}else if (page == 1 || page == 2 || page == 3 || page == 4) {
				if (page <= 4 && allPageCountNotice <= 4) {
					req.setAttribute("startPage", 1);					
					req.setAttribute("endPage", allPageCountNotice);
				}else if (page == 1 || page == 2) {
					page = 2;
					req.setAttribute("startPage", page - 1);
					req.setAttribute("endPage", page + 3);					
				}else if (page == 3 || page == 4) { 
					req.setAttribute("startPage", page - 2);
					req.setAttribute("endPage", page + 2);
				}
			}else {
				req.setAttribute("startPage", page - 2);
				req.setAttribute("endPage", page + 2);
			}
			List<Board> notices = null;
			if (searchNum == 1) {
				notices = ss.getMapper(BoardMapper.class).getAllNoticetitle(bSel);	
			}else if (searchNum == 2) {
				notices = ss.getMapper(BoardMapper.class).getAllNoticeTxt(bSel);									
			}else if (searchNum == 3) {
				notices = ss.getMapper(BoardMapper.class).getAllNoticeWriter(bSel);																
			}
			req.setAttribute("notice", notices);
		}
	
	// 클릭한 게시글 전체 내용 보여주는 method
	public void viewBoard(int tp_b_no, HttpServletRequest req) {
		BoardNo bn = new BoardNo(tp_b_no);
		List<Board> boards = ss.getMapper(BoardMapper.class).viewBoard(bn);
		Board board = boards.get(0);
		
		int like = ss.getMapper(BoardMapper.class).getBoardLike(board);
		board.setTp_b_like(like);
		ss.getMapper(BoardMapper.class).boardLike(board);
		
		int view = board.getTp_b_view();
		view++;
//		System.out.println(view);
		board.setTp_b_view(view);
		
		String photo = ss.getMapper(MemberMapper.class).getBoardWriterImg(board);
		req.getSession().setAttribute("writerImg", photo);
		req.getSession().setMaxInactiveInterval(0);
		
		boards.set(0, board);
		String writer = board.getTp_b_writer();
		ss.getMapper(BoardMapper.class).updateBoardView(board);
		req.getSession().setAttribute("boardManager", board);
		req.getSession().setAttribute("boardNo", tp_b_no);
		req.getSession().setAttribute("boardText", (board.getTp_b_txt()).replace("<br>", "\r\n"));
		req.getSession().setAttribute("boardWriter", writer);
		req.setAttribute("boards", boards);
	}
	
	// 검색어 입력시 세션에 검색어 저장하는 method
	public void searchBoard(HttpServletRequest req) {
		String search = req.getParameter("search");
		req.getSession().setAttribute("search", search);
		
		int PerPage = Integer.parseInt(req.getParameter("b")); // 한 페이지에 몇 개의 게시글을 보여줄지
		req.getSession().setAttribute("boardPerPage", PerPage);
	}
	
	// 게시글 작성하는 method
	public void writeBoard(Board b, HttpServletRequest req) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/img");

			MultipartRequest mr = new MultipartRequest(req, path, 10485760, "utf-8", new DefaultFileRenamePolicy());
			String token = mr.getParameter("token");
			String st2 = (String) req.getSession().getAttribute("st");
			if (st2 != null && token.equals(st2)) {
				req.setAttribute("r", "글쓰기실패(새로고침)");
				return;
			}
			
			Member lm = (Member) req.getSession().getAttribute("loginMember");
			b.setTp_b_id(lm.getTp_m_id());
			
			String title = mr.getParameter("tp_b_title");
			b.setTp_b_title(title);
			b.setTp_b_writer(mr.getParameter("tp_b_writer"));
			String txt = mr.getParameter("tp_b_txt").replace("\r\n", "<br>");
			b.setTp_b_txt(txt);
			b.setTp_b_notice(mr.getParameter("tp_b_notice"));
			b.setTp_b_imp(mr.getParameter("tp_b_imp"));
//			System.out.println(b.getTp_b_imp());
			String tp_b_photo = mr.getFilesystemName("tp_b_photo");
			String tp_b_photo_kor = null;
			
			
			
//			System.out.println(b.getTp_b_title());
//			System.out.println(b.getTp_b_txt());
//			System.out.println(b.getTp_b_writer());
//			System.out.println(b.getTp_b_photo());
//			System.out.println(b.getTp_b_notice());
//			System.out.println(b.getTp_b_imp());
			if (tp_b_photo == null) {
				if (ss.getMapper(BoardMapper.class).writeBoard(b) == 1) {
					req.setAttribute("r", "글쓰기성공");
					req.getSession().setAttribute("st", token);
//					System.out.println(token);
//					System.out.println(st2);
					allBoardCount++;
				}else {
					req.setAttribute("r", "글쓰기실패");
				}
			}else if (tp_b_photo != null) {
				tp_b_photo_kor = URLEncoder.encode(tp_b_photo, "utf-8").replace("+", " ");
				b.setTp_b_photo(tp_b_photo_kor);
				if (ss.getMapper(BoardMapper.class).writeBoardPhoto(b) == 1) {
					req.setAttribute("r", "글쓰기성공-pt");
					req.getSession().setAttribute("st", token);
					allBoardCount++;
				}else {
					req.setAttribute("r", "글쓰기실패-pt");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "글쓰기실패-db");
//			System.out.println("글쓰기실패-db");
		}
	}
	
	// 게시글 삭제하는 method
	public void deleteBoard(int tp_b_no, HttpServletRequest req) {
		try {
			BoardNo bn = new BoardNo(tp_b_no);
			if (ss.getMapper(BoardMapper.class).deleteBoard(bn) == 1) {
				req.setAttribute("r", "글삭제성공");
				allBoardCount--;
			}else {
				req.setAttribute("r", "글삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "글삭제실패-DB");
		}
	}
	
	
	// 게시글 수정하는 method
	public void updateBoard(Board b, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "수정실패(파일용량초과)");
			return;
		}
		Board otk = (Board) req.getSession().getAttribute("boardManager");
		String oldFile = otk.getTp_b_photo();
		if (oldFile == null) {
			oldFile = "";
		}
		String newFile = mr.getFilesystemName("tp_b_photo");
//		System.out.println(oldFile);
//		System.out.println(newFile);
		try {
			String token = mr.getParameter("token");

			String st2 = (String) req.getSession().getAttribute("st");
//			System.out.println(token);
//			System.out.println(st2);

			if (st2 != null && token.equals(st2)) {
				req.setAttribute("r", "글수정실패(새로고침)");
				return;
			}
			b.setTp_b_no(Integer.parseInt(mr.getParameter("tp_b_no")));
//			System.out.println(mr.getParameter("tp_b_no"));
			String title = mr.getParameter("tp_b_title");
			b.setTp_b_title(title);
//			System.out.println(title);
			String txt = mr.getParameter("tp_b_txt").replace("\r\n", "<br>");
			b.setTp_b_txt(txt);
			b.setTp_b_notice(mr.getParameter("tp_b_notice"));
			b.setTp_b_imp(mr.getParameter("tp_b_imp"));
//			System.out.println(txt);
			if (newFile == null) { // 사진은 수정 안하는
				newFile = oldFile;
				if (ss.getMapper(BoardMapper.class).updateBoard(b) == 1) {
					req.setAttribute("r", "글수정성공");
					req.getSession().setAttribute("st", token);
				}else {
					req.setAttribute("r", "글수정실패");
				}
			} else if (newFile != null){ // 사진 수정
				newFile = URLEncoder.encode(newFile, "utf-8").replace("+", " ");
				b.setTp_b_photo(newFile);
				if (ss.getMapper(BoardMapper.class).updateBoardPhoto(b) == 1) {
					req.setAttribute("r", "글수정성공-pt");
					req.getSession().setAttribute("st", token);
					if (!oldFile.equals(newFile)) {
						oldFile = URLDecoder.decode(oldFile, "utf-8");
						new File(path + "/" + oldFile).delete();
					}
				}else {
					req.setAttribute("r", "글수정실패-pt");
					if (!oldFile.equals(newFile)) {
						newFile = URLDecoder.decode(newFile, "utf-8");
						new File(path + "/" + newFile).delete();
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "글수정실패-db");
//			System.out.println("글수정실패-db");
			if (!oldFile.equals(newFile)) {
				try {
					newFile = URLDecoder.decode(newFile, "utf-8");
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
				new File(path + "/" + newFile).delete();
			}
		}
	}
	
	// 게시글 추천이 처음인지 아닌지 확인하는 method
	public boolean boardLikeCheck(HttpServletRequest req, int tp_l_b_no, String tp_l_m_id) {
		Like l = new Like();
		l.setTp_l_b_no(tp_l_b_no);
		l.setTp_l_m_id(tp_l_m_id);
		if (ss.getMapper(BoardMapper.class).boardLikeCheck(l) == 1) {
			req.setAttribute("r", "이미 추천한 게시글입니다");
			return false;
		} else {
			return true;
		} 
	}
	
	// 게시글 추천 누르면 tp_like 테이블에 게시글번호, 추천누른 회원 id 기록하는 method
	public void boardLikeId(HttpServletRequest req, int tp_l_b_no, String tp_l_m_id) {
		Like l = new Like();
		l.setTp_l_b_no(tp_l_b_no);
		l.setTp_l_m_id(tp_l_m_id);
		if (ss.getMapper(BoardMapper.class).boardLikeId(l) == 1) {
			req.setAttribute("r", "게시글을 추천하였습니다");
		}
	}
	
	// 해당 게시글에 있는 댓글 불러오는 method
	public void getReply(HttpServletRequest req) {
		try {
			ReplyNo r = new ReplyNo();
			r.setTp_r_b_no((Integer) req.getSession().getAttribute("boardNo"));
			
			List<Reply> replys = ss.getMapper(BoardMapper.class).getReply(r);
			req.setAttribute("Reply", replys);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시글에 댓글 작성하는 method
	public void writeReply(int tp_b_no, HttpServletRequest req, Reply r) {
		try {
			
			Member lm = (Member) req.getSession().getAttribute("loginMember");
			r.setTp_r_id(lm.getTp_m_id());
			
			r.setTp_r_writer(req.getParameter("tp_r_writer"));
			r.setTp_r_text(req.getParameter("tp_r_text"));
			r.setTp_r_b_no(tp_b_no);
			
			
			String formerToken = (String) req.getSession().getAttribute("st");
			String token = req.getParameter("token");
			
			if (!token.equals(formerToken)) {
				ss.getMapper(BoardMapper.class).writeReply(r);
				req.setAttribute("r", "댓글 작성 성공");
				//	해당 번호에 해당하는 게시글의 전체 댓글 수를 불러옴
				int rCount = ss.getMapper(BoardMapper.class).getBoardRCount(tp_b_no);
				
				//	해당 no를 갖는 Board 전체의 정보 불러옴
				List<Board> Boards = ss.getMapper(BoardMapper.class).getBoardbyNo(tp_b_no);
				
				//	no는 중복 없는 값이기 때문에 0번째 Board를 불러오면 해당 no를 갖는 Board임
				Board b = Boards.get(0);
				
				//	b의 tp_b_rCount에 rCount를 적용
				b.setTp_b_rCount(rCount);
				
				//	b의 rCount를 DB에 적용
				ss.getMapper(BoardMapper.class).updateBoardRCount(b);
				req.getSession().setAttribute("st", token);
				
//				System.out.println(formerToken);
//				System.out.println(token);
			} else {
				req.setAttribute("r", "댓글 작성 실패(새로고침)");
			}
			
		} catch (Exception e) {
			req.setAttribute("r", "댓글 작성 실패");
			e.printStackTrace();
		}
	}
	
	// 댓글 삭제하는 method
	public void deleteReply(int tp_r_b_no, int tp_r_no, HttpServletRequest req) {
		try {
			ReplyNo rn = new ReplyNo(tp_r_b_no, tp_r_no);
			if (ss.getMapper(BoardMapper.class).deleteReply(rn) == 1) {
				req.setAttribute("r", "댓글삭제성공");
				int rCount = ss.getMapper(BoardMapper.class).getBoardRCount(tp_r_b_no);

				List<Board> Boards = ss.getMapper(BoardMapper.class).getBoardbyNo(tp_r_b_no);
				Board b = Boards.get(0);
				b.setTp_b_rCount(rCount);
				
				ss.getMapper(BoardMapper.class).updateBoardRCount(b);
			}else {
				req.setAttribute("r", "댓글삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "댓글삭제실패-DB");
		}
	}
	
	// 댓글 수정하는 method
	public void updateReply(BigDecimal tp_r_no, String tp_r_text, Reply r, HttpServletRequest req) {
		try {
			r.setTp_r_text(tp_r_text);
			r.setTp_r_no(tp_r_no);
			r.setTp_r_edit("(수정됨)");
			if (ss.getMapper(BoardMapper.class).updateReply(r) == 1) {
				req.setAttribute("r", "댓글수정성공");
			}else {
				req.setAttribute("r", "댓글수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "댓글수정실패-DB");
		}
	}
	
	
	
}
