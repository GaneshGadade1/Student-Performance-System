package com.gg.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.gg.model.Student;
import com.gg.repository.IStudentRepository;
import com.gg.repository.IUserRepository;

@Service
public class StudentServiceImpl implements IStudentService {

    private final IStudentRepository repository;
    private final IUserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public StudentServiceImpl(IStudentRepository repository,
                              IUserRepository userRepository,
                              PasswordEncoder passwordEncoder) {
        this.repository = repository;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void saveStudent(Student student) {
        repository.saveStudent(student);
    }

    @Override
    public void updateStudent(Student student) {
        repository.updateStudent(student);
    }

    @Override
    public void deleteStudent(int id) {
        repository.deleteStudent(id);
    }

    @Override
    public Student getStudentById(int id) {
        return repository.getStudentById(id);
    }

    @Override
    public List<Student> getAllStudents() {
        return repository.getAllStudents();
    }

    @Override
    public Student getStudentByUsername(String username) {
        return repository.getStudentByUsername(username);
    }

    @Override
    public void updateStudentProfile(String name,
                                     String course,
                                     String email,
                                     String password,
                                     String username) {

        Student student = repository.getStudentByUsername(username);

        student.setName(name);
        student.setCourse(course);
        student.setEmail(email);

        repository.updateStudent(student);

        String encodedPassword = passwordEncoder.encode(password);

        userRepository.updateUser(student.getUserId(), email, encodedPassword);
    }
}