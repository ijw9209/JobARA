package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.TestDto;

@Repository
public class TestDaoImpl implements TestDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate2")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<TestDto> selectList() {
			List<TestDto> list = new ArrayList<TestDto>();
		
		try {
			list = sqlSession.selectList(namespace + "TestList");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SELECT LIST ERROR");
		}
		
		return list;
	}

}
