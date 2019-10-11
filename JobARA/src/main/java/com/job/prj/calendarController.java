package com.job.prj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class calendarController {

	
	 @RequestMapping("/calendar.do")
	  public String calendar() {
		  return "calendar";
	  }
}
