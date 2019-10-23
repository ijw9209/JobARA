package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.CustomerServiceDto;

@Repository
public class CustomerServiceDaoImpl implements CustomerServiceDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	//문의사항 목록
	@Override
	public List<CustomerServiceDto> selectlist() {
		List<CustomerServiceDto> list = new ArrayList<CustomerServiceDto>();
		
		try {
			list = sqlSession.selectList(namespace + "selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//문의사항 글보기
	@Override
	public CustomerServiceDto selectone(int customer_no_seq) {
		CustomerServiceDto dto = sqlSession.selectOne(namespace + "selectone", customer_no_seq);
		return dto;
	}

	//문의사항 글쓰기
	@Override
	public int insert(CustomerServiceDto CustomerDto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace + "insert", CustomerDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	//문의사항 수정
	@Override
	public int update(CustomerServiceDto CustomerDto) {
		int res = sqlSession.update(namespace + "update", CustomerDto);
		return res;
	}

	@Override
	public int delete(int customer_no_seq) {
		int res = sqlSession.delete(namespace + "delete", customer_no_seq);
		return res;
	}

}
