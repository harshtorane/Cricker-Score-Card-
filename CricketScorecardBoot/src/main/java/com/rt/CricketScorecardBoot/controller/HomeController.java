package com.rt.CricketScorecardBoot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String hello() {
        return "register"; // JSP path: /WEB-INF/views/register.jsp
    }

    @RequestMapping("/checkOTP")
    public String otp() {
        return "verify"; // JSP path: /WEB-INF/views/verify.jsp
    }
}
