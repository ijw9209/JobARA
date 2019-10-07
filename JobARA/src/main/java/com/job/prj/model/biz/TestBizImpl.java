package com.job.prj.model.biz;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.dto.TestDto;
import com.job.prj.model.dao.TestDaoImpl;

@Service
public class TestBizImpl implements TestBiz {

	@Autowired
	private TestDaoImpl TestDaoImpl;
	
	@Override
	public List<TestDto> selectList() {
		// TODO Auto-generated method stub
		return TestDaoImpl.selectList();
	}

}
