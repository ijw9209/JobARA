package com.job.prj;

import java.security.Principal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.model.biz.TestBizImpl;
import com.job.prj.model.biz.UserMemberBiz;


@Controller
public class HomeController {
	
	  @Autowired
	  private TestBizImpl TestBizImpl;
	  @Autowired
	  private UserMemberBiz UserMemberBiz;
	  
	  
	  @RequestMapping(value = "/")
	  public String loading() {
		  return "loading";
	  }
	  
	  
	  //인덱스 페이지 로그인후 역할에따라 유저 / 기업페이지가 바뀌어서보이게작성할것임
	  @RequestMapping(value = "/main")
	  public String index(Principal account,Model model) {
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
				  System.out.println(auth.getAuthority()); 
				  model.addAttribute("role",auth.getAuthority());
				 }

		  }
		  return "index";
	  }
	  @RequestMapping(value = "/maria.do", method = RequestMethod.GET) 
	  public String home(Model model) {
	 
	  model.addAttribute("list", TestBizImpl.selectList());
	  
	  return "maria";

	  }
	  
	  @RequestMapping(value = "/user.do", method = RequestMethod.GET)
	  public String userlist(Model model) {
			 
	  model.addAttribute("list", UserMemberBiz.selectList());
		  
	  return "user";

	  }
	
	  @RequestMapping("/buis/buispage")
	  public String buisPage() {
		  return "buispage";
	  }
	 
}
