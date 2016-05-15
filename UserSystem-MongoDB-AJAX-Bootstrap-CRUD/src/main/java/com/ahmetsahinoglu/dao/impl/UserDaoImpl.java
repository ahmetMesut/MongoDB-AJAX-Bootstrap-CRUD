package com.ahmetsahinoglu.dao.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.ahmetsahinoglu.dao.UserDao;
import com.ahmetsahinoglu.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public static final String COLLECTION_NAME = "user";
	
	public UserDaoImpl() {
		System.out.println("UserDaoImpl()");
	}

	@Override
	public void createUser(User user) {
		if (!mongoTemplate.collectionExists(User.class)) {
			mongoTemplate.createCollection(User.class);
		}
		user.setId(UUID.randomUUID().toString());
		mongoTemplate.insert(user, COLLECTION_NAME);
		
	}

	@Override
	public void deleteUser(User user) {
		mongoTemplate.remove(user, COLLECTION_NAME);
		
	}

	@Override
	public void updateUser(User user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(user.getId()));
		Update update = new Update();
		update.set("name", user.getName());
		update.set("surname", user.getSurname());
		update.set("phoneNumber", user.getPhoneNumber());
		mongoTemplate.updateFirst(query, update, User.class, COLLECTION_NAME);
	}

	@Override
	public List<User> listUser() {
		return mongoTemplate.findAll(User.class,COLLECTION_NAME);
	}

	@Override
	public User findById(String id) {
			return mongoTemplate.findById(id, User.class);
	}
	
	
	

}
