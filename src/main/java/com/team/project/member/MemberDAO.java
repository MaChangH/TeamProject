package com.team.project.member;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;
	
	//	ID 비교하는 method
	public Members memberIdCheck(Member m) {
		return new Members(ss.getMapper(MemberMapper.class).getById(m));
	}

	//	로그인 상태일때 true, 아닐 때 false 리턴하는 method
	public boolean loginCheck(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			m.setTp_m_point(ss.getMapper(MemberMapper.class).getPoint(m));
			req.getSession().setAttribute("loginMember", m);
			req.setAttribute("lp", "member/loginSuccess.jsp");
			return true;
		} else {
			req.setAttribute("lp", "member/login.jsp");
			return false;
		}
	}
	
	// 중복 ID 체크하는 method
	public Members idCheck(Member m) {
		return new Members(ss.getMapper(MemberMapper.class).getById(m));
	}
	
	// 중복 닉네임 체크하는 method
	public Members nicknameCheck(Member m) {
		return new Members(ss.getMapper(MemberMapper.class).getByNickname(m));
	}
	
	//	회원가입 하는 method
	public void join(Member m, HttpServletRequest req) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/img");

			MultipartRequest mr = new MultipartRequest(req, path, 10485760,	"utf-8", new DefaultFileRenamePolicy());
			m.setTp_m_id(mr.getParameter("tp_m_id")); // id
			m.setTp_m_pw(mr.getParameter("tp_m_pw")); // 비밀번호
			m.setTp_m_name(mr.getParameter("tp_m_name")); // 이름
			m.setTp_m_nick(mr.getParameter("tp_m_nick")); // 별명
			m.setTp_m_loginNum(0);	// 로그인 한 횟수 => 로그인 할 때마다 1씩 증가하게
			m.setTp_m_firstLogin(20230101); // 로그인 한 횟수가 1이 될 때의 날짜 (년일월 까지만)
			m.setTp_m_point(0);	// 포인트
			
			String addr1 = mr.getParameter("tp_m_addr1");
			String addr2 = mr.getParameter("tp_m_addr2");
			String addr3 = mr.getParameter("tp_m_addr3");
			String addr = addr1 + "!" + addr2 + "!" + addr3;
			m.setTp_m_addr(addr);

			String c_photo = mr.getFilesystemName("tp_m_photo"); // ㅋ ㅋ.png
			String c_photo_kor = URLEncoder.encode(c_photo, "utf-8").replace("+", " "); // %3A 3A.png
			m.setTp_m_photo(c_photo_kor);

			if (ss.getMapper(MemberMapper.class).join(m) == 1) {
				req.setAttribute("r", "가입성공");
			} else {
				req.setAttribute("r", "DB서버의 문제로 가입에 실패했습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입에 실패했습니다");
		}
	}
	
	// login하는 method
	public void login(Member inputM, HttpServletRequest req) {
		try {
			List<Member> dbms = ss.getMapper(MemberMapper.class).getById(inputM);
			if (dbms.size() != 0) {
				Member dbM = dbms.get(0);
				int loginNum = dbM.getTp_m_loginNum();	// dbM의 로그인 횟수
				int first = dbM.getTp_m_firstLogin();	// dbM의 오늘 첫 로그인 날짜
				int point = dbM.getTp_m_point();		// dbM의 포인트
				
				LocalDateTime now = LocalDateTime.now();	// 로그인 하는 지금 현재 시간
				int year = now.getYear();				// 년
				int month = now.getMonthValue();		// 월
				int day = now.getDayOfMonth();			// 일
				String ymd = String.valueOf(year) + String.format("%02d%02d", month, day);
				int nowLogin = Integer.parseInt(ymd);	// 현재 년월일을
				
				if (dbM.getTp_m_pw().equals(inputM.getTp_m_pw())) { // 비밀번호가 일치하면
					
					if (nowLogin > first) {	// 지금 로그인 하는 시간이, 기록된 첫 로그인 시간보다 나중이면
						loginNum = 0;		// 로그인 횟수를 0으로
					}
					
					if (loginNum == 0) {	// 로그인 횟수가 0이면 ==> 첫 로그인이면
						LocalDateTime loginDate = LocalDateTime.now();	// 첫 로그인 당시의 시간
						int loginYear = loginDate.getYear();			// 첫 로그인 년
						int loginMonth = loginDate.getMonthValue();		// 첫 로그인 월
						int loginDay = loginDate.getDayOfMonth();		// 첫 로그인 일
						String loginYmd = String.valueOf(loginYear) + String.format("%02d%02d", loginMonth, loginDay);
						int firstLogin = Integer.parseInt(loginYmd);	// 첫 로그인 년월일
						dbM.setTp_m_firstLogin(firstLogin);				// dbM의 첫 로그인에 기록
															
						point += 100;	// 첫 로그인시 100포인트 제공
						loginNum ++;	// 첫 로그인 후 로그인 횟수가 1이 되면서, 이 후 같은 날의 로그인에서는 else 쪽으로 빠짐
						dbM.setTp_m_loginNum(loginNum);
						dbM.setTp_m_point(point);
						ss.getMapper(MemberMapper.class).setLoginDate(dbM);
						req.getSession().setAttribute("loginMember", dbM);
						req.getSession().setMaxInactiveInterval(0);
//						req.getSession().setMaxInactiveInterval(10 * 60);
						req.setAttribute("r", "오늘의 첫 로그인으로 100포인트를 획득했습니다");
						req.setAttribute("cp", "home.jsp");
					} else {
						loginNum ++;
						dbM.setTp_m_loginNum(loginNum);
						ss.getMapper(MemberMapper.class).setLoginDate(dbM);
						req.getSession().setAttribute("loginMember", dbM);
						req.getSession().setMaxInactiveInterval(0);
//						req.getSession().setMaxInactiveInterval(10 * 60);
						req.setAttribute("r", "로그인했습니다.");
						req.setAttribute("cp", "home.jsp");
					}
					
				} else {
					req.setAttribute("r", "비밀번호를 확인하세요");
					req.setAttribute("cp", "member/loginGo.jsp");
				}
			} else {
				req.setAttribute("r", "ID를 확인하세요");
				req.setAttribute("cp", "member/loginGo.jsp");
			}
		} catch (Exception e) {
			req.setAttribute("r", "DB에 문제가 있습니다. 다음에 로그인하세요");
			req.setAttribute("cp", "member/loginGo.jsp");
		}
	}
	
	// 로그아웃 하는 method
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
		req.getSession().setMaxInactiveInterval(0);
		req.setAttribute("r", "로그아웃 되었습니다");
	}
	
	// 정보 수정할 때 주소 불러오는 method
	public void infoAddr(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String addr = m.getTp_m_addr();
		String[] infoAddr = addr.split("!");
		req.setAttribute("addr", infoAddr);
	}
	
	// 회원 탈퇴하는 method
	public void bye(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");

			if (ss.getMapper(MemberMapper.class).bye(m) == 1) {
				req.setAttribute("r", "탈퇴 되었습니다");
				req.getSession().setAttribute("loginMember", null);

				String dm_photo = m.getTp_m_photo();
				dm_photo = URLDecoder.decode(dm_photo, "UTF-8");

				String path = req.getSession().getServletContext().getRealPath("resources/img");

				new File(path + "/" + dm_photo).delete();

			} else {
				req.setAttribute("r", "탈퇴에 실패했습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "탈퇴에 실패했습니다");
		}
	}
	
	// 회원정보 보기 전 ID, PW 체크하는 method
	public boolean infoCheck(HttpServletRequest req) {
		
		String id = req.getParameter("tp_m_id");
		String pw = req.getParameter("tp_m_pw");
		Member m = (Member) req.getSession().getAttribute("loginMember");
	
		if (pw.equals(m.getTp_m_pw()) && id.equals(m.getTp_m_id())) {
			return true;
		} else {
			req.setAttribute("r", "정보가 올바르지 않습니다");
			return false;
		}
		
	}
	
	// 회원정보 수정하는 method
	public void update(Member m, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		com.oreilly.servlet.MultipartRequest mr = null;
		try {
			mr = new com.oreilly.servlet.MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			req.setAttribute("r", "파일 용량이 너무 큽니다");
			return;
		}

		// 회원정보 조회
		Member lm = (Member) req.getSession().getAttribute("loginMember");

		// 기존 사진 파일명
		String oldFile = lm.getTp_m_photo();

		// 새 파일
		String newFile = mr.getFilesystemName("tp_m_photo");
		try {
			String dm_id = mr.getParameter("tp_m_id");
			String dm_pw = mr.getParameter("tp_m_pw");
			String dm_name = mr.getParameter("tp_m_name");
			String dm_nick = mr.getParameter("tp_m_nick"); // 별명
			
			String addr1 = mr.getParameter("tp_m_addr1");
			String addr2 = mr.getParameter("tp_m_addr2");
			String addr3 = mr.getParameter("tp_m_addr3");
			String addr = addr1 + "!" + addr2 + "!" + addr3;
			m.setTp_m_addr(addr);

			if (newFile == null) {
				newFile = oldFile;
			} else { // 수정했을때
				newFile = URLEncoder.encode(newFile, "utf-8");
				newFile = newFile.replace("+", " ");
			}
			m.setTp_m_id(dm_id);
			m.setTp_m_pw(dm_pw);
			m.setTp_m_name(dm_name);
			m.setTp_m_nick(dm_nick);
			m.setTp_m_photo(newFile);

			// DB 수정하기
			if (ss.getMapper(MemberMapper.class).update(m) == 1) {
				ss.getMapper(MemberMapper.class).updateBNick(m);
				ss.getMapper(MemberMapper.class).updateRNick(m);
				req.setAttribute("r", "수정했습니다");

				// 사이트에 반영하기
				req.getSession().setAttribute("loginMember", m);
				loginCheck(req);

				// 이전 프사 지우기
				if (!oldFile.equals(newFile)) {
					oldFile = URLDecoder.decode(oldFile, "utf-8");
					new File(path + "/" + oldFile).delete();
				}
			} else {
				req.setAttribute("r", "수정에 실패했습니다");

				if (!oldFile.equals(newFile)) {
					newFile = URLDecoder.decode(newFile, "utf-8");
					new File(path + "/" + newFile).delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "수정에 실패했습니다");
			System.out.println(mr.getParameter("tp_m_nick"));
			System.out.println(mr.getParameter("tp_m_pw"));
			System.out.println(mr.getParameter("tp_m_name"));

			// 새 프로필 지우기
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
}
