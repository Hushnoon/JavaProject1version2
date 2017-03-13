package com.ali.javaproject1.handler;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.ali.javaproject1.backend.model.Address;
import com.ali.javaproject1.backend.model.Cart;
import com.ali.javaproject1.backend.model.CartItem;
import com.ali.javaproject1.backend.model.Order;
import com.ali.javaproject1.backend.model.OrderItem;
import com.ali.javaproject1.backend.model.User;

public class CheckoutModel implements Serializable{

	private int addressid;
	private Cart cart;
	private User user;
	private Address address;
	private OrderItem orderItem;
	private Order order;
	private List<CartItem> cartItemList;
	public CheckoutModel()
	{
		cart=new Cart();
		user=new User();
		address=new Address();
		orderItem=new OrderItem();
		order=new Order();
		cartItemList=new ArrayList<CartItem>();
	}

	public int getAddressid() {
		return addressid;
	}

	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}

	public List<CartItem> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List<CartItem> cartItemList) {
		this.cartItemList = cartItemList;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}
