package com.job.prj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.model.dao.UserMemberDao;

@Service
public class UserMemberBizImpl implements UserMemberBiz,UserDetailsService {

	@Autowired
	private UserMemberDao dao;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public List<UserMemberDto> selectList() {
		return dao.selectList();
	}

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		UserMemberDto dto = dao.selectOne(id);
		System.out.println("dto 는 : " + dto);
		if(dto == null) {
			System.out.println("loadUserByUsername : not existed user");
			throw new UsernameNotFoundException("login fail");
		}
		
		return dto;
	}

	@Override
	public int idchk(String id) {
		
		return dao.idchk(id);
	}

	@Override
	public int insert(UserMemberDto dto) {
		dto.setMember_pw(passwordEncoder.encode(dto.getPassword()));
		return dao.insert(dto);
	}

	@Override
	public int regist(UserMemberDto dto) {
		dto.setMember_pw(passwordEncoder.encode(dto.getPassword()));
		return dao.regist(dto);
	}

	@Override
	public int buis_regist(UserMemberDto dto) {
		System.out.println("호출111");
		dto.setMember_pw(passwordEncoder.encode(dto.getPassword()));
		return dao.buis_regist(dto);
	}

	@Override
	public String idsearch(String member_name, String member_email) {
		return dao.idsearch(member_name, member_email);
	}

	@Override
	public int noSelectOne(String id) {
		// TODO Auto-generated method stub
		return dao.noSelectOne(id);
	}

	@Override
	public UserMemberDto selectOne(String id) {
		return dao.selectOne(id);
	}

	@Override
	public int updateMember(UserMemberDto dto) {
		return dao.updateMember(dto);
	}

	@Override
	public int exitMember(int member_no_seq) {
		// TODO Auto-generated method stub
		return dao.exitMember(member_no_seq);
	}

	@Override
	public int cnt_1_usermember() {
		
		return dao.cnt_1_usermember();
	}

	@Override
	public int cnt_2_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_2_usermember();
	}

	@Override
	public int cnt_3_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_3_usermember();
	}

	@Override
	public int cnt_4_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_4_usermember();
	}

	@Override
	public int cnt_5_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_5_usermember();
	}

	@Override
	public int cnt_6_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_6_usermember();
	}

	@Override
	public int cnt_7_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_7_usermember();
	}

	@Override
	public int cnt_8_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_8_usermember();
	}

	@Override
	public int cnt_9_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_9_usermember();
	}

	@Override
	public int cnt_10_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_10_usermember();
	}

	@Override
	public int cnt_11_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_11_usermember();
	}

	@Override
	public int cnt_12_usermember() {
		// TODO Auto-generated method stub
		return dao.cnt_12_usermember();
	}

	@Override
	public int cnt_1_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_1_buismember();
	}

	@Override
	public int cnt_2_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_2_buismember();
	}

	@Override
	public int cnt_3_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_3_buismember();
	}

	@Override
	public int cnt_4_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_4_buismember();
	}

	@Override
	public int cnt_5_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_5_buismember();
	}

	@Override
	public int cnt_6_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_6_buismember();
	}

	@Override
	public int cnt_7_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_7_buismember();
	}

	@Override
	public int cnt_8_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_8_buismember();
	}

	@Override
	public int cnt_9_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_9_buismember();
	}

	@Override
	public int cnt_10_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_10_buismember();
	}

	@Override
	public int cnt_11_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_11_buismember();
	}

	@Override
	public int cnt_12_buismember() {
		// TODO Auto-generated method stub
		return dao.cnt_12_buismember();
	}
	

}
