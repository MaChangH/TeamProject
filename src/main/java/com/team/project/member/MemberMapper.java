package com.team.project.member;

import java.util.List;

import com.team.project.board.Board;

public interface MemberMapper {

	// Id 가져오기
	public abstract List<Member> getById(Member m);
	
	// 닉네임 가져오기
	public abstract List<Member> getByNickname(Member m);
	
	// 로그인 시 로그인시간, 로그인횟수, 포인트 DB에 적용
	public abstract int setLoginDate(Member m);
	
	// 회원 가입하기
	public abstract int join(Member m);
	
	// 회원 탈퇴하기
	public abstract int bye(Member m);
	
	// 정보 수정하기
	public abstract int update(Member m);
	
	// 정보 수정하기 - 게시글 닉네임
	public abstract int updateBNick(Member m);
	
	// 정보 수정하기 - 댓글 닉네임
	public abstract int updateRNick(Member m);
	
	// 포인트 불러오기
	public abstract int getPoint(Member m);
	
	// 게시글 작성자 사진 불러오기
	public abstract String getBoardWriterImg(Board b);
}
