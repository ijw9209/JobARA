package com.job.prj.model.biz;


import java.util.List;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.dto.UserResumeCareerDto;
import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;
import com.job.prj.dto.UserResumeHopeDto;

public interface UserResumeDetailBiz {
	
	
	public UserResumeDto ResumeOne(UserResumeDetailDto dto);
	public int insertDetail(UserMemberDto memberdto,UserResumeDto resumedto,UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto,UserResumeHopeDto hopedto);
	public int updateDetail(UserMemberDto memberdto,UserResumeDetailDto resumedetaildto,UserResumeDto resumedto,UserResumeCareerDto resumecareerdto,UserResumeHopeDto hopedto);
	public int deleteResumeDetail(UserResumeDto dto);
	//유저 이력서 상세 이미지꺼내요기
	public UserResumeDetailDto selectOne(int member_no_seq);
	//이력서 리스트
	public List<UserResumeDetailDto> selectList();
	//이력서 페이징
	public List<UserResumeDetailDto> resumePaging(int start, int end);
	
}
