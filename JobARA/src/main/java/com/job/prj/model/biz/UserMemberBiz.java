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
	//어드민 가입한 유저회원정보 숫자가져오기
	public int cnt_1_usermember();
	public int cnt_2_usermember();
	public int cnt_3_usermember();
	public int cnt_4_usermember();
	public int cnt_5_usermember();
	public int cnt_6_usermember();
	public int cnt_7_usermember();
	public int cnt_8_usermember();
	public int cnt_9_usermember();
	public int cnt_10_usermember();
	public int cnt_11_usermember();
	public int cnt_12_usermember();
	//어드민 가입한 기업회원정보 숫자 가져오기
	public int cnt_1_buismember();
	public int cnt_2_buismember();
	public int cnt_3_buismember();
	public int cnt_4_buismember();
	public int cnt_5_buismember();
	public int cnt_6_buismember();
	public int cnt_7_buismember();
	public int cnt_8_buismember();
	public int cnt_9_buismember();
	public int cnt_10_buismember();
	public int cnt_11_buismember();
	public int cnt_12_buismember();
}
