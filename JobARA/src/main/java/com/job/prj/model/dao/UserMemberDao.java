package com.job.prj.model.dao;

import java.util.List;

import com.job.prj.dto.UserMemberDto;

public interface UserMemberDao {

	String namespace = "UserMember.";
	
	public List<UserMemberDto> selectList();
	public UserMemberDto selectOne(String id);
	public int idchk(String id);
	public int insert(UserMemberDto dto);
	//회원가입
	public int regist(UserMemberDto dto);
	//기업회원 회원가입
	public int buis_regist(UserMemberDto dto);
	
	public void newPassword(UserMemberDto dto) throws Exception;
}
