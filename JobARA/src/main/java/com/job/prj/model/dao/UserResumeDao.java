package com.job.prj.model.dao;


public interface UserResumeDao {

	String namespace = "UserResume.";
	//이력서 갯수
	public int countresume(int member_no_seq);
}
