package com.job.prj.model.dao;

import java.util.List;

import com.job.prj.dto.CompanyInfoDto;

public interface CompanyInfoDao {

	String namespace = "Company.";
	
	public int Companyinfoinsert(CompanyInfoDto dto);
	public List<CompanyInfoDto> companylist();
}
