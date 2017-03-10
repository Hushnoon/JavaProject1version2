package com.ali.javaproject1.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ali.javaproject1.backend.dao.AddressDao;
import com.ali.javaproject1.backend.dao.CartDao;
import com.ali.javaproject1.backend.dao.UserDao;
import com.ali.javaproject1.backend.model.Address;
import com.ali.javaproject1.backend.model.Cart;
import com.ali.javaproject1.backend.model.User;

@Component
public class RegistrationHandler {

	@Autowired
	UserDao userDao;
	@Autowired
	AddressDao addressDao;
	@Autowired
	CartDao cartDao;

	public RegisterModel initFlow() {
		return new RegisterModel();
	}

	public void saveUser(RegisterModel registerModel, User user) {
		registerModel.setUser(user);

	}

	public void saveAddress(RegisterModel registerModel, Address address) {
		registerModel.setBillingAddress(address);

	}

	public String storeDetails(RegisterModel registerModel) {
		try {
			User user = registerModel.getUser();
			Address address = registerModel.getBillingAddress();
			if (userDao.add(user)) {
				address.setUser(user);
				addressDao.add(address);
				if (user.getRole().equals("CUSTOMER")) {
					Cart cart = new Cart();
					cart.setUser(user);
					cartDao.add(cart);
				}
			}
			return "success";
		} catch (Exception ex) {
			return "failure";
		}
	}
}
