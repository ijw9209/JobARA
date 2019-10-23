package com.job.prj.dto;

import java.util.Date;

public class CustomerServiceDto {
	
	private int customer_no_seq;
	private int member_no_seq;
	private String member_id;
	private String customer_title;
	private String customer_content;
	private Date customer_regdate;
	private String customer_email;
	
	public CustomerServiceDto() {}

	public CustomerServiceDto(int customer_no_seq, int member_no_seq, String member_id, String customer_title,
			String customer_content, Date customer_regdate, String customer_email) {
		super();
		this.customer_no_seq = customer_no_seq;
		this.member_no_seq = member_no_seq;
		this.member_id = member_id;
		this.customer_title = customer_title;
		this.customer_content = customer_content;
		this.customer_regdate = customer_regdate;
		this.customer_email = customer_email;
	}

	public int getCustomer_no_seq() {
		return customer_no_seq;
	}

	public void setCustomer_no_seq(int customer_no_seq) {
		this.customer_no_seq = customer_no_seq;
	}

	public int getMember_no_seq() {
		return member_no_seq;
	}

	public void setMember_no_seq(int member_no_seq) {
		this.member_no_seq = member_no_seq;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCustomer_title() {
		return customer_title;
	}

	public void setCustomer_title(String customer_title) {
		this.customer_title = customer_title;
	}

	public String getCustomer_content() {
		return customer_content;
	}

	public void setCustomer_content(String customer_content) {
		this.customer_content = customer_content;
	}

	public Date getCustomer_regdate() {
		return customer_regdate;
	}

	public void setCustomer_regdate(Date customer_regdate) {
		this.customer_regdate = customer_regdate;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
}
