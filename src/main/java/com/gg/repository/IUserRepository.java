package com.gg.repository;

import com.gg.model.Student;
import com.gg.model.User;

public interface IUserRepository 
{

    void save(User user);

    void saveUser(String email, String password, String role);

    Integer findUserIdByUsername(String email);

    void saveStudent(Integer userId, String name, String email, String course);

    User findByUsername(String username);
    
  

	void updateUser(int userId, String username, String password);
	
	
}

