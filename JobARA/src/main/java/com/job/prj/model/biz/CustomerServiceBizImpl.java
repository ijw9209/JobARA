package com.job.prj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.dto.CustomerServiceDto;
import com.job.prj.model.dao.CustomerServiceDao;

@Service
public class CustomerServiceBizImpl implements CustomerServiceBiz {

	@Autowired
	private CustomerServiceDao CustomerDao;
	
	@Override
	public List<CustomerServiceDto> selectlist() {
		return CustomerDao.selectlist();
	}

	@Override
	public CustomerServiceDto selectone(int customer_no_seq) {
		return CustomerDao.selectone(customer_no_seq);
	}

	@Override
	public int insert(CustomerServiceDto CustomerDto) {
		return CustomerDao.insert(CustomerDto);
	}

	@Override
	public int update(CustomerServiceDto CustomerDto) {
		return CustomerDao.update(CustomerDto);
	}

	@Override
	public int delete(int customer_no_seq) {
		return CustomerDao.delete(customer_no_seq);
	}
}
