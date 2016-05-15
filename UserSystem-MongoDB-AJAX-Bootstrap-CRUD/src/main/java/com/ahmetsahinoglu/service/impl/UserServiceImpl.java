package com.ahmetsahinoglu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahmetsahinoglu.dao.UserDao;
import com.ahmetsahinoglu.model.User;
import com.ahmetsahinoglu.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	//create user service for use controller
	//userdao implementation
	@Autowired
	private UserDao userDao;
	
	public UserServiceImpl() {
		System.out.println("UserServiceImpl()");
	}

	@Override
	public void createUser(User user) {
		userDao.createUser(user);
		
	}

	@Override
	public void deleteUser(User user) {
		userDao.deleteUser(user);
		
	}

	@Override
	public void updateUser(User user) {
		 userDao.updateUser(user);
	}

	@Override
	public List<User> listUser() {
		return userDao.listUser();
	}

	@Override
	public User findById(String id) {
		return userDao.findById(id);
	}

}
