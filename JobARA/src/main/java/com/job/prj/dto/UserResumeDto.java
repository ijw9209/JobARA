package com.job.prj.dto;

import java.util.Date;

public class UserResumeDto{
	private int resume_no_seq;
	private int member_no_seq;
	private Date resume_date;
	private UserResumeDetailDto userresumedetaildto;
	private UserResumeCareerDto careerdto;
	
	public UserResumeDto() {

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


	public Date getResume_date() {
		return resume_date;
	}

	public void setResume_date(Date resume_date) {
		this.resume_date = resume_date;
	}

	public UserResumeDetailDto getUserresumedetaildto() {
		return userresumedetaildto;
	}

	public void setUserresumedetaildto(UserResumeDetailDto userresumedetaildto) {
		this.userresumedetaildto = userresumedetaildto;
	}
	

	public UserResumeCareerDto getCareerdto() {
		return careerdto;
	}

	public void setCareerdto(UserResumeCareerDto careerdto) {
		this.careerdto = careerdto;
	}

	public UserResumeDto(int resume_no_seq, int member_no_seq, Date resume_date,
			UserResumeDetailDto userresumedetaildto, UserResumeCareerDto careerdto) {
		super();
		this.resume_no_seq = resume_no_seq;
		this.member_no_seq = member_no_seq;
		this.resume_date = resume_date;
		this.userresumedetaildto = userresumedetaildto;
		this.careerdto = careerdto;
	}
	
	
	
	
	
	
	

}
