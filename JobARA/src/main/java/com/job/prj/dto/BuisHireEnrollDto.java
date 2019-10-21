package com.job.prj.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class BuisHireEnrollDto {

	private int hire_no_seq;
	private int member_no_seq;
	private String hire_recruit_name;
	private String hire_company_title;
	private String hire_career;
	private String hire_task;
	private String hire_depart;
	private String hire_position;
	private String hire_prefer;
	private String hire_prefer_content;
	private String hire_edu;
	private String hire_gender;
	private String hire_salary;
	private String hire_age;
	private String hire_sector;
	private String hire_addr;
	private String hire_latitude;
	private String hire_longitude;
	private String hire_workday;
	private String hire_worktime;
	private String hire_startday;
	private String hire_endday;
	private String hire_mode;
	private String hire_manager_name;
	private String hire_manager_tel;
	private String hire_manager_email;
	private String hire_ent_tel;

	public BuisHireEnrollDto() {
		super();
	}


	public BuisHireEnrollDto(int hire_no_seq, int member_no_seq, String hire_recruit_name, String hire_company_title,
			String hire_career, String hire_task, String hire_depart, String hire_position, String hire_prefer,
			String hire_prefer_content, String hire_edu, String hire_gender, String hire_salary, String hire_age,
			String hire_sector, String hire_addr, String hire_latitude, String hire_longitude, String hire_workday,
			String hire_worktime, String hire_startday, String hire_endday, String hire_mode, String hire_manager_name,
			String hire_manager_tel, String hire_manager_email, String hire_ent_tel) {
		super();
		this.hire_no_seq = hire_no_seq;
		this.member_no_seq = member_no_seq;
		this.hire_recruit_name = hire_recruit_name;
		this.hire_company_title = hire_company_title;
		this.hire_career = hire_career;
		this.hire_task = hire_task;
		this.hire_depart = hire_depart;
		this.hire_position = hire_position;
		this.hire_prefer = hire_prefer;
		this.hire_prefer_content = hire_prefer_content;
		this.hire_edu = hire_edu;
		this.hire_gender = hire_gender;
		this.hire_salary = hire_salary;
		this.hire_age = hire_age;
		this.hire_sector = hire_sector;
		this.hire_addr = hire_addr;
		this.hire_latitude = hire_latitude;
		this.hire_longitude = hire_longitude;
		this.hire_workday = hire_workday;
		this.hire_worktime = hire_worktime;
		this.hire_startday = hire_startday;
		this.hire_endday = hire_endday;
		this.hire_mode = hire_mode;
		this.hire_manager_name = hire_manager_name;
		this.hire_manager_tel = hire_manager_tel;
		this.hire_manager_email = hire_manager_email;
		this.hire_ent_tel = hire_ent_tel;
	}



	public int getHire_no_seq() {
		return hire_no_seq;
	}

	public void setHire_no_seq(int hire_no_seq) {
		this.hire_no_seq = hire_no_seq;
	}

	public int getMember_no_seq() {
		return member_no_seq;
	}

	public void setMember_no_seq(int member_no_seq) {
		this.member_no_seq = member_no_seq;
	}

	public String getHire_recruit_name() {
		return hire_recruit_name;
	}

	public void setHire_recruit_name(String hire_recruit_name) {
		this.hire_recruit_name = hire_recruit_name;
	}

	public String getHire_career() {
		return hire_career;
	}

	public void setHire_career(String hire_career) {
		this.hire_career = hire_career;
	}

	public String getHire_task() {
		return hire_task;
	}

	public void setHire_task(String hire_task) {
		this.hire_task = hire_task;
	}

	public String getHire_depart() {
		return hire_depart;
	}

	public void setHire_depart(String hire_depart) {
		this.hire_depart = hire_depart;
	}

	public String getHire_company_title() {
		return hire_company_title;
	}

	public void setHire_company_title(String hire_company_title) {
		this.hire_company_title = hire_company_title;
	}

	public String getHire_position() {
		return hire_position;
	}

	public void setHire_position(String hire_position) {
		this.hire_position = hire_position;
	}

	public String getHire_prefer() {
		return hire_prefer;
	}

	public void setHire_prefer(String hire_prefer) {
		this.hire_prefer = hire_prefer;
	}

	public String getHire_prefer_content() {
		return hire_prefer_content;
	}

	public void setHire_prefer_content(String hire_prefer_content) {
		this.hire_prefer_content = hire_prefer_content;
	}

	public String getHire_edu() {
		return hire_edu;
	}

	public void setHire_edu(String hire_edu) {
		this.hire_edu = hire_edu;
	}

	public String getHire_gender() {
		return hire_gender;
	}

	public void setHire_gender(String hire_gender) {
		this.hire_gender = hire_gender;
	}

	public String getHire_salary() {
		return hire_salary;
	}

	public void setHire_salary(String hire_salary) {
		this.hire_salary = hire_salary;
	}

	public String getHire_age() {
		return hire_age;
	}

	public void setHire_age(String hire_age) {
		this.hire_age = hire_age;
	}

	public String getHire_sector() {
		return hire_sector;
	}

	public void setHire_sector(String hire_sector) {
		this.hire_sector = hire_sector;
	}

	public String getHire_addr() {
		return hire_addr;
	}

	public void setHire_addr(String hire_addr) {
		this.hire_addr = hire_addr;
	}

	public String getHire_latitude() {
		return hire_latitude;
	}

	public void setHire_latitude(String hire_latitude) {
		this.hire_latitude = hire_latitude;
	}

	public String getHire_longitude() {
		return hire_longitude;
	}

	public void setHire_longitude(String hire_longitude) {
		this.hire_longitude = hire_longitude;
	}

	public String getHire_workday() {
		return hire_workday;
	}

	public void setHire_workday(String hire_workday) {
		this.hire_workday = hire_workday;
	}

	public String getHire_worktime() {
		return hire_worktime;
	}

	public void setHire_worktime(String hire_worktime) {
		this.hire_worktime = hire_worktime;
	}

	public String getHire_startday() {
		return hire_startday;
	}

	public void setHire_startday(String hire_startday) {
		this.hire_startday = hire_startday;
	}

	public String getHire_endday() {
		return hire_endday;
	}

	public void setHire_endday(String hire_endday) {
		this.hire_endday = hire_endday;
	}

	public String getHire_mode() {
		return hire_mode;
	}

	public void setHire_mode(String hire_mode) {
		this.hire_mode = hire_mode;
	}

	public String getHire_manager_name() {
		return hire_manager_name;
	}

	public void setHire_manager_name(String hire_manager_name) {
		this.hire_manager_name = hire_manager_name;
	}

	public String getHire_manager_tel() {
		return hire_manager_tel;
	}

	public void setHire_manager_tel(String hire_manager_tel) {
		this.hire_manager_tel = hire_manager_tel;
	}

	public String getHire_manager_email() {
		return hire_manager_email;
	}

	public void setHire_manager_email(String hire_manager_email) {
		this.hire_manager_email = hire_manager_email;
	}


	public String getHire_ent_tel() {
		return hire_ent_tel;
	}


	public void setHire_ent_tel(String hire_ent_tel) {
		this.hire_ent_tel = hire_ent_tel;
	}
	
	

	
}
