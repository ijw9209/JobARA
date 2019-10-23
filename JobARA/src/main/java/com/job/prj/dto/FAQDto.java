package com.job.prj.dto;

public class FAQDto {
	
	private int faq_no_seq;
	private String faq_title;
	private String faq_content;
	private String faq_id;
	
	public FAQDto() {}

	public FAQDto(int faq_no_seq, String faq_title, String faq_content, String faq_id) {
		this.faq_no_seq = faq_no_seq;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.faq_id = faq_id;
	}

	public int getFaq_no_seq() {
		return faq_no_seq;
	}

	public void setFaq_no_seq(int faq_no_seq) {
		this.faq_no_seq = faq_no_seq;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(String faq_id) {
		this.faq_id = faq_id;
	}
}
