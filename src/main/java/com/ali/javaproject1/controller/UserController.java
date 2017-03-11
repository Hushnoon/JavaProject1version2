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
		int flag = 0;

		for (CartItem item : cart.getCartItems()) {
			if ((item.getProduct()).getId() == id) {
				cartItem = item;
				flag++;
				break;
			}
		}

		if (flag == 0) {

			Product product = productDao.getProduct(id);
			cartItem.setCart(cart);
			cartItem.setProduct(product);

			// On clicking Add to cart it will always add 1 unit. For more, user
			// need to visit "View Cart List" option
			cartItem.setQuantity(1);
			cartItem.setTotalPrice(cartItem.getQuantity() * product.getPrice());

			// Update cart table
			cart.setTotalItems(cart.getTotalItems() + 1);
			int total = (int) (cart.getGrandTotal() + cartItem.getTotalPrice());
			cart.setGrandTotal(total);
			// need to add if
			cartItemDao.add(cartItem);
		} else {
			Product product = cartItem.getProduct();
			// Update cartItem
			int oldQuantity = cartItem.getQuantity();
			cartItem.setQuantity(cartItem.getQuantity() + 1);
			cartItem.setTotalPrice(product.getPrice() * cartItem.getQuantity());

			// while Updating cart, only update grandtotal as we are updating
			// existing item quantity
			cart.setGrandTotal(cart.getGrandTotal() + (cartItem.getQuantity() - oldQuantity) * product.getPrice());
			cartItemDao.update(cartItem);
		}
		// Returning cartItemList to viewCart page
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("cartItemList", cart.getCartItems());
		mv.addObject("userViewCart", true);
		return mv;
	}

	@GetMapping("/view/cart")
	public ModelAndView viewCartList() {
		Principal principal = request.getUserPrincipal();
		User user = userDao.getUserByUsername(principal.getName());
		Cart cart = (Cart) user.getCart();
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("cartItemList", cart.getCartItems());
		mv.addObject("userViewCart", true);
		return mv;

	}

	@GetMapping("cartitem/plus/{id}")
	public String incrementCartItem(@PathVariable("id") int id) {
		CartItem item = cartItemDao.getCartItem(id);

		Product product = item.getProduct();
		// Update cartItem
		int oldQuantity = item.getQuantity();
		item.setQuantity(item.getQuantity() + 1);
		item.setTotalPrice(product.getPrice() * item.getQuantity());

		// while Updating cart, only update grandtotal as we are updating
		// existing item quantity
		Cart cart = item.getCart();
		cart.setGrandTotal(cart.getGrandTotal() + (item.getQuantity() - oldQuantity) * product.getPrice());
		cartItemDao.update(item);
		return "redirect:/user/view/cart";

	}

	@GetMapping("cartitem/minus/{id}")
	public String decrementCartItem(@PathVariable("id") int id) {
		CartItem item = cartItemDao.getCartItem(id);

		Product product = item.getProduct();
		// Update cartItem
		int oldQuantity = item.getQuantity();
		item.setQuantity(item.getQuantity() - 1);
		//it will deduct if item quantity is >= 0
		if (item.getQuantity() >= 0) {
			item.setTotalPrice(product.getPrice() * item.getQuantity());

			// while Updating cart, only update grandtotal as we are updating
			// existing item quantity
			Cart cart = item.getCart();
			cart.setGrandTotal(cart.getGrandTotal() + (item.getQuantity() - oldQuantity) * product.getPrice());
			cartItemDao.update(item);
		}
		return "redirect:/user/view/cart";

	}
}
