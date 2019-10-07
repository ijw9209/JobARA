package com.job.prj.model.biz;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.job.prj.dto.UserMemberDto;

public interface UserMemberBiz extends UserDetailsService {

	public List<UserMemberDto> selectList();
	public int idchk(String id);
	public int insert(UserMemberDto dto);
	public int regist(UserMemberDto dto);
}
