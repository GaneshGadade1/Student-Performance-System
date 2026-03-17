package com.gg.model;

public class SystemSetting 
{
	private int id;

	private double attendanceWeight;
	private double studyHoursWeight;
	private double previousMarksWeight;
	private double intercept;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getAttendanceWeight() {
		return attendanceWeight;
	}
	public void setAttendanceWeight(double attendanceWeight) {
		this.attendanceWeight = attendanceWeight;
	}
	public double getStudyHoursWeight() {
		return studyHoursWeight;
	}
	public void setStudyHoursWeight(double studyHoursWeight) {
		this.studyHoursWeight = studyHoursWeight;
	}
	public double getPreviousMarksWeight() {
		return previousMarksWeight;
	}
	public void setPreviousMarksWeight(double previousMarksWeight) {
		this.previousMarksWeight = previousMarksWeight;
	}
	public double getIntercept() {
		return intercept;
	}
	public void setIntercept(double intercept) {
		this.intercept = intercept;
	}
	
	
	    
	    
}
