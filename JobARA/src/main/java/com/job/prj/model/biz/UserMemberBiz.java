package com.job.prj.model.biz;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.job.prj.dto.UserMemberDto;

public interface UserMemberBiz extends UserDetailsService {

	public List<UserMemberDto> selectList();
	public int idchk(String id);
	public int insert(UserMemberDto dto);
	public int regist(UserMemberDto dto);
	public int buis_regist(UserMemberDto dto);
	//아이디찾기
	public String idsearch(String member_name,String member_email);
	//회원번호 검색용(기업회원)
	public int noSelectOne(String id);
	//유저 정보 가져오기 마이페이지용
	public UserMemberDto selectOne(String id);
	//개인정보수정
	public int updateMember(UserMemberDto dto);
	//회원탈퇴
	public int exitMember(int member_no_seq);
	
}
