package com.job.prj.model.biz;


import com.job.prj.dto.UserMemberDto;
import com.job.prj.dto.UserResumeCareerDto;
import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;

public interface UserResumeDetailBiz {
	
	
	public UserResumeDto ResumeOne(UserResumeDetailDto dto);
	public int insertDetail(UserMemberDto memberdto,UserResumeDto resumedto,UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto);
	public int updateDetail(UserMemberDto memberdto,UserResumeDetailDto resumedetaildto,UserResumeDto resumedto,UserResumeCareerDto resumecareerdto);
	public int deleteResumeDetail(UserResumeDto dto);
	//유저 이력서 상세 이미지꺼내요기
	public UserResumeDetailDto selectOne(int member_no_seq);
	
}
