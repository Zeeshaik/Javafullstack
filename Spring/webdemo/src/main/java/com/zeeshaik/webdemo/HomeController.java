package com.zeeshaik.webdemo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
//	Fetching values using HTTP req & res 
//	@RequestMapping("add")
//	public String add(HttpServletRequest req) {
//		int i = Integer.parseInt(req.getParameter("num1"));
//		int j = Integer.parseInt(req.getParameter("num2"));
//		int num3 = i + j;
//		
//		HttpSession session = req.getSession();
//		session.setAttribute("num3", num3);
//		return "result.jsp";
//	}
	
	
	
//	Fetching values using MVC RequestParam method
//	@RequestMapping("subtract")
//	public String substract(@RequestParam("num1") int i, @RequestParam("num2") int j, HttpSession session) {
//		int num3 = i - j;
//		session.setAttribute("num3", num3);
//		return "result.jsp";
//	}
	
//	@RequestMapping("add")
//	public String add(@RequestParam("num1") int i, @RequestParam("num2") int j,  HttpSession session) {
//		int num3 = i + j;
//		session.setAttribute("num3", num3);
//		return "result.jsp";
//	}
	
//	Replacing the session with ModelView as MVS contains in which data will be available we will use that here.
	@RequestMapping("add")
	public ModelAndView add(@RequestParam("num1") int i, @RequestParam("num2") int j,  HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result");
		int num3 = i + j;
		mv.addObject("num3", num3);
		return mv;
	}
}
