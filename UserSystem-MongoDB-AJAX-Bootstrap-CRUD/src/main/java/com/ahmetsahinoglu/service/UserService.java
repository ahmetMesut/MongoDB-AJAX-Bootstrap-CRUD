package com.ahmetsahinoglu.service;

import java.util.List;
import com.ahmetsahinoglu.model.User;

public interface UserService {
	
	public void createUser(User user);
	
	public void deleteUser(User user);
	
	public void updateUser(User user);
	
	public List<User> listUser();
	
	public User findById(String id);

}
