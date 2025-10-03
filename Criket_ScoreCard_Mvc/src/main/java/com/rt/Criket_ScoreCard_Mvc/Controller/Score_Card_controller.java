package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Score_Card_controller {
	
	
	@RequestMapping("/")
	public String m1() {
		
		
		return "Login";
		
	}
	
	

}
