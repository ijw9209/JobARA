package com.job.prj;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job.prj.dto.UserMemberDto;
import com.job.prj.model.biz.UserMemberBiz;

@Controller
public class BuisMemberController {

	@Autowired
	private UserMemberBiz UserMemberBiz;
	//기업회원 회원가입 폼
	@RequestMapping(value = "/buisregistform")
	public String buisregistform() {
		return "buis_registform";
	}
	@RequestMapping(value="/registtwo", method = {RequestMethod.POST,RequestMethod.GET})
	public String buisregist(UserMemberDto dto,Model model) {
		UserMemberBiz.buis_regist(dto);
		return "login";
	}
	
	@RequestMapping(value = "/testte.do")
	public String test() {
		System.out.println("테스트");
		return "index";
	}
}
