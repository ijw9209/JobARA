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
	

}
