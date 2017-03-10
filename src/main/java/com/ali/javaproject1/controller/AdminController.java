package com.ali.javaproject1.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ali.javaproject1.backend.dao.CategoryDao;
import com.ali.javaproject1.backend.dao.ProductDao;
import com.ali.javaproject1.backend.model.Category;
import com.ali.javaproject1.backend.model.Product;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	HttpServletRequest request;

	List<Category> categoryList;
	
	// when admincontroller page will load
	@GetMapping("/category")
	public String newCategory(ModelMap model) {
		Category category = new Category();
		model.addAttribute("category", category);
		model.addAttribute("userClickCategoryAdmin", true);
		return "index";
	}

	// Accessing categories list
	@GetMapping(value = { "/all/category" })
	@ResponseBody
	public List<Category> showAll() {
		return categoryDao.listCategories();
	}

	// Adding new category
	@PostMapping("/add/category")
	public String saveCategory(@Valid @ModelAttribute("category") Category category, BindingResult result,
			ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("Category Errors:" + result.getErrorCount());
			model.addAttribute("category", category);
			model.addAttribute("userClickCategoryAdmin", true);
			return "index";
		} else {
			String fileName;
			if (category.getId() == 0) {

				// ---upload image
				fileName = UploadImage("category", category.getFile());

				// --- set the imageurl field of category model
				category.setImageUrl(fileName);

				// ---Saving data in database
				categoryDao.add(category);
			} else {
				// ---upload image
				fileName = UploadImage("category", category.getFile());

				// --- set the imageurl field of category model
				category.setImageUrl(fileName);

				// ---Saving data in database
				categoryDao.update(category);

			}
			model.addAttribute("category", new Category());
			model.addAttribute("userClickCategoryAdmin", true);
			return "index";
		}

	}

	// ------------Getting category by category id
	@GetMapping(value = { "/show/category/{id}" })
	public ModelAndView getCategoryById(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("category", categoryDao.getCategory(id));
		mv.addObject("userClickCategoryAdmin", true);
		return mv;
	}

	// ------------- Delete category
	@GetMapping(value = { "/delete/category/{id}" })
	public String deleteCategoryById(@PathVariable("id") int id) {
		if (categoryDao.delete(categoryDao.getCategory(id))) {

		}
		return "redirect:/admin/category";
	}

	// ----------------- Deafault method on /admin/product page
	@Autowired
	private ProductDao productDao;

	@GetMapping("/product")
	public String newProduct(ModelMap model) {
		
		categoryList=categoryDao.listCategories();
		Product product = new Product();
		model.addAttribute("product", product);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("userClickProductAdmin", true);
		return "index";
	}

	//------------Accessing products list
	@GetMapping(value = { "/all/product" })
	@ResponseBody
	public List<Product> showAllProduct() {
		return productDao.listProducts();
	}
	
	// ------------Add and Update product
	@PostMapping("/add/product")
	public String saveProduct(@Valid Product product, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			System.out.println("Product Errors:" + result.getErrorCount());
			model.addAttribute("product", product);
			model.addAttribute("categoryList",categoryList);
			model.addAttribute("userClickProductAdmin", true);
			return "index";
		} else {
			String fileName;
			if (product.getId() == 0) {
				
				int categoryid=product.getCategory().getId();
				System.out.println("Category Id:"+categoryid);
				Category cat=categoryDao.getCategory(categoryid);
						
				product.setCategory(cat);
				// ---upload image
				fileName = UploadImage("product", product.getFile());

				// --- set the imageurl field of product model
				product.setImageUrl(fileName);

				// ---Saving data in database
				productDao.add(product);
			} else {
				int categoryid=product.getCategory().getId();
				System.out.println("Category Id:"+categoryid);
				Category cat=categoryDao.getCategory(categoryid);
						
				product.setCategory(cat);
				// ---upload image
				fileName = UploadImage("product", product.getFile());

				// --- set the imageurl field of product model
				product.setImageUrl(fileName);

				// ---Saving data in database
				productDao.update(product);

			}
			model.addAttribute("categoryList",categoryList);
			model.addAttribute("product", new Product());
			model.addAttribute("userClickProductAdmin", true);
			return "index";
		}
	}


	// ------------Getting product by product id
	@GetMapping(value = { "/show/product/{id}" })
	public ModelAndView getProductById(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("categoryList",categoryList);
		mv.addObject("product", productDao.getProduct(id));
		mv.addObject("userClickProductAdmin", true);
		return mv;
	}

	// ------------Delete product
	@GetMapping(value = { "/delete/product/{id}" })
	public String deleteProductById(@PathVariable("id") int id) {
		if (productDao.delete(productDao.getProduct(id))) {

		}
		return "redirect:/admin/product";
	}
	
	//----------Code to upload image on server
	public String UploadImage(String imageOf, MultipartFile file) {
		try {
			// ----------Code to upload files on server
			String realPathToUploads = request.getServletContext().getRealPath("/assets/images/" + imageOf + "/");
			File folderToUpload = new File(realPathToUploads);
			if (!folderToUpload.exists()) {
				folderToUpload.mkdirs();
			}
			// MultipartFile file = category.getFile();
			String fileToUpload = realPathToUploads + file.getOriginalFilename();
			File destination = new File(fileToUpload);
			System.out.println("Entire file path is " + destination.toString());

			// ---------Uploading image on server
			file.transferTo(destination);
			return destination.getName();
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}
