package com.job.prj.model.biz;

import java.util.List;

import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;

public interface UserResumeBiz {

	//이력서 갯수
	public int countresume(int member_no_seq);
	//이력서 리스트
	public List<UserResumeDetailDto> selectList(int member_no_seq);
	
	public List<UserResumeDto> resumeList(int member_no_seq);
	public int resumeInsert(UserResumeDto resumedto);
}
