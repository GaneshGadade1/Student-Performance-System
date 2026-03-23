package com.gg.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan(basePackages = "com.gg")
public class DBConfig {

    @Bean
    public DataSource dataSource() 
    {

        DriverManagerDataSource ds =
                new DriverManagerDataSource();

        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/student_prediction");
        ds.setUsername("admin");
        ds.setPassword("root");

        return ds;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource ds) 
    {
        return new JdbcTemplate(ds);
    }
}