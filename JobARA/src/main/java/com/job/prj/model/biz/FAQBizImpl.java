package com.job.prj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.job.prj.dto.FAQDto;
import com.job.prj.model.dao.FAQDao;

@Service
public class FAQBizImpl implements FAQBiz {

	@Autowired
	private FAQDao faqDao;
	
	@Override
	public List<FAQDto> selectlist() {
		return faqDao.selectlist();
	}
	
	@Override
	public FAQDto selectone(int faq_no_seq) {
		return faqDao.selectone(faq_no_seq);
	}

	@Override
	public int insert(FAQDto faqDto) {
		return faqDao.insert(faqDto);
	}

	@Override
	public int update(FAQDto faqDto) {
		return faqDao.update(faqDto);
	}

	@Override
	public int delete(int faq_no_seq) {
		return faqDao.delete(faq_no_seq);
	}

}
