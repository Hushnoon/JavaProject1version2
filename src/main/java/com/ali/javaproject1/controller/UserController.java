package com.ali.javaproject1.controller;

import java.security.Principal;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ali.javaproject1.backend.dao.CartDao;
import com.ali.javaproject1.backend.dao.CartItemDao;
import com.ali.javaproject1.backend.dao.CategoryDao;
import com.ali.javaproject1.backend.dao.ProductDao;
import com.ali.javaproject1.backend.dao.UserDao;
import com.ali.javaproject1.backend.model.Cart;
import com.ali.javaproject1.backend.model.CartItem;
import com.ali.javaproject1.backend.model.Product;
import com.ali.javaproject1.backend.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDao userDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CartItemDao cartItemDao;
	@Autowired
	private HttpServletRequest request;

	@GetMapping("/category/{id}/products")
	public ModelAndView getCategories(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("catid", id);
		mv.addObject("userClickProducts", true);
		return mv;
	}

	@GetMapping("/product/showby/category/{id}")
	@ResponseBody
	public Set<Product> getProducts(@PathVariable("id") int id) {
		return (categoryDao.getCategory(id)).getProducts();
	}

	@GetMapping("/add/product/toCart/{id}")
	public ModelAndView AddToCart(@PathVariable("id") int id) {
		User user;
		Principal principal = request.getUserPrincipal();

		System.out.println("User email" + principal.getName());
		user = userDao.getUserByUsername(principal.getName());

		Cart cart = (Cart) user.getCart();
		CartItem cartItem = new CartItem();
		Product product = productDao.getProduct(id);

		cartItem.setCart(cart);
		cartItem.setProduct(product);
		// On clicking Add to cart it will always add 1 unit for more user need
		// to visit "View Cart List" option
		cartItem.setQuantity(1);
		cartItem.setTotalPrice(cartItem.getQuantity() * product.getPrice());

		// Update cart table
		cart.setTotalItems(cart.getTotalItems() + 1);
		int total = (int) (cart.getGrandTotal() + cartItem.getTotalPrice());
		cart.setGrandTotal(total);
		//need to add if
		cartItemDao.add(cartItem);
		
		//Returning cartItemList to viewCart page 
		ModelAndView mv=new ModelAndView("index");
		mv.addObject("cartItemList",cart.getCartItems());
		mv.addObject("userViewCart",true);
		return mv;
	}

}
