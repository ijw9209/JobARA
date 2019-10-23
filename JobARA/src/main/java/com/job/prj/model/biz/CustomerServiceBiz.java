package com.job.prj.model.biz;

import java.util.List;

import com.job.prj.dto.CustomerServiceDto;

public interface CustomerServiceBiz {
	
	public List<CustomerServiceDto> selectlist();
	public CustomerServiceDto selectone(int customer_no_seq);
	public int insert(CustomerServiceDto CustomerDto);
	public int update(CustomerServiceDto CustomerDto);
	public int delete(int customer_no_seq);

}
