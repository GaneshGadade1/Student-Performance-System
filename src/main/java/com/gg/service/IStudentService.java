package com.gg.service;

import java.util.List;
import com.gg.model.Student;

public interface IStudentService {

    void saveStudent(Student student);

    void updateStudent(Student student);

    void deleteStudent(int id);

    Student getStudentById(int id);

    List<Student> getAllStudents();

	void updateStudentProfile(String name, String course, String email, String password, String username);
	
	Student getStudentByUsername(String username);
}