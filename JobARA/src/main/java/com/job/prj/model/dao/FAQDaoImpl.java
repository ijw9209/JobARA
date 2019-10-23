package com.job.prj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.job.prj.dto.FAQDto;

@Repository
public class FAQDaoImpl implements FAQDao {

	@Autowired
	@Qualifier("sqlSessionTemplate2")
	private SqlSessionTemplate sqlSession;
	
	//FAQ 리스트
	@Override
	public List<FAQDto> selectlist() {
		List<FAQDto> list = new ArrayList<FAQDto>();
		try {
			list = sqlSession.selectList(namespace + "selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//FAQ 글보기
	@Override
	public FAQDto selectone(int faq_no_seq) {
		FAQDto dto = sqlSession.selectOne(namespace + "selectone", faq_no_seq);
		return dto;
	}

	//FAQ 글쓰기
	@Override
	public int insert(FAQDto faqDto) {
		int res = sqlSession.insert(namespace + "insert", faqDto);
		
		return res;
	}
	
	//FAQ 글수정
	@Override
	public int update(FAQDto faqDto) {
		int res = sqlSession.update(namespace + "update", faqDto);
		return res;
	}

	//FAQ 글삭제
	@Override
	public int delete(int faq_no_seq) {
		int res = sqlSession.delete(namespace + "delete", faq_no_seq);
		return res;
	}

}
