package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.BuisHireEnrollDto;
import com.job.prj.dto.CompanyInfoDto;
import com.job.prj.dto.UserMemberDto;

@Repository
public class BuisHireEnrollDaoImpl implements BuisHireEnrollDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
		
	@Override
	public int insert(BuisHireEnrollDto dto) {
		
		
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "announcementinsert",dto);
			System.out.println(res);
			
		} catch (Exception e) {
			System.out.println("INSERT ERROR");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<BuisHireEnrollDto> selectList() {
		
		List<BuisHireEnrollDto> list = new ArrayList<BuisHireEnrollDto>();
		
		try {
			list = sqlSession.selectList(namespace + "seleclist");
			
		} catch (Exception e) {
			System.out.println("SELECTLIST ERROR");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BuisHireEnrollDto selectOne(int hire_no_seq) {
		
		return sqlSession.selectOne(namespace + "selectOne",hire_no_seq);
	}

	@Override
	public CompanyInfoDto company(int member_no_seq) {
		return sqlSession.selectOne(namespace + "company",member_no_seq);
	}

	@Override
	public int count_buis_hire_enroll(int member_no_seq) {
		int cnt = 0;
		
		try {
			cnt = sqlSession.selectOne(namespace + "cnt_hire_enroll", member_no_seq);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return cnt;
	}

	@Override
	public List<BuisHireEnrollDto> myselectList(int member_no_seq) {
		
		List<BuisHireEnrollDto> list = new ArrayList<BuisHireEnrollDto>();
		
		try {
			list = sqlSession.selectList(namespace + "myselectList", member_no_seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
