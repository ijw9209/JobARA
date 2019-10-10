package com.job.prj.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.dto.CompanyInfoDto;
import com.job.prj.model.dao.CompanyInfoDao;

@Service
public class CompanyInfoBizImpl implements CompanyInfoBiz {

	@Autowired
	CompanyInfoDao dao;
	
	@Override
	public int Companyinfoinsert(CompanyInfoDto dto) {
		return dao.Companyinfoinsert(dto);
	}

}
