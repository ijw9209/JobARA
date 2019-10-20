package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;

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

	@Override
	public List<UserResumeDetailDto> selectList(int member_no_seq) {
		
		List<UserResumeDetailDto> list = new ArrayList<UserResumeDetailDto>();
		
		try {
			list = sqlSession.selectList(namespace + "resumeDetailList", member_no_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
