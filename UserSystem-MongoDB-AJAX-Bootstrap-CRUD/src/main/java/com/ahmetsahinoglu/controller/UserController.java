package com.ahmetsahinoglu.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ahmetsahinoglu.model.User;
import com.ahmetsahinoglu.service.UserService;


@Controller
public class UserController {
	
	//User service implementation
	@Autowired
	private UserService userService;
	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	public UserController() {
		System.out.println("UserController()");
	}
	
	
	@RequestMapping("listAllUser")
	public ModelAndView listAllUser(){
		logger.info("All users ");
		List<User> userList = userService.listUser();
		return new ModelAndView("listAllUser", "userList", userList);
	}
	
	@RequestMapping(value="save",method=RequestMethod.POST,produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody User save(@RequestBody User user) {
		logger.info("User saving :"+ user);
		userService.createUser(user);
		return user;
		
	}
	
	@RequestMapping(value="delete",method=RequestMethod.POST,produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody ModelAndView delete(@RequestBody String id,@ModelAttribute User user){
		user = userService.findById(id);
		userService.deleteUser(user);
		return new ModelAndView("redirect:listAllUser");
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST,produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody User update(@RequestBody User user){
		userService.updateUser(user);
		return user;
	}
	
	
	
	
}
