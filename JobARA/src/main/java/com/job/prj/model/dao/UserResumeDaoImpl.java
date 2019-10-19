package com.job.prj.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class UserResumeDaoImpl implements UserResumeDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countresume(int member_no_seq) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace +"countresume", member_no_seq);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("countresume error");
		}
		
		return res;
	}

}
