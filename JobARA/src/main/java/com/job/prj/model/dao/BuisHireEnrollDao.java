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
	//채용공고 갯수 카운트
	public int count_buis_hire_enroll(int member_no_seq);
	public List<BuisHireEnrollDto> myselectList(int member_no_seq);

}
