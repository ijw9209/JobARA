package com.job.prj.model.dao;

import java.util.List;

import com.job.prj.dto.TestDto;

public interface TestDao {

	String namespace = "test.";
	
	public List<TestDto> selectList();
}
