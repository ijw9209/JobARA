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

	@Override
	public int noSelectOne(String id) {
		int no = 0;
		
		try {
			no = sqlSession.selectOne(namespace+"noselectOne",id);
		} catch (Exception e) {
			System.out.println("noselect one error");
			e.printStackTrace();
		}
		
		return no;
	}

	@Override
	public int updateMember(UserMemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "updateMember", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int exitMember(int member_no_seq) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace +"exitmember", member_no_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_1_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_1_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int cnt_2_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_2_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_3_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_3_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_4_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_4_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_5_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_5_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_6_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_6_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_7_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_7_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_8_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_8_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_9_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_9_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_10_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_10_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_11_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_11_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_12_usermember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_12_usermember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int cnt_1_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_1_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_2_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_2_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_3_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_3_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_4_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_4_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_5_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_5_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_6_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_6_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_7_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_7_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_8_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_8_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_9_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_9_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_10_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_10_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_11_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_11_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int cnt_12_buismember() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace + "cnt_12_buismember");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}
