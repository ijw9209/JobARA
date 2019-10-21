package com.job.prj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.dto.BuisHireEnrollDto;
import com.job.prj.dto.CompanyInfoDto;
import com.job.prj.model.dao.BuisHireEnrollDao;

@Service
public class BuisHireEnrollBizImpl implements BuisHireEnrollBiz {
	
	@Autowired
	private BuisHireEnrollDao dao;

	@Override
	public int insert(BuisHireEnrollDto dto) {
		
		return dao.insert(dto);
	}

	@Override
	public List<BuisHireEnrollDto> selectList() {
		return dao.selectList();
	}

	@Override
	public BuisHireEnrollDto selectOne(int hire_no_seq) {
		return dao.selectOne(hire_no_seq);
	}

	@Override
	public CompanyInfoDto company(int member_no_seq) {
		return dao.company(member_no_seq);
	}


}
