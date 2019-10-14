package com.job.prj.model.biz;

import java.util.List;

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

	@Override
	public List<CompanyInfoDto> companylist() {
		return dao.companylist();
	}

	@Override
	public List<CompanyInfoDto> category_1_list() {
		// TODO Auto-generated method stub
		return dao.category_1_list();
	}

	@Override
	public List<CompanyInfoDto> category_2_list() {
		return dao.category_2_list();
	}

	@Override
	public List<CompanyInfoDto> category_3_list() {
		return dao.category_3_list();
	}

	@Override
	public List<CompanyInfoDto> category_4_list() {
		// TODO Auto-generated method stub
		return dao.category_4_list();
	}

	@Override
	public List<CompanyInfoDto> category_5_list() {
		// TODO Auto-generated method stub
		return dao.category_5_list();
	}

	@Override
	public List<CompanyInfoDto> category_6_list() {
		// TODO Auto-generated method stub
		return dao.category_6_list();
	}

	@Override
	public List<CompanyInfoDto> category_7_list() {
		// TODO Auto-generated method stub
		return dao.category_7_list();
	}

	@Override
	public List<CompanyInfoDto> category_8_list() {
		// TODO Auto-generated method stub
		return dao.category_8_list();
	}

	@Override
	public List<CompanyInfoDto> category_9_list() {
		return dao.category_9_list();
	}

	@Override
	public List<CompanyInfoDto> category_10_list() {
		return dao.category_10_list();
	}

	@Override
	public CompanyInfoDto company_detail(int company_no_seq) {
		return dao.company_detail(company_no_seq);
	}

}
