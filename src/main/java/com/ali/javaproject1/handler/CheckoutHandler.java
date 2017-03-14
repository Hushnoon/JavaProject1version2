package com.ali.javaproject1.handler;

import java.security.Principal;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ali.javaproject1.backend.dao.AddressDao;
import com.ali.javaproject1.backend.dao.CartDao;
import com.ali.javaproject1.backend.dao.CartItemDao;
import com.ali.javaproject1.backend.dao.OrderDao;
import com.ali.javaproject1.backend.dao.OrderItemDao;
import com.ali.javaproject1.backend.dao.UserDao;
import com.ali.javaproject1.backend.model.Address;
import com.ali.javaproject1.backend.model.CartItem;
import com.ali.javaproject1.backend.model.OrderItem;
import com.ali.javaproject1.backend.model.Orders;
import com.ali.javaproject1.backend.model.User;

@Component
public class CheckoutHandler {

	@Autowired
	UserDao userDao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	CartDao cartDao;
	@Autowired
	AddressDao addressDao;
	@Autowired
	CartItemDao cartItemDao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	OrderItemDao orderItemDao;

	public CheckoutModel initFlow() {
		CheckoutModel checkoutModel = new CheckoutModel();

		// --Retrieve current logged in user details
		Principal p = request.getUserPrincipal();
		User user = userDao.getUserByUsername(p.getName());
		checkoutModel.setUser(user);
		checkoutModel.setCart(user.getCart());
		checkoutModel.setCartItemList((user.getCart()).getCartItems());
		return checkoutModel;
	}

	public void saveNewShippingAddress(CheckoutModel checkoutModel, Address address) {
		address.setUser(checkoutModel.getUser());
		addressDao.add(address);
		checkoutModel.setAddress(address);

	}
	
	public void setShippingAddress(CheckoutModel checkoutModel, int addressid)
	{
		
		System.out.println(addressid);
/*		Address address=addressDao.getAddress(checkoutModel.getAddressid());
		checkoutModel.setAddress(address);
		System.out.println("Shipping Address");
		System.out.println(checkoutModel.getAddressid());
*/		
	}
	
	public String saveOrder(CheckoutModel checkoutModel) {
		Orders order = new Orders();
		order.setUser(checkoutModel.getUser());
		order.setShippingAddress(checkoutModel.getAddress());
		order.setTotalItems(checkoutModel.getCart().getTotalItems());
		order.setGrandTotal(checkoutModel.getCart().getGrandTotal());
		orderDao.add(order);
		OrderItem orderItem = new OrderItem();
		Set<CartItem> cartItemList = checkoutModel.getCartItemList();

		for (CartItem item : cartItemList) {
			orderItem.setProduct(item.getProduct());
			orderItem.setQuantity(item.getQuantity());
			orderItem.setTotalPrice(item.getTotalPrice());
			orderItem.setOrder(order);
			orderItemDao.add(orderItem);
			cartItemDao.delete(item);
		}
		cartDao.delete(checkoutModel.getCart());
		return "success";
	}
}
