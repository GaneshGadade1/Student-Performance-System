package com.gg.repository;

import com.gg.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepositoryImpl implements IUserRepository {

    private final JdbcTemplate jdbcTemplate;

    public UserRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void save(User user) {

        String sql = "INSERT INTO users(username,password,role) VALUES(?,?,?)";

        jdbcTemplate.update(
                sql,
                user.getUsername(),
                user.getPassword(),
                user.getRole()
        );
    }

    @Override
    public void saveUser(String email, String password, String role) {

        String sql = "INSERT INTO users(username,password,role) VALUES(?,?,?)";

        jdbcTemplate.update(sql, email, password, role);
    }

    @Override
    public Integer findUserIdByUsername(String email) {

        String sql = "SELECT id FROM users WHERE username=?";

        return jdbcTemplate.queryForObject(sql, Integer.class, email);
    }

    @Override
    public void saveStudent(Integer userId, String name, String email, String course) {

        String sql = "INSERT INTO students(user_id,student_name,student_email,student_course) VALUES(?,?,?,?)";

        jdbcTemplate.update(sql, userId, name, email, course);
    }

    @Override
    public User findByUsername(String username) {

        String sql = "SELECT * FROM users WHERE username=?";

        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {

            User user = new User();

            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));

            return user;

        }, username);
    }

    @Override
    public void updateUser(int userId,String email,String password)
    {
        String sql = "UPDATE users SET username=?, password=? WHERE id=?";

        jdbcTemplate.update(sql,email,password,userId);
    }
    
    
}