package com.job.prj;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.model.biz.UserMemberBiz;
import com.job.prj.model.biz.UserResumeBiz;

@Controller
public class MypageController {

	 @Autowired
	 private UserMemberBiz UserMemberBiz;
	 
	 @Autowired
	 private UserResumeBiz UserResumebiz;
	
	
	 @RequestMapping("/user/userpage")
	 public String userPage(Authentication authentication , Principal principal,Model model) {
	 UserMemberDto dto = UserMemberBiz.selectOne(principal.getName());
	 dto = (UserMemberDto) authentication.getPrincipal();
	 model.addAttribute("seq", dto.getMember_no_seq());
	 model.addAttribute("dto", dto);
	 model.addAttribute("countresume", UserResumebiz.countresume(dto.getMember_no_seq()));
	 model.addAttribute("resumedetail",UserResumebiz.selectList(dto.getMember_no_seq()));	
	 return "userpage";
	 }
}
