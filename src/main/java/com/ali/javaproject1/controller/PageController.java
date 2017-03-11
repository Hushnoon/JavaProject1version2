package com.ali.javaproject1.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ali.javaproject1.backend.dao.CategoryDao;
import com.ali.javaproject1.backend.dao.UserDao;
import com.ali.javaproject1.backend.model.User;

@Controller
public class PageController {

	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	UserDao userDao;
	

	@RequestMapping(value = "/")
	public ModelAndView index(Principal principal) {
		if(principal!=null)
		{
			System.out.println("User email"+principal.getName());
		User user=	userDao.getUserByUsername(principal.getName());
		System.out.println("User Role"+user.getRole());
	         
		}
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("userClickHome", true);
		System.out.println("getting category list");
		mv.addObject("cat", categoryDao.listCategories());
		return mv;
	}

	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			model.addAttribute("error", "Authentication Failed - Invalid credentials!");
		}
		model.addAttribute("title", "Login");
		return "login";
	}

}
