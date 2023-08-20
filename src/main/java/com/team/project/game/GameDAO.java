package com.team.project.game;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.member.Member;

@Service
public class GameDAO {

	@Autowired
	private SqlSession ss;
	
	// 블랙잭
	public void blackJack(HttpServletRequest req) {
		ArrayList<String> numbers = new ArrayList<String>();
		numbers.add("♠A");
		numbers.add("♠2");
		numbers.add("♠3");
		numbers.add("♠4");
		numbers.add("♠5");
		numbers.add("♠6");
		numbers.add("♠7");
		numbers.add("♠8");
		numbers.add("♠9");
		numbers.add("♠10");
		numbers.add("♠J");
		numbers.add("♠Q");
		numbers.add("♠K");
		
		numbers.add("♥A");
		numbers.add("♥2");
		numbers.add("♥3");
		numbers.add("♥4");
		numbers.add("♥5");
		numbers.add("♥6");
		numbers.add("♥7");
		numbers.add("♥8");
		numbers.add("♥9");
		numbers.add("♥10");
		numbers.add("♥J");
		numbers.add("♥Q");
		numbers.add("♥K");
		
		numbers.add("♣A");
		numbers.add("♣2");
		numbers.add("♣3");
		numbers.add("♣4");
		numbers.add("♣5");
		numbers.add("♣6");
		numbers.add("♣7");
		numbers.add("♣8");
		numbers.add("♣9");
		numbers.add("♣10");
		numbers.add("♣J");
		numbers.add("♣Q");
		numbers.add("♣K");
		
		numbers.add("◆A");
		numbers.add("◆2");
		numbers.add("◆3");
		numbers.add("◆4");
		numbers.add("◆5");
		numbers.add("◆6");
		numbers.add("◆7");
		numbers.add("◆8");
		numbers.add("◆9");
		numbers.add("◆10");
		numbers.add("◆J");
		numbers.add("◆Q");
		numbers.add("◆K");
		
		
		// 카드 덱 섞기
		ArrayList<String> cards = new ArrayList<String>();
		ArrayList<Integer> cardSeq = new ArrayList<Integer>();
		int j = 0;
		for (int i = 0; i < 52; i++) {
			j ++;
			cardSeq.add(j);
			Random r = new Random();
			int num = r.nextInt(numbers.size());
			cards.add(numbers.get(num));
			numbers.remove(num);
		}
		
		
		
		req.getSession().setAttribute("bJCards", cards);
		req.getSession().setAttribute("bJSeq", cardSeq);
	}
	
	// 포인트 베팅
	public void betPoint(HttpServletRequest req) {
		if (req.getParameter("myPoint") != null && req.getSession().getAttribute("loginMember") != null) {
			int myPoint = Integer.parseInt(req.getParameter("myPoint"));
			Member m = (Member) req.getSession().getAttribute("loginMember");
			m.setTp_m_point(myPoint);
			ss.getMapper(GameMapper.class).betPoint(m);
			System.out.println(m.getTp_m_point());
		}
	}
	
	// 포인트 획득
	public void getPoint(HttpServletRequest req) {
		if (req.getParameter("myPoint") != null && req.getSession().getAttribute("loginMember") != null) {
			int myPoint = Integer.parseInt(req.getParameter("myPoint"));
			Member m = (Member) req.getSession().getAttribute("loginMember");
			int point = m.getTp_m_point();
			point += myPoint;
			m.setTp_m_point(point);
			ss.getMapper(GameMapper.class).betPoint(m);
			System.out.println(m.getTp_m_point());
		}
	}
}
