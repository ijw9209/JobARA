package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.UserMemberDto;

@Repository
public class UserMemberDaoImpl implements UserMemberDao {
//
//	private Logger logger = (Logger) LoggerFactory.getLogger(UserMemberDaoImpl.class);
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<UserMemberDto> selectList() {
		List<UserMemberDto> list = new ArrayList<UserMemberDto>();
			
		try {
			list = sqlSession.selectList(namespace + "UserList");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("UserMemberDto SELECT LIST ERROR");
		}
			
		return list;
		
	}

	@Override
	public UserMemberDto selectOne(String id) {
		return sqlSession.selectOne(namespace + "UserOne",id);
	}

	@Override
	public int idchk(String id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace+"idchk",id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insert(UserMemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	//회원가입
	@Override
	public int regist(UserMemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "registinsert", dto);
		} catch (Exception e) {
			System.out.println("regist insert error");
			e.printStackTrace();
		}
		return res;
	}
	//기업회원 회원가입
	@Override
	public int buis_regist(UserMemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "buis_registinsert", dto);
		} catch (Exception e) {
			System.out.println("buis_regist insert error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public void newPassword(UserMemberDto dto) throws Exception {
			String password = dto.getMember_pw();
			dto.setMember_pw(password);
			sqlSession.update(namespace + "update_pw",dto);
	}

	@Override
	public String idsearch(String member_name, String member_email) {
		UserMemberDto dto = new UserMemberDto();
		dto.setMember_name(member_name);
		dto.setMember_email(member_email);
		String id = "";
		Map<String,String> map = new HashMap<String, String>();
		map.put("member_name", member_name);
		map.put("member_email", member_email);		
		try {
			id = sqlSession.selectOne(namespace + "idsearch", map);
		} catch (Exception e) {
			System.out.println("idsearch error");
			e.printStackTrace();
		}
		
		return id;
	}
}
