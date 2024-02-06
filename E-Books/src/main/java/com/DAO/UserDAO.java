package com.DAO;

import com.entity.User;

public interface UserDAO {
	public abstract Boolean userRegister(User us);

	public User login(String email, String password);


	public boolean updateProfile(User us);

	public boolean checkPassword(String ps,int id);
	public boolean checkUser(String em);


		
	
}
