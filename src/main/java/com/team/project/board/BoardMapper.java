package com.team.project.board;

import java.util.List;

public interface BoardMapper {

	// 게시글 갯수
	public abstract int getAllBoardCount();

	// 공지글 갯수
	public abstract int getAllNoticeCount();
	
	// 검색어(제목) 해당하는 게시글 갯수
	public abstract int getSearchTitleCount(BoardSelector bSel);
	
	// 검색어(내용) 해당하는 게시글 갯수
	public abstract int getSearchTxtCount(BoardSelector bSel);
	
	// 검색어(내용) 해당하는 게시글 갯수
	public abstract int getSearchWriterCount(BoardSelector bSel);
	
	// 검색어(제목) 해당하는 게시글 갯수
	public abstract int getSearchNTitleCount(BoardSelector bSel);
	
	// 검색어(내용) 해당하는 게시글 갯수
	public abstract int getSearchNTxtCount(BoardSelector bSel);
	
	// 검색어(내용) 해당하는 게시글 갯수
	public abstract int getSearchNWriterCount(BoardSelector bSel);
	
	// 검색어 해당하는 공지글 갯수
	public abstract int getSearchNoticeCount(BoardSelector bSel);

	// 검색어(제목) 해당하는 게시글
	public abstract List<Board> getAllTitle(BoardSelector bSel);
	
	// 검색어(내용) 해당하는 게시글
	public abstract List<Board> getAllTxt(BoardSelector bSel);
	
	// 검색어(작성자) 해당하는 게시글
	public abstract List<Board> getAllWriter(BoardSelector bSel);

	// 검색어 해당하는 공지글
	public abstract List<Board> getAllNoticetitle(BoardSelector bSel);
	
	// 검색어(내용) 해당하는 게시글
	public abstract List<Board> getAllNoticeTxt(BoardSelector bSel);
	
	// 검색어(작성자) 해당하는 게시글
	public abstract List<Board> getAllNoticeWriter(BoardSelector bSel);
	
	// 공지사항
	public abstract List<Board> getAllNotice();
	
	// 공지사항 중요글
	public abstract List<Board> getAllNoticeImp();	
	
	// 게시글 클릭시 전체 정보
	public abstract List<Board> viewBoard(BoardNo bn);
	
	// 게시글 작성
	public abstract int writeBoard(Board b);
	
	// 게시글 작성(사진 포함)
	public abstract int writeBoardPhoto(Board b);
	
	// 게시글 삭제
	public abstract int deleteBoard(BoardNo bn);
	
	// 게시글 수정
	public abstract int updateBoard(Board b);
	
	// 게시글 수정(사진 포함)
	public abstract int updateBoardPhoto(Board b);
	
	// 조회수 변경
	public abstract int updateBoardView(Board b);
	
	// 댓글 보여주기
	public abstract List<Reply> getReply(ReplyNo r);
	
	// 댓글 작성
	public abstract int writeReply(Reply r);
	
	// 댓글 삭제
	public abstract int deleteReply(ReplyNo rn);
	
	// 댓글 수정
	public abstract int updateReply(Reply r);
	
	// 추천수 가져오기
	public abstract int getBoardLike(Board b);
	
	// tp_board에 추천수 적용하기
	public abstract int boardLike(Board b);
	
	// tp_like 테이블에 tp_b_no, tp_m_id 기록하기
	public abstract int boardLikeId(Like l);
	
	// 좋아요 중복 체크하기
	public abstract int boardLikeCheck(Like l);
	
	// 오늘의 핫 게시글 가져오기(조회수 순)
	public abstract List<Board> todayHot();
	
	// 금주의 핫 게시글 가져오기(좋아요 순)
	public abstract List<Board> thisWeekHot();
}
