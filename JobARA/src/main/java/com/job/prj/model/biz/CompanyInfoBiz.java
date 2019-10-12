package com.job.prj.model.biz;


import java.util.List;

import com.job.prj.dto.CompanyInfoDto;



public interface CompanyInfoBiz {
	//회사 정보입력
	public int Companyinfoinsert(CompanyInfoDto dto);
	//회사 리스트
	public List<CompanyInfoDto> companylist();
}
