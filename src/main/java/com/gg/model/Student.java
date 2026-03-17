package com.gg.model;

import java.time.LocalDateTime;

public class Student {

    private int id;                 // student_id
    private String name;            // student_name
    private String email;           // student_email
    private String course;          // student_course
    private LocalDateTime createdAt;
    private int UserId;

    // 🔹 Default Constructor
    public Student() {
    }

    // 🔹 Parameterized Constructor
    public Student(int id, String name, String email, String course, LocalDateTime createdAt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.course = course;
        this.createdAt = createdAt;
    }

    // 🔹 Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }


    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    // 🔹 toString Method (For Debugging)

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", course='" + course + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }

}