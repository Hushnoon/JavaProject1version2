package com.ali.javaproject1.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ali.javaproject1.backend.dao.CategoryDao;
import com.ali.javaproject1.backend.dao.ProductDao;
import com.ali.javaproject1.backend.model.Product;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProductDao productDao;
	
	@GetMapping("/category/{id}/products")
	public ModelAndView getCategories(@PathVariable("id")int id)
	{
		ModelAndView mv=new ModelAndView("index");
		mv.addObject("catid",id);
		mv.addObject("userClickProducts",true);
		return mv;
	}
	
	@GetMapping("/product/showby/category/{id}")
	@ResponseBody
	public Set<Product> getProducts(@PathVariable("id")int id)
	{
		return (categoryDao.getCategory(id)).getProducts();
	}
	
}
