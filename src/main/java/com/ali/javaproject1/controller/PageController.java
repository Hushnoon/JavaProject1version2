package com.ali.javaproject1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ali.javaproject1.backend.dao.CategoryDao;



@Controller
public class PageController {
	
	@Autowired
	private CategoryDao categoryDao;
	
	@RequestMapping(value="/")
	public ModelAndView index()
	{
		ModelAndView mv=new ModelAndView("index");
		mv.addObject("userClickHome",true);
		mv.addObject("cat",categoryDao.listCategories());
		//System.out.println(categoryDao.listCategories());
		return mv;
	}
	
	/*@RequestMapping(value="/login")
	public ModelAndView login()
	{
		ModelAndView mv=new ModelAndView("login");
		return mv;
	}
	
	@RequestMapping(value="/register")
	public ModelAndView register()
	{
		ModelAndView mv=new ModelAndView("register");
		return mv;
	}
	
	@RequestMapping(value="/productlist")
	public ModelAndView productList()
	{
		ModelAndView mv=new ModelAndView("product");
		return mv;
	}*/
}
