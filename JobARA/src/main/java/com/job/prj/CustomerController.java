package com.job.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job.prj.dto.CustomerServiceDto;
import com.job.prj.dto.FAQDto;
import com.job.prj.model.biz.CustomerServiceBiz;
import com.job.prj.model.biz.FAQBiz;

@Controller
public class CustomerController {
	
	@Autowired
	private FAQBiz faqBiz;
	@Autowired
	private CustomerServiceBiz CustomerBiz;
	
	@RequestMapping(value = "/customermain.do", method = RequestMethod.GET)
	public String CustomerMain() {
		return "customermain";
	}
	
	@RequestMapping(value = "/customerfaq.do", method = RequestMethod.GET)
	public String CustomerFAQ(Model model) {
		model.addAttribute("list", faqBiz.selectlist());
		return "customerfaq";
	}
	
	@RequestMapping(value = "/faqone.do", method = RequestMethod.GET)
	public String FAQOne(int faq_no_seq, Model model) {
		model.addAttribute("selectone", faqBiz.selectone(faq_no_seq));
		return "customerfaqone";
	}
	
	@RequestMapping(value = "/faqinsert.do", method = RequestMethod.GET)
	public String FAQInsert() {
		return "customerfaqinsert";
	}
	
	@RequestMapping(value = "/faqinsertres.do", method = RequestMethod.GET)
	public String FAQInsertRes(FAQDto faqDto, Model model) {
		int res = faqBiz.insert(faqDto);
		
		if(res > 0) {
			model.addAttribute("list", faqBiz.selectlist());
			return "customerfaq";
		} else {
			return "customerfaqinsert";
		}
	}
	
	@RequestMapping(value = "/faqupdate.do", method = RequestMethod.GET)
	public String FAQUpdate(int faq_no_seq, Model model) {
		model.addAttribute("selectone", faqBiz.selectone(faq_no_seq));
		return "customerfaqupdate";
	}
	
	@RequestMapping(value = "/faqupdateres.do", method = RequestMethod.GET)
	public String FAQUpdateRes(FAQDto faqDto, int faq_no_seq, Model model) {
		int res = faqBiz.update(faqDto);
		if(res > 0) {
			model.addAttribute("selectone", faqBiz.selectone(faq_no_seq));
			return "customerfaqone";
		} else {
			return "customerfaqupdate";
		}
	}
	
	@RequestMapping(value = "/faqdelete.do")
	public String FAQDelete(int faq_no_seq, Model model) {
		int res = faqBiz.delete(faq_no_seq);
		if(res > 0) {
			model.addAttribute("list", faqBiz.selectlist());
			return "customerfaq";
		} else {
			model.addAttribute("list", faqBiz.selectlist());
			return "customerfaq";
		}
	}
	
	@RequestMapping(value = "/customerservice.do", method = RequestMethod.GET)
	public String CustomerService(Model model) {
		model.addAttribute("list", CustomerBiz.selectlist());
		return "customerservice";
	}
	
	@RequestMapping(value = "/customerone.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String CustomerOne(@RequestParam int customer_no_seq, Model model) {
		model.addAttribute("selectone", CustomerBiz.selectone(customer_no_seq));
		return "customerone";
	}
	
	@RequestMapping(value = "/customerinsert.do", method = RequestMethod.GET)
	public String CustomerInsert() {
		return "customerinsert";
	}
	
	@RequestMapping(value = "/customerinsertres.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String CustomerInsertRes(CustomerServiceDto CustomerDto, Model model) {
		int res = CustomerBiz.insert(CustomerDto);
		if(res > 0) {
			model.addAttribute("list", CustomerBiz.selectlist());
			return "customerservice";
		} else {
			return "customerinsert";
		}
	}
	
	@RequestMapping(value = "/customerupdate.do", method = RequestMethod.GET)
	public String CustomerUpdate() {
		return "customerupdate";
	}
	
	@RequestMapping(value = "/customerupdateres.do", method = RequestMethod.GET)
	public String CustomerUpdateRes(CustomerServiceDto CustomerDto,int customer_no_seq , Model model) {
		int res = CustomerBiz.update(CustomerDto);
		if(res > 0) {
			model.addAttribute("selectone", CustomerBiz.selectone(customer_no_seq));
			return "customerone";
		} else {
			return "customerupdate";
		}
	}
	
	@RequestMapping(value = "/customerdelete.do")
	public String CustomerDelete(int customer_no_seq, Model model) {
		int res = CustomerBiz.delete(customer_no_seq);
		if(res > 0) {
			model.addAttribute("list", CustomerBiz.selectlist());
			return "customerservice";
		} else {
			model.addAttribute("list", CustomerBiz.selectlist());
			return "customerservice";
		}
	}
}