package com.job.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.job.prj.dto.CompanyInfoDto;
import com.job.prj.dto.UserMemberDto;
import com.job.prj.model.biz.CompanyInfoBiz;
import com.job.prj.model.biz.UserMemberBiz;

@Controller
public class BuisMemberController {

	@Autowired
	private UserMemberBiz UserMemberBiz;
	
	@Autowired 
	private CompanyInfoBiz CompanyInfoBiz;
	
	//기업회원 회원가입 폼
	@RequestMapping(value = "/buisregistform")
	public String buisregistform() {
		return "buis_registform";
	}
	@RequestMapping(value="/registtwo", method = {RequestMethod.POST,RequestMethod.GET})
	public String buisregist(UserMemberDto dto,Model model) {
		UserMemberBiz.buis_regist(dto);
		int no = UserMemberBiz.noSelectOne(dto.getMember_id());
		model.addAttribute("member_no_seq", no);
		return "buisplusregist";
	}
	

	//기업회원 회사정보 추가입력
	@RequestMapping(value = "/buis_plusinfo",method = {RequestMethod.POST,RequestMethod.GET})
	public String buis_plusinfo(CompanyInfoDto dto) {

		CompanyInfoBiz.Companyinfoinsert(dto);
		
		return "login";
	}
}
