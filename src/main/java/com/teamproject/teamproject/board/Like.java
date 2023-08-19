package com.teamproject.teamproject.board;

public class Like {

	private int tp_l_no;
	private int tp_l_b_no;
	private String tp_l_m_id;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public Like(int tp_l_no, int tp_l_b_no, String tp_l_m_id) {
		super();
		this.tp_l_no = tp_l_no;
		this.tp_l_b_no = tp_l_b_no;
		this.tp_l_m_id = tp_l_m_id;
	}

	public int getTp_l_no() {
		return tp_l_no;
	}

	public void setTp_l_no(int tp_l_no) {
		this.tp_l_no = tp_l_no;
	}

	public int getTp_l_b_no() {
		return tp_l_b_no;
	}

	public void setTp_l_b_no(int tp_l_b_no) {
		this.tp_l_b_no = tp_l_b_no;
	}

	public String getTp_l_m_id() {
		return tp_l_m_id;
	}

	public void setTp_l_m_id(String tp_l_m_id) {
		this.tp_l_m_id = tp_l_m_id;
	}
	
	
	
}
