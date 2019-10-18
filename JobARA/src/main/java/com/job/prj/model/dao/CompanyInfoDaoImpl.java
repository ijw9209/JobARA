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
	
	@Override
	public List<CompanyInfoDto> category_1_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_1_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_2_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_2_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_3_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_3_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_4_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_4_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_5_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_5_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_6_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_6_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_7_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_7_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_8_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_8_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_9_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_9_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public List<CompanyInfoDto> category_10_list() {
		List<CompanyInfoDto> list = new ArrayList<CompanyInfoDto>();
		
		try {
			list = sqlSession.selectList(namespace+"category_10_list");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("companylist error");
		}
		
		return list;
	}

	@Override
	public CompanyInfoDto company_detail(int company_no_seq) {
		CompanyInfoDto dto = new CompanyInfoDto();
		
		try {
			dto = sqlSession.selectOne(namespace +"company_detail", company_no_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public String company_addr(int company_no_seq) {
		String addr = "";
		
		try {
			addr = sqlSession.selectOne(namespace + "company_addr", company_no_seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return addr;
	}
	
}
