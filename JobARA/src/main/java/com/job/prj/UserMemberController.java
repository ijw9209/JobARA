package com.job.prj;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.job.prj.dto.Email;
import com.job.prj.dto.UserMemberDto;
import com.job.prj.model.biz.EmailSender;
import com.job.prj.model.biz.Emailbiz;
import com.job.prj.model.biz.TestBizImpl;
import com.job.prj.model.biz.UserMemberBiz;

@Controller
public class UserMemberController {
	
	  @Autowired
	  private TestBizImpl TestBizImpl;
	  @Autowired
	  private UserMemberBiz UserMemberBiz;
	  @Autowired
	  private Email email;
	  @Autowired
	  private EmailSender emailSender;
	  @Autowired
	  private Emailbiz emailbiz;
	  
	  //로그인 화면으로 이동
	  @RequestMapping("/login.do")
	  public String login() {
		  return "login";
	  }
	  //로그아웃 페이지
	  @RequestMapping(value="/logout")
	  public String logout(Model model,String id , String password){
		  model.addAttribute("id",id);
		  model.addAttribute("pw",password);
		  return "logout";
	  }
	  //로그아웃 페이지이동후 경로
	  @RequestMapping("/logout.do")
	  public String logout() {
		  return "index";
	  }
	  
	  
	  //접근권한 없을시 보여줄화면
	  @RequestMapping("/accessDenied")
	  public String forBidden() {
			return "accessDenied";
	  }
	  //role_user 에대한 접근권한 error페이지
	  @RequestMapping("/user/error")
	  public String usererror() {
		  return "error";
	  }
	  
	  //sns로그인 
	  @RequestMapping(value = "/snslogin.do",method = RequestMethod.POST)
	  @ResponseBody
	  public Map kakaologin(UserMemberDto dto) {
		  Map<String,String> map = new HashMap<String, String>();
		  if(UserMemberBiz.idchk(dto.getMember_id()) == 0) {
			  
			  map.put("id", dto.getMember_id());
			  map.put("pw",dto.getMember_pw());
			  map.put("email", dto.getMember_email());
			  return map;
		  }else {
			  return map;
		  }
	  }
	  //네이버로그인 리다이렉트경로
	  @RequestMapping(value="/naverlogin.do",method = RequestMethod.GET)
	  public String naverlogin() {
		  return "naverlogin";
	  }
	  //sns로그인후 추가정보 입력폼
	  @RequestMapping(value="/snsplusinfo.do",method = RequestMethod.POST)
	  public String snsplusinfo(Model model,String id, String pw,String email) {
		  model.addAttribute("id",id);
		  model.addAttribute("pw",pw);
		  model.addAttribute("email",email);
		  return "snsplusinfo";
	  }
	  
	  //sns로그인후 추가정보입력후 insert
	  @RequestMapping(value="/snsplusinput.do",method = RequestMethod.POST)
	  public String snsplusinput(Model model,UserMemberDto dto) {
		  UserMemberBiz.insert(dto);
		  model.addAttribute("id",dto.getMember_id());
		  model.addAttribute("pw",dto.getMember_id());
		  return "snslogin";
	  }
	  //회원가입 폼이동
	  @RequestMapping(value="/registform")
	  public String regist() {
		  return "registform";
	  }
	  //회원가입후 바로로그인
	  @RequestMapping(value="/regist" ,method = RequestMethod.POST)
	  public String registafter(Model model, UserMemberDto dto,String member_email_addr) {
		  System.out.println(member_email_addr);
		  System.out.println("여기" + dto.getMember_email_addr());
		  UserMemberBiz.regist(dto);
		  return "login";
	  }
	  @RequestMapping(value="/idchk" ,method = {RequestMethod.POST,RequestMethod.GET})
	  @ResponseBody
	  public int idchk(String id) {
		  return UserMemberBiz.idchk(id);
	  }
	  
	  @RequestMapping(value="/findId.do",method = RequestMethod.GET)
	  public String findId() {
		  return "findId";
	  }
	  
	  @RequestMapping(value="/findPw.do",method = RequestMethod.GET)
	  public String findPw() {
		  return "findPw";
	  }
	  
	  //새 비밀번호 생성
	  @RequestMapping(value = "/newPassword.do")
	  public String newPassword(@Valid UserMemberDto memberdto, HttpSession session) throws Exception{
		  Random r = new Random();
		  int num = r.nextInt(8999)+1000;
		  String npassword = Integer.toString(num);
		  memberdto.setMember_pw(npassword);
		  emailbiz.newPassword(memberdto);
		  session.setAttribute("UserMember", memberdto);
		  email.setContent("새로운 비밀번호 " + npassword + " 입니다.");
		  email.setReceiver(memberdto.getMember_email());
		  email.setSubject("안녕하세요." + memberdto.getMember_email()+"님 재설정된 비밀번호를 확인해 주세요.");
		  
		  emailSender.SendEmail(email);
		  
		  return "findPw";
	  }
	  
	  //아이디 찾기
	  @RequestMapping(value = "/idsearch" , method = RequestMethod.POST)
	  public String idsearch(UserMemberDto dto,Model model) {
		  String id = UserMemberBiz.idsearch(dto.getMember_name(), dto.getMember_email());
		  System.out.println(id);
		  if(id != "" && id != null) { 
		  model.addAttribute("id",id);
		  return "idresult";
		  }else {
		  return "idfail";  
		  }
	  }
}
