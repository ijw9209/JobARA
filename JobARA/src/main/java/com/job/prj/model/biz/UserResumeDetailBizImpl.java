package com.job.prj.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.dto.UserResumeCareerDto;
import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;
import com.job.prj.model.dao.UserResumeDetailDao;

@Service
public class UserResumeDetailBizImpl implements UserResumeDetailBiz{
	
	@Autowired
	private UserResumeDetailDao dao;

	@Override
	public UserResumeDto ResumeOne(UserResumeDetailDto dto) {
		
		
		return dao.ResumeOne(dto);
	}

	@Override
	public int insertDetail(UserMemberDto memberdto,UserResumeDto resumedto,UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto) {
		return dao.insert(memberdto,resumedto, resumedetaildto,resumecareerdto);
	}

	@Override
	public int updateDetail(UserMemberDto memberdto, UserResumeDetailDto resumedetaildto,UserResumeDto resumedto,UserResumeCareerDto resumecareerdto) {
		return dao.updateDetail(memberdto,resumedetaildto, resumedto,resumecareerdto);
	} 

	@Override
	public int deleteResumeDetail(UserResumeDto dto) {
		return dao.deleteResumeDetail(dto);
	}

}
