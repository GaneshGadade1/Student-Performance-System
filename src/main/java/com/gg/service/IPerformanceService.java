package com.gg.service;

import java.util.List;

import com.gg.model.PerformanceRecord;

public interface IPerformanceService 
{
	void savePerformance(PerformanceRecord record);
	public List<PerformanceRecord> getByStudentId(int studentId);
	void deletePerformance(int id);
	List<PerformanceRecord> getPerformanceByUsername(String username);
	List<PerformanceRecord> getAllRecords(int limit, int offset);
	List<PerformanceRecord> searchByStudentName(String name, int limit, int offset);
	
	public int countAllRecords();
	int countByStudentName(String name);
	
}
