package com.job.prj;


import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.job.prj.dto.BuisHireEnrollDto;
import com.job.prj.dto.CompanyInfoDto;
import com.job.prj.dto.UserMemberDto;
import com.job.prj.model.biz.BuisHireEnrollBiz;

@Controller
public class BuisHireEnrollController {

	@Autowired
	private BuisHireEnrollBiz biz;
	
	@RequestMapping("/announcement.do")
	public String announcement() {
		
		return "announcement";
	}
	
	@RequestMapping("/dutypop.do")
	public String dutypop() {
		
		return "duty";
	}
	
	@RequestMapping(value = "/announcementres.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String announcementres(BuisHireEnrollDto dto, Model model) {
		
		
		 Object principal =
		 SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 UserMemberDto usermember = (UserMemberDto) principal;
		 
		 int member_no_seq = usermember.getMember_no_seq();
		 
		 dto.setMember_no_seq(member_no_seq);
		 biz.insert(dto);
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/recruitment.do")
	public String recruit(Model model, BuisHireEnrollDto hireDto,Principal account) {
		 if(account != null) {
				// 시큐리티 컨텍스트 객체를 얻습니다. 
				  SecurityContext context = SecurityContextHolder.getContext(); 
				  // 인증 객체를 얻습니다. 
				  Authentication authentication = context.getAuthentication(); 
				  // 사용자가 가진 모든 롤 정보를 얻습니다. 
				  Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); 
				  Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
				  while (iter.hasNext()) { 
					  GrantedAuthority auth = iter.next(); 
					  model.addAttribute("role",auth.getAuthority());
					 }
		 }
		
		List<BuisHireEnrollDto> list = new ArrayList<BuisHireEnrollDto>();
		list = biz.selectList();
		model.addAttribute("list",list);
		
		return "recruitment";
		
	}
	
	@RequestMapping(value = "/recruitdetil.do", method = RequestMethod.GET)
	public String recruitdetil(@RequestParam int hire_no_seq, @RequestParam int member_no_seq, BuisHireEnrollDto dto, Model model,Principal account) {
		 if(account != null) {
				// 시큐리티 컨텍스트 객체를 얻습니다. 
				  SecurityContext context = SecurityContextHolder.getContext(); 
				  // 인증 객체를 얻습니다. 
				  Authentication authentication = context.getAuthentication(); 
				  // 사용자가 가진 모든 롤 정보를 얻습니다. 
				  Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); 
				  Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
				  while (iter.hasNext()) { 
					  GrantedAuthority auth = iter.next(); 
					  model.addAttribute("role",auth.getAuthority());
					 }
		 }
		
		BuisHireEnrollDto res = biz.selectOne(hire_no_seq);
		CompanyInfoDto res2 = biz.company(member_no_seq);
		
		model.addAttribute("hiredto",res);
		model.addAttribute("comdto",res2);
		
		return "recruitdetil";
	}
	
}