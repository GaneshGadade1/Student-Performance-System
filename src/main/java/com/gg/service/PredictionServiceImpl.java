package com.gg.service;

import org.springframework.stereotype.Service;
import com.gg.model.SystemSetting;

@Service
public class PredictionServiceImpl implements IPredictionService {

    private final ISystemSettingService settingService;

    public PredictionServiceImpl(ISystemSettingService settingService) {
        this.settingService = settingService;
    }

    @Override
    public double calculatePrediction(double attendance,
                                      double studyHours,
                                      double previousMarks) {

        SystemSetting s = settingService.getSettings();

        double prediction =
                s.getIntercept()
                + s.getAttendanceWeight() * attendance
                + s.getStudyHoursWeight() * studyHours
                + s.getPreviousMarksWeight() * previousMarks;

        // limit prediction between 0 and 100
        prediction = Math.min(prediction, 100);
        prediction = Math.max(prediction, 0);

        return prediction;
    }

    @Override
    public String classify(double marks) {

        if (marks >= 85) return "Excellent";
        else if (marks >= 70) return "Good";
        else if (marks >= 50) return "Average";
        else return "Needs Improvement";
    }
}