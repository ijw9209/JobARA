package com.job.prj.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.model.dao.UserResumeDao;

@Service
public class UserResumeBizImpl implements UserResumeBiz {

	@Autowired
	UserResumeDao dao;
	
	@Override
	public int countresume(int member_no_seq) {
		return dao.countresume(member_no_seq);
	}

}
