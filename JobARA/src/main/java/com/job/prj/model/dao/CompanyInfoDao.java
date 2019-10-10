package com.job.prj.model.dao;

import com.job.prj.dto.CompanyInfoDto;

public interface CompanyInfoDao {

	String namespace = "Company.";
	
	public int Companyinfoinsert(CompanyInfoDto dto);
}
