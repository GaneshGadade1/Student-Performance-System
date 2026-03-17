package com.gg.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.gg.model.User;
import com.gg.repository.IUserRepository;

@Service
public class UserServiceImpl implements IUserService {

    private final IUserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserServiceImpl(IUserRepository userRepository,
                           PasswordEncoder passwordEncoder) {

        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void saveUser(String username, String password, String role) {

        User user = new User();

        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setRole(role);

        userRepository.save(user);
    }

    @Override
    public void registerStudent(String name, String email, String course, String password) {

        String encodedPassword = passwordEncoder.encode(password);

        userRepository.saveUser(email, encodedPassword, "ROLE_STUDENT");

        Integer userId = userRepository.findUserIdByUsername(email);

        userRepository.saveStudent(userId, name, email, course);
    }
}