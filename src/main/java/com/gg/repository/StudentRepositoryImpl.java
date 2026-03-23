package com.gg.repository;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.gg.model.Student;

@Repository
public class StudentRepositoryImpl implements IStudentRepository 
{

    private final JdbcTemplate jdbcTemplate;

    public StudentRepositoryImpl(JdbcTemplate jdbcTemplate) 
    {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void saveStudent(Student student) 
    {

        String sql = "INSERT INTO students(student_name, student_email, student_course) VALUES (?, ?, ?)";

        jdbcTemplate.update(sql,
                student.getName(),
                student.getEmail(),
                student.getCourse());
    }

    @Override
    public void updateStudent(Student student)
    {

        String sql = "UPDATE students SET student_name=?, student_email=?, student_course=? WHERE student_id=?";

        jdbcTemplate.update(sql,
                student.getName(),
                student.getEmail(),
                student.getCourse(),
                student.getId());
    }

    @Override
    public void deleteStudent(int id) 
    {

        String sql = "DELETE FROM students WHERE student_id=?";

        jdbcTemplate.update(sql, id);
    }

    @Override
    public Student getStudentById(int id) {

        String sql = "SELECT * FROM students WHERE student_id=?";

        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> 
        {

            Student student = new Student();

            student.setId(rs.getInt("student_id"));
            student.setName(rs.getString("student_name"));
            student.setEmail(rs.getString("student_email"));
            student.setCourse(rs.getString("student_course"));

            return student;

        }, id);
    }

    @Override
    public List<Student> getAllStudents() {

        String sql = "SELECT * FROM students";

        return jdbcTemplate.query(sql, (rs, rowNum) -> 
        {

            Student student = new Student();

            student.setId(rs.getInt("student_id"));
            student.setName(rs.getString("student_name"));
            student.setEmail(rs.getString("student_email"));
            student.setCourse(rs.getString("student_course"));

            return student;

        });
    }

    @Override
    public Student getStudentByUsername(String username) 
    {

        String sql = """
                SELECT s.*
                FROM students s
                JOIN users u ON s.user_id = u.id
                WHERE u.username = ?
                """;

        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> 
        {

            Student student = new Student();

            student.setId(rs.getInt("student_id"));
            student.setName(rs.getString("student_name"));
            student.setEmail(rs.getString("student_email"));
            student.setCourse(rs.getString("student_course"));
            student.setUserId(rs.getInt("user_id"));

            return student;

        }, username);
    }

}