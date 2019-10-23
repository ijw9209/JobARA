package com.job.prj.model.biz;

import java.util.List;

import com.job.prj.dto.FAQDto;

public interface FAQBiz {
	
	public List<FAQDto> selectlist();
	public FAQDto selectone(int faq_no_seq);
	public int insert(FAQDto faqDto);
	public int update(FAQDto faqDto);
	public int delete(int faq_no_seq);

}
