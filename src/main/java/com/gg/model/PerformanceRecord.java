package com.gg.model;

import java.time.LocalDateTime;

public class PerformanceRecord {

    private int recordId;
    private int studentId;

    private double attendance;
    private double studyHours;
    private double previousMarks;

    private double predictedMarks;
    private String readinessLevel;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    private String studentName;
    

	// 🔹 Default Constructor
    public PerformanceRecord() {
    }

    // 🔹 Parameterized Constructor
    public PerformanceRecord(int recordId,
                             int studentId,
                             double attendance,
                             double studyHours,
                             double previousMarks,
                             double predictedMarks,
                             String readinessLevel,
                             LocalDateTime createdAt,
                             LocalDateTime updatedAt) {

        this.recordId = recordId;
        this.studentId = studentId;
        this.attendance = attendance;
        this.studyHours = studyHours;
        this.previousMarks = previousMarks;
        this.predictedMarks = predictedMarks;
        this.readinessLevel = readinessLevel;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // 🔹 Getters and Setters

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public double getAttendance() {
        return attendance;
    }

    public void setAttendance(double attendance) {
        this.attendance = attendance;
    }

    public double getStudyHours() {
        return studyHours;
    }

    public void setStudyHours(double studyHours) {
        this.studyHours = studyHours;
    }

    public double getPreviousMarks() {
        return previousMarks;
    }

    public void setPreviousMarks(double previousMarks) {
        this.previousMarks = previousMarks;
    }

    public double getPredictedMarks() {
        return predictedMarks;
    }

    public void setPredictedMarks(double predictedMarks) {
        this.predictedMarks = predictedMarks;
    }

    public String getReadinessLevel() {
        return readinessLevel;
    }

    public void setReadinessLevel(String readinessLevel) {
        this.readinessLevel = readinessLevel;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
    // 🔹 toString Method

    @Override
    public String toString() {
        return "PerformanceRecord{" +
                "recordId=" + recordId +
                ", studentId=" + studentId +
                ", student name="+studentName+
                ", attendance=" + attendance +
                ", studyHours=" + studyHours +
                ", previousMarks=" + previousMarks +
                ", predictedMarks=" + predictedMarks +
                ", readinessLevel='" + readinessLevel + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}