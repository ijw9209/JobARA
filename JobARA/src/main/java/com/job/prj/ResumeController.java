package com.job.prj;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.security.Principal;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.job.prj.dto.UserMemberDto;
import com.job.prj.dto.UserResumeCareerDto;
import com.job.prj.dto.UserResumeDetailDto;
import com.job.prj.dto.UserResumeDto;
import com.job.prj.dto.UserResumeHopeDto;
import com.job.prj.model.biz.UserMemberBiz;
import com.job.prj.model.biz.UserResumeBiz;
import com.job.prj.model.biz.UserResumeDetailBiz;
import com.job.prj.model.validate.UploadFile;

@Controller
public class ResumeController {

	@Autowired
	private UserResumeBiz UserResumeBiz;
	@Autowired
	private UserResumeDetailBiz resumedetailbiz;
	@Autowired
	private UserResumeBiz resumebiz;
	@Autowired
	private UserMemberBiz memberbiz;
	
	
	


	@RequestMapping(value = "/user/deleteResumeDetail.do")
	public String deleteResume(Authentication authentication,UserResumeDetailDto dto,int member_no_seq,UserResumeDto resumedto, Model model) {
		UserMemberDto memberdto = (UserMemberDto) authentication.getPrincipal();
		
		int res = resumedetailbiz.deleteResumeDetail(resumedto);
		if (res > 0) {
			model.addAttribute("list", resumebiz.resumeList(member_no_seq));

			model.addAttribute("seq", memberdto.getMember_no_seq());
			return "redirect:/user/userpage";

		} else {

			model.addAttribute("selectOneResume", resumedetailbiz.ResumeOne(dto));

			return "resumeDetail";

		}

	}

	@RequestMapping(value = "/user/updateResumeres.do", method = RequestMethod.GET)
	public String updateDetail(Authentication authentication,UserResumeDetailDto dto, Model model) {
		UserMemberDto memberdto = (UserMemberDto) authentication.getPrincipal();
		String id=memberdto.getMember_id();
		model.addAttribute("seq", memberdto.getMember_no_seq());
		model.addAttribute("selectOneResume", resumedetailbiz.ResumeOne(dto));
		model.addAttribute("memberresume", memberbiz.selectOne(id));
		return "resumeDetail_update";
	}

	@RequestMapping(value = "/user/updateDetailres.do", method = RequestMethod.POST)
	public String updateDetailRes(Authentication authentication,UserMemberDto memberdto,UserResumeDetailDto dto,UserResumeDto resumedto, UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto,
			Model model,UserResumeHopeDto hopedto) {
		System.out.println(dto.getResume_photo() + dto.getResume_crti_one_name());
		int res = resumedetailbiz.updateDetail(memberdto,resumedetaildto, resumedto,resumecareerdto,hopedto);
		if (res > 0) {

			model.addAttribute("selectOneResume", resumedetailbiz.ResumeOne(resumedetaildto));

			memberdto = (UserMemberDto) authentication.getPrincipal();
			String id=memberdto.getMember_id();
			model.addAttribute("seq", memberdto.getMember_no_seq());
			model.addAttribute("selectOneResume", resumedetailbiz.ResumeOne(dto));
			model.addAttribute("memberresume", memberbiz.selectOne(id));
			
			return "resumeDetail";

		} else {
			System.out.println("RESUMEDETAIL ERROR");
			return "resumeDetail_update";
		}

	}

	@RequestMapping(value = "/user/ResumeInsert.do",method = RequestMethod.GET)
	public String ResumeDetailInsert(Authentication authentication, Model model) {
		UserMemberDto dto = (UserMemberDto) authentication.getPrincipal();
		
		dto = (UserMemberDto) authentication.getPrincipal();
		String id=dto.getMember_id();
		model.addAttribute("seq", dto.getMember_no_seq());
		model.addAttribute("memberresume", memberbiz.selectOne(id));
		return "resumeDetail_Insert";
	}

	@RequestMapping(value = "/user/ResumeDetailInsertRes.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String ResumeDetailInsertRes(Authentication authentication,UserMemberDto memberdto,UserResumeDto resumedto, UserResumeDetailDto resumedetaildto,UserResumeCareerDto resumecareerdto,UserResumeHopeDto hopedto, Model model) {
		System.out.println("lkfgnslglskdglkjfdslkjfdslkjfsdkljfsd");
		int res = resumedetailbiz.insertDetail(memberdto,resumedto, resumedetaildto,resumecareerdto,hopedto);
		UserMemberDto dto = (UserMemberDto) authentication.getPrincipal();
		int member_no_seq= dto.getMember_no_seq();

		if (res > 0) {

			model.addAttribute("list", resumebiz.resumeList(member_no_seq));
			model.addAttribute("seq", dto.getMember_no_seq());
			System.out.println("INSERT SUCCESS");
			
			return "redirect:/user/userpage";
			//return "redirect:form.do?member_no_seq="+dto.getMember_no_seq();
		} else {
			System.out.println("INSERT ERROR");
			model.addAttribute("seq", dto.getMember_no_seq());
			
			return "resumeDetail_Insert";
		}

	}

	@RequestMapping(value = "/selectOneResume.do", method = RequestMethod.GET)
	public String ResumeOne(Authentication authentication, UserResumeDetailDto dto, Model model, Principal account) {
		
			if(account != null) {
				// 시큐리티 컨텍스트 객체를 얻습니다. 
				  SecurityContext context = SecurityContextHolder.getContext(); 
				  // 인증 객체를 얻습니다. 
				  authentication = context.getAuthentication(); 
				  // 사용자가 가진 모든 롤 정보를 얻습니다. 
				  Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); 
				  Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
				  while (iter.hasNext()) { 
					  GrantedAuthority auth = iter.next(); 
					  model.addAttribute("role",auth.getAuthority());
					 }
			}
		
		UserMemberDto memberdto = (UserMemberDto) authentication.getPrincipal();
		String id=memberdto.getMember_id();
		model.addAttribute("seq", memberdto.getMember_no_seq());
		model.addAttribute("selectOneResume", resumedetailbiz.ResumeOne(dto));
		model.addAttribute("memberresume", memberbiz.selectOne(id));
		
		return "resumeDetail";
	}

	@RequestMapping(value = "/user/form.do", method = RequestMethod.GET)
	public String ResumeList(Authentication authentication,int member_no_seq,HttpServletRequest request,Model model) {
		
		UserMemberDto dto = (UserMemberDto) authentication.getPrincipal();
		model.addAttribute("seq", dto.getMember_no_seq());
		model.addAttribute("list", UserResumeBiz.resumeList(member_no_seq));
		System.out.println("LISTSUCCESS");
		return "resumeList";
	}

	@RequestMapping("/user/uploadform.do")
	public String getUploadForm(Authentication authentication,Model model) {
		UserMemberDto dto = (UserMemberDto) authentication.getPrincipal();
		model.addAttribute("seq", dto.getMember_no_seq());
		
		return "fileuploadform";
	}
	
	///////////
	@RequestMapping(value="/user/upload.do", method = RequestMethod.POST)
	public String uploadddddd(UploadFile uploadfile, HttpServletRequest request) {
		
		request.setAttribute("uploadfile", uploadfile);
		
		return "fileuploadjs";
	}
	@RequestMapping(value = "/user/school.do" , method = RequestMethod.GET , produces = "application/text; charset=utf8")
	@ResponseBody
	public String school(@RequestParam String gubun) throws IOException{
		
		String urlstr = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=ecbe51d25f987df16eed422be9f153f0&svcType=api&svcCode=SCHOOL&contentType=json&gubun="+ gubun + "&thisPage=1&perPage=12000";
		URL url = new URL(urlstr);
		
		BufferedReader bf;
		
		String line = "";
		String result = "";
		
		bf = new BufferedReader(new InputStreamReader(url.openStream()));
		
		 while((line = bf.readLine()) != null) {
			  result = result.concat(line);
		}
		 
		 JsonParser parser = new JsonParser();
		 JsonElement element = parser.parse(result);
		 String list_schoolname = "";
		 
		 JsonElement dataSearch = element.getAsJsonObject().get("dataSearch");
		 
		 for(int i = 0; i < dataSearch.getAsJsonObject().get("content").getAsJsonArray().size(); i++) {
			 
			 JsonElement schoolName = dataSearch.getAsJsonObject().get("content").getAsJsonArray().get(i).getAsJsonObject().get("schoolName");
			 String api_schoolname = schoolName.getAsString();
			 
			 if(i == dataSearch.getAsJsonObject().get("content").getAsJsonArray().size() -1 ) {
				 list_schoolname += api_schoolname;
			 } else {
				 list_schoolname += api_schoolname + "/";
			 }
		 }
		 
		 String schoolname = list_schoolname;
		return schoolname;
	}
	

	@RequestMapping(value = "/buis/resumeview")
	public String resumeviewform(Model model,@RequestParam int page) {
		
		
		//int page = Integer.parseInt(page); //현재페이징번호
		int allCount = resumedetailbiz.selectList().size(); //전체게시글개수
		int listCount = 5; //한 화면에 뿌릴 데이터 개수
		int totalPage = (allCount -1) / listCount + 1; // 전체 페이지 개수
		int blockCount = 5;  // 이동을 위한 페이지 표시에 나타나는 숫자의 표시 갯수( 예 [1] [2] [3])
		int absolutePage = 0; // 페이지를 넘겼을 때 시작되는 첫번째 게시물의 시작 번호
		int endPage = 0;  // 페이지 마지막 번호
		
		if(page < 1) {
			page = 1;
			
		}else if(page > totalPage) {
			page = totalPage;
		}
		if(page%5 == 0) {
			absolutePage = ((page/5) *5) -4;
			endPage = (page / 5) * 5;
			
		}else {
			absolutePage = ((page /5) *5)+1;
			endPage = ((page/5) * 5) + 5;
		}
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
						
		int start = (page - 1)*listCount +1;
		int end = page * listCount;
		List<UserResumeDetailDto> list = resumedetailbiz.resumePaging(start, end);
		model.addAttribute("resume_list",list);
		model.addAttribute("page", page);
		model.addAttribute("blockCount", blockCount);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("absolutePage", absolutePage);
		model.addAttribute("endPage", endPage);
		
		return "resumeView";
	}

}
