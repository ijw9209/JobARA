package com.job.prj.model.dao;

import java.util.List;

import com.job.prj.dto.UserResumeDetailDto;

public interface UserResumeDao {

	String namespace = "UserResume.";
	//이력서 갯수
	public int countresume(int member_no_seq);
	
	//이력서 리스트
	public List<UserResumeDetailDto> selectList(int member_no_seq);
	
}
