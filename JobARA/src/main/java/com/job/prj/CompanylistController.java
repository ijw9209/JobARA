package com.job.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.prj.model.biz.CompanyInfoBiz;

@Controller
public class CompanylistController {

	@Autowired
	CompanyInfoBiz companyinfobiz;
	
	@RequestMapping(value = "/companylist")
	public String companylist(Model model) {
		
		model.addAttribute("list", companyinfobiz.companylist());
		model.addAttribute("cate_1_list", companyinfobiz.category_1_list());
		model.addAttribute("cate_2_list", companyinfobiz.category_2_list());
		model.addAttribute("cate_3_list", companyinfobiz.category_3_list());
		model.addAttribute("cate_4_list", companyinfobiz.category_4_list());
		model.addAttribute("cate_5_list", companyinfobiz.category_5_list());
		model.addAttribute("cate_6_list", companyinfobiz.category_6_list());
		model.addAttribute("cate_7_list", companyinfobiz.category_7_list());
		model.addAttribute("cate_8_list", companyinfobiz.category_8_list());
		model.addAttribute("cate_9_list", companyinfobiz.category_9_list());
		model.addAttribute("cate_10_list", companyinfobiz.category_10_list());
		return "companylist";
	}
	@RequestMapping(value = "/company_detail")
	public String company_detail(Model model,int company_no_seq) {
		model.addAttribute("dto",companyinfobiz.company_detail(company_no_seq));
		
		return "company_detail";
	}
}

