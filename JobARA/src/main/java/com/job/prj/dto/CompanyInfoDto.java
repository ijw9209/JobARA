package com.job.prj.dto;

public class CompanyInfoDto {

	private int member_no_seq;
	private int company_no_seq;
	private String company_title;
	private String company_name;
	private String company_cate;
	private String company_capital;
	private String company_take;
	private String company_regdate;
	private String company_all_people;
	private String company_salary;
	private String company_url;
	private String company_logo_url;
	
	
	
	public CompanyInfoDto() {
		super();
	}
	
	public String getCompany_logo_url() {
		return company_logo_url;
	}

	public void setCompany_logo_url(String company_logo_url) {
		this.company_logo_url = company_logo_url;
	}
	
	public String getCompany_cate() {
		return company_cate;
	}
	public void setCompany_cate(String company_cate) {
		this.company_cate = company_cate;
	}


	public int getCompany_no_seq() {
		return company_no_seq;
	}

	public void setCompany_no_seq(int company_no_seq) {
		this.company_no_seq = company_no_seq;
	}

	public String getCompany_title() {
		return company_title;
	}
	public void setCompany_title(String company_title) {
		this.company_title = company_title;
	}
	public String getCompany_capital() {
		return company_capital;
	}
	public void setCompany_capital(String company_capital) {
		this.company_capital = company_capital;
	}
	public String getCompany_take() {
		return company_take;
	}
	public void setCompany_take(String company_take) {
		this.company_take = company_take;
	}
	public String getCompany_url() {
		return company_url;
	}
	public void setCompany_url(String company_url) {
		this.company_url = company_url;
	}
	public int getMember_no_seq() {
		return member_no_seq;
	}
	public void setMember_no_seq(int member_no_seq) {
		this.member_no_seq = member_no_seq;
	}

	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_regdate() {
		return company_regdate;
	}
	public void setCompany_regdate(String company_regdate) {
		this.company_regdate = company_regdate;
	}
	public String getCompany_all_people() {
		return company_all_people;
	}
	public void setCompany_all_people(String company_all_people) {
		this.company_all_people = company_all_people;
	}
	public String getCompany_salary() {
		return company_salary;
	}
	public void setCompany_salary(String company_salary) {
		this.company_salary = company_salary;
	}
}
