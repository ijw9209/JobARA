package com.job.prj.model.dao;

import java.util.List;

import com.job.prj.dto.CompanyInfoDto;

public interface CompanyInfoDao {

	String namespace = "Company.";
	
	public int Companyinfoinsert(CompanyInfoDto dto);
	public List<CompanyInfoDto> companylist();
	//회사 카테고리
	public List<CompanyInfoDto> category_1_list();
	public List<CompanyInfoDto> category_2_list();
	public List<CompanyInfoDto> category_3_list();
	public List<CompanyInfoDto> category_4_list();
	public List<CompanyInfoDto> category_5_list();
	public List<CompanyInfoDto> category_6_list();
	public List<CompanyInfoDto> category_7_list();
	public List<CompanyInfoDto> category_8_list();
	public List<CompanyInfoDto> category_9_list();
	public List<CompanyInfoDto> category_10_list();
	
	//회사상세
	public CompanyInfoDto company_detail(int company_no_seq);
}
