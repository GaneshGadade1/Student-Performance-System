package com.gg.repository;

import java.util.List;
import com.gg.model.Student;

public interface IStudentRepository 
{

    void saveStudent(Student student);

    void updateStudent(Student student);

    void deleteStudent(int id);

    Student getStudentById(int id);

    List<Student> getAllStudents();

    Student getStudentByUsername(String username);

}