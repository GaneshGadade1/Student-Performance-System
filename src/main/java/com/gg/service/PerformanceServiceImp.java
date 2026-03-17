package com.gg.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gg.model.PerformanceRecord;
import com.gg.repository.IPerformanceRepository;

@Service
public class PerformanceServiceImp implements IPerformanceService {

    private final IPerformanceRepository repository;
    private final IPredictionService predictionService;

    public PerformanceServiceImp(IPerformanceRepository repository,
                                  IPredictionService predictionService) 
    {
        this.repository = repository;
        this.predictionService = predictionService;
    }

    @Override
    public void savePerformance(PerformanceRecord record) {

        double predictedMarks = predictionService.calculatePrediction(
                record.getAttendance(),
                record.getStudyHours(),
                record.getPreviousMarks());

        String readiness = predictionService.classify(predictedMarks);

        record.setPredictedMarks(predictedMarks);
        record.setReadinessLevel(readiness);

        repository.savePerformance(record);
    }

    @Override
    public List<PerformanceRecord> getByStudentId(int studentId) {

        return repository.getByStudentId(studentId);
    }

	@Override
	public void deletePerformance(int id) 
	{
		repository.deletePerformance(id);
		
	}

	
	@Override
	public List<PerformanceRecord> getPerformanceByUsername(String username) {
	    return repository.getPerformanceByUsername(username);
	}
	
	@Override
	public List<PerformanceRecord> getAllRecords(int limit, int offset) {
	    return repository.getAllRecords(limit, offset);
	}

	@Override
	public List<PerformanceRecord> searchByStudentName(String name, int limit, int offset) {
	    return repository.searchByStudentName(name, limit, offset);
	}

	@Override
	public int countAllRecords() {
		// TODO Auto-generated method stub
		return repository.countAllRecords();
	}
	
	@Override
	public int countByStudentName(String name)
	{
	    return repository.countByStudentName(name);
	}
}


	    