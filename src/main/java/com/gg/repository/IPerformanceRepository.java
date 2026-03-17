package com.gg.repository;

import java.util.List;

import com.gg.model.PerformanceRecord;

public interface IPerformanceRepository 
{
	void savePerformance(PerformanceRecord record);

    List<PerformanceRecord> getByStudentId(int studentId);

   // public List<PerformanceRecord> searchByStudentName(String name);
    
    void deletePerformance(int id);

	List<PerformanceRecord> getPerformanceByUsername(String username);

	List<PerformanceRecord> getAllRecords(int limit, int offset);
	List<PerformanceRecord> searchByStudentName(String name, int limit, int offset);
	int countAllRecords();
	
	int countByStudentName(String name);
	
}
