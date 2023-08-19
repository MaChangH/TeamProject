package com.teamproject.teamproject.board;

import java.math.BigDecimal;
import java.util.Date;

public class Reply {

	private BigDecimal tp_r_no;
	private int tp_r_b_no;
	private String tp_r_writer;
	private String tp_r_text;
	private Date tp_r_date;
	private String tp_r_edit;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(BigDecimal tp_r_no, int tp_r_b_no, String tp_r_writer, String tp_r_text, Date tp_r_date,
			String tp_r_edit) {
		super();
		this.tp_r_no = tp_r_no;
		this.tp_r_b_no = tp_r_b_no;
		this.tp_r_writer = tp_r_writer;
		this.tp_r_text = tp_r_text;
		this.tp_r_date = tp_r_date;
		this.tp_r_edit = tp_r_edit;
	}

	public BigDecimal getTp_r_no() {
		return tp_r_no;
	}

	public void setTp_r_no(BigDecimal tp_r_no) {
		this.tp_r_no = tp_r_no;
	}

	public int getTp_r_b_no() {
		return tp_r_b_no;
	}

	public void setTp_r_b_no(int tp_r_b_no) {
		this.tp_r_b_no = tp_r_b_no;
	}

	public String getTp_r_writer() {
		return tp_r_writer;
	}

	public void setTp_r_writer(String tp_r_writer) {
		this.tp_r_writer = tp_r_writer;
	}

	public String getTp_r_text() {
		return tp_r_text;
	}

	public void setTp_r_text(String tp_r_text) {
		this.tp_r_text = tp_r_text;
	}

	public Date getTp_r_date() {
		return tp_r_date;
	}

	public void setTp_r_date(Date tp_r_date) {
		this.tp_r_date = tp_r_date;
	}

	public String getTp_r_edit() {
		return tp_r_edit;
	}

	public void setTp_r_edit(String tp_r_edit) {
		this.tp_r_edit = tp_r_edit;
	}

	
	
}
