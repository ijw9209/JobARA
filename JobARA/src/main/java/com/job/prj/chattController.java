package com.job.prj;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.prj.dto.UserMemberDto;

@Controller
public class chattController {

	@RequestMapping(value = "/chat.do")
	public String chatt(Model model) {
		
		 Object principal =
				 SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				 UserMemberDto usermember = (UserMemberDto) principal;
				 System.out.println(usermember.getMember_id());
				 
				 String id = usermember.getMember_id();
				 
				 model.addAttribute("id",id);
		
		return "chatt";
	}
	
}
