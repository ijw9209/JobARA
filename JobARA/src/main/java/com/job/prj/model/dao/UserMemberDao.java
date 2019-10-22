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
	
	//아이디찾기
	public String idsearch(String member_name,String member_email);
	//회원번호 검색용(기업회원)
	public int noSelectOne(String id);
	//개인정보 수정
	public int updateMember(UserMemberDto dto);
	
	//회원탈퇴
	public int exitMember(int member_no_seq);
}
