package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.CompanyInfoDto;

@Repository
public class CompanyInfoDaoImpl implements CompanyInfoDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int Companyinfoinsert(CompanyInfoDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace+"companyinsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("company insert error");
		}
		
		return res;
	}

	@Override
	public List<CompanyInfoDto> companylist() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"companylist");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

}
