package com.gg.service;

public interface IPredictionService 
{
	 double calculatePrediction(double attendance,
             double studyHours,
             double previousMarks);
	String classify(double marks);
}
