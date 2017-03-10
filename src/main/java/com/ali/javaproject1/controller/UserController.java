package com.ali.javaproject1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ali.javaproject1.backend.dao.CategoryDao;
import com.ali.javaproject1.backend.dao.ProductDao;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProductDao productDao;
	
	@GetMapping("/category")
	public void getCategories()
	{
		
	}
	
	@GetMapping("/product/showby/category/{id}")
	public void getProducts(@PathVariable("id")int id)
	{
		
	}
}
