package com.job.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.prj.model.biz.UserMemberBiz;

@Controller
public class AdminController {

	@Autowired
	private UserMemberBiz UserMemberBiz;
	
	
	
	@RequestMapping("/admin/adminpage")
	public String adminPage(Model model) {
			
		  model.addAttribute("cnt_1_usermember", UserMemberBiz.cnt_1_usermember());
		  model.addAttribute("cnt_2_usermember", UserMemberBiz.cnt_2_usermember());
		  model.addAttribute("cnt_3_usermember", UserMemberBiz.cnt_3_usermember());
		  model.addAttribute("cnt_4_usermember", UserMemberBiz.cnt_4_usermember());
		  model.addAttribute("cnt_5_usermember", UserMemberBiz.cnt_5_usermember());
		  model.addAttribute("cnt_6_usermember", UserMemberBiz.cnt_6_usermember());
		  model.addAttribute("cnt_7_usermember", UserMemberBiz.cnt_7_usermember());
		  model.addAttribute("cnt_8_usermember", UserMemberBiz.cnt_8_usermember());
		  model.addAttribute("cnt_9_usermember", UserMemberBiz.cnt_9_usermember());
		  model.addAttribute("cnt_10_usermember", UserMemberBiz.cnt_10_usermember());
		  model.addAttribute("cnt_11_usermember", UserMemberBiz.cnt_11_usermember());
		  model.addAttribute("cnt_12_usermember", UserMemberBiz.cnt_12_usermember());
		  
		  return "adminpage";
		  
	}
	 
	
}
