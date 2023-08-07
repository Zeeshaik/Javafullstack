package com.zeeshaik.webdemo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zeeshaik.webdemo.model.Alien;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@ModelAttribute
	public void modelData(ModelMap m) {
		m.addAttribute("name", "Aliens");
	}
	
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
//	@RequestMapping("add")
//	public ModelAndView add(@RequestParam("num1") int i, @RequestParam("num2") int j,  HttpSession session) {
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("result");
//		int num3 = i + j;
//		mv.addObject("num3", num3);
//		return mv;
//	}
//	
	
//	Using Model and Model map instead of model view controller
	@RequestMapping("add")
	public String add(@RequestParam("num1") int i, @RequestParam("num2") int j,  ModelMap m) {
		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("result");
		int num3 = i + j;
		m.addAttribute("num3", num3);
		return "result";
	}
	
//	In this we have issue, as this code we using object of alien and callin setter & getter functions.
//	@RequestMapping("addAlien")
//	public String addAlien(@RequestParam("aid") int aid, @RequestParam("aname") String aname, ModelMap m) {
//		Alien a  = new Alien();
//		a.setAid(aid);
//		a.setAname(aname);
//		
//		m.addAttribute("alien",a); 
//		return "result";
//	}
	
	//Using ModelAttribute for accessing the and sending to Alien class 
	@RequestMapping("addAlien")
	public String addAlien(@ModelAttribute("a1") Alien a) {
		return "result";
	}
	
}
