package com.job.prj.model.dao;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.dto.UserResumeCareerDto;
import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;

public interface UserResumeDetailDao {
	
	String namespace="UserResumeDetail.";
	public UserResumeDto ResumeOne(UserResumeDetailDto dto);
	public int insert(UserMemberDto memberdto,UserResumeDto resumedto,UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto);
	public int updateDetail(UserMemberDto memberdto,UserResumeDetailDto resumedetaildto,UserResumeDto resumedto,UserResumeCareerDto resumecareerdto);
	public int deleteResumeDetail(UserResumeDto dto);
}
