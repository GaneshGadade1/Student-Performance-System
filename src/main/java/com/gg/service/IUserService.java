package com.gg.service;

public interface IUserService {

    void saveUser(String username, String password, String role);

    void registerStudent(String name, String email, String course, String password);
}