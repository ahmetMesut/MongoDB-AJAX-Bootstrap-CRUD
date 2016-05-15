package com.ahmetsahinoglu.dao;

import java.util.List;

import com.ahmetsahinoglu.model.User;

public interface UserDao {
	//database operations 
	//new user
	public void createUser(User user);
	//for delete
	public void deleteUser(User user);
	//update user
	public void updateUser(User user);
	//list user
	public List<User> listUser();
	//find user by id
	public User findById(String id);
	
	

}
