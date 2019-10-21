package com.job.prj.dto;

import java.util.Date;

public class UserResumeCareerDto {
	private int career_no_seq;
	private int resume_no_seq;
	private int member_no_seq;
	private String career_ent;
	private String career_dept;
	private String career_startday;
	private String career_endday;
	private String career_in_office;
	private String career_position;
	private String career_duty;
	private String career_salary;
	
	public UserResumeCareerDto() {
		
		
	}
	
	public int getCareer_no_seq() {
		return career_no_seq;
	}
	public void setCareer_no_seq(int career_no_seq) {
		this.career_no_seq = career_no_seq;
	}
	public int getResume_no_seq() {
		return resume_no_seq;
	}
	public void setResume_no_seq(int resume_no_seq) {
		this.resume_no_seq = resume_no_seq;
	}
	public int getMember_no_seq() {
		return member_no_seq;
	}
	public void setMember_no_seq(int member_no_seq) {
		this.member_no_seq = member_no_seq;
	}
	public String getCareer_ent() {
		return career_ent;
	}
	public void setCareer_ent(String career_ent) {
		this.career_ent = career_ent;
	}
	public String getCareer_dept() {
		return career_dept;
	}
	public void setCareer_dept(String career_dept) {
		this.career_dept = career_dept;
	}
	public String getCareer_startday() {
		return career_startday;
	}
	public void setCareer_startday(String career_startday) {
		this.career_startday = career_startday;
	}
	public String getCareer_endday() {
		return career_endday;
	}
	public void setCareer_endday(String career_endday) {
		this.career_endday = career_endday;
	}
	public String getCareer_in_office() {
		return career_in_office;
	}
	public void setCareer_in_office(String career_in_office) {
		this.career_in_office = career_in_office;
	}
	public String getCareer_position() {
		return career_position;
	}
	public void setCareer_position(String career_position) {
		this.career_position = career_position;
	}
	public String getCareer_duty() {
		return career_duty;
	}
	public void setCareer_duty(String career_duty) {
		this.career_duty = career_duty;
	}
	public String getCareer_salary() {
		return career_salary;
	}
	public void setCareer_salary(String career_salary) {
		this.career_salary = career_salary;
	}

	public UserResumeCareerDto(int career_no_seq, int resume_no_seq, int member_no_seq, String career_ent,
			String career_dept, String career_startday, String career_endday, String career_in_office,
			String career_position, String career_duty, String career_salary) {
		super();
		this.career_no_seq = career_no_seq;
		this.resume_no_seq = resume_no_seq;
		this.member_no_seq = member_no_seq;
		this.career_ent = career_ent;
		this.career_dept = career_dept;
		this.career_startday = career_startday;
		this.career_endday = career_endday;
		this.career_in_office = career_in_office;
		this.career_position = career_position;
		this.career_duty = career_duty;
		this.career_salary = career_salary;
		
	}
	

}
