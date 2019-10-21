package com.job.prj.model.dao;

import java.util.List;

import com.job.prj.dto.BuisHireEnrollDto;
import com.job.prj.dto.CompanyInfoDto;

public interface BuisHireEnrollDao {
	
	String namespace = "BuisHireEnroll.";
	
	public int insert(BuisHireEnrollDto dto);
	public List<BuisHireEnrollDto> selectList();
	public BuisHireEnrollDto selectOne(int hire_no_seq);
	public CompanyInfoDto company(int member_no_seq);

}
