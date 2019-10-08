package com.job.prj.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.model.dao.UserMemberDao;

@Service
public class EmailbizImpl implements Emailbiz {

	@Autowired
	UserMemberDao dao;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public void newPassword(UserMemberDto dto) throws Exception {
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		dao.newPassword(dto);
		
	}

}
