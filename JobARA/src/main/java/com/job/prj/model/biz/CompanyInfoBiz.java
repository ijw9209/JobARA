package com.job.prj.model.biz;


import java.util.List;

import com.job.prj.dto.CompanyInfoDto;



public interface CompanyInfoBiz {
	//회사 정보입력
	public int Companyinfoinsert(CompanyInfoDto dto);
	//회사 리스트
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
	//회사 상세
	public CompanyInfoDto company_detail(int company_no_seq);
	
	//회사주소 조인
	public String company_addr(int company_no_seq);
	
}
