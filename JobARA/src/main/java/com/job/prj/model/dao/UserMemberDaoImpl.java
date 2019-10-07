package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.List;

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
		System.out.println(id);
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

}
