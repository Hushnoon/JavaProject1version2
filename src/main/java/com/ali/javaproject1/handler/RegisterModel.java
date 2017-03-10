package com.ali.javaproject1.handler;

import java.io.Serializable;

import com.ali.javaproject1.backend.model.Address;
import com.ali.javaproject1.backend.model.User;

public class RegisterModel  implements Serializable{
	
	private User user;
	private Address billingAddress;
	public RegisterModel() {
		user = new User();
		billingAddress = new Address();
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Address getBillingAddress() {
		return billingAddress;
	}
	public void setBillingAddress(Address billingAddress) {
		this.billingAddress = billingAddress;
		
	}
	
	 
}
