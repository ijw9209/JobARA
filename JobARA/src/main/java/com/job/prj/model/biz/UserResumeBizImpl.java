package com.job.prj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.model.dao.UserResumeDao;

@Service
public class UserResumeBizImpl implements UserResumeBiz {

	@Autowired
	UserResumeDao dao;
	
	@Override
	public int countresume(int member_no_seq) {
		return dao.countresume(member_no_seq);
	}

	@Override
	public List<UserResumeDetailDto> selectList(int member_no_seq) {
		return dao.selectList(member_no_seq);
	}

}
