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
		return "companylist";
	}
}

