package com.job.prj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.dto.UserResumeCareerDto;
import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;
import com.job.prj.dto.UserResumeHopeDto;
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
	public int insertDetail(UserMemberDto memberdto,UserResumeDto resumedto,UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto,UserResumeHopeDto hopedto) {
		return dao.insert(memberdto,resumedto, resumedetaildto,resumecareerdto,hopedto);
	}

	@Override
	public int updateDetail(UserMemberDto memberdto, UserResumeDetailDto resumedetaildto,UserResumeDto resumedto,UserResumeCareerDto resumecareerdto,UserResumeHopeDto hopedto) {
		return dao.updateDetail(memberdto,resumedetaildto, resumedto,resumecareerdto,hopedto);
	} 

	@Override
	public int deleteResumeDetail(UserResumeDto dto) {
		return dao.deleteResumeDetail(dto);
	}

	@Override
	public UserResumeDetailDto selectOne(int member_no_seq) {
		// TODO Auto-generated method stub
		return dao.selectOne(member_no_seq);
	}

	@Override
	public List<UserResumeDetailDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public List<UserResumeDetailDto> resumePaging(int start, int end) {
		// TODO Auto-generated method stub
		return dao.resumePaging(start, end);
	}

}
