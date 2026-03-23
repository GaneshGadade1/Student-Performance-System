package com.gg.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.gg.model.PerformanceRecord;
import com.gg.model.Student;
import com.gg.service.IPerformanceService;
import com.gg.service.IStudentService;

@Controller
@RequestMapping("/student")
public class StudentController
{
	 private final IPerformanceService performanceService;
	 private final IStudentService studentService;

	    public StudentController(IPerformanceService performanceService,IStudentService studentService) 
	    {
	        this.performanceService = performanceService;
			this.studentService =studentService ;
	    }

    @GetMapping("/dashboard")
    public String studentDashboard() 
    {
        return "student-dashboard";
    }

    // Example AJAX action
    @PostMapping("/updateProfile")
    @ResponseBody
    public String updateProfile(
            @RequestParam("name") String name,
            @RequestParam("course") String course,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Authentication auth)
    {

        String username = auth.getName();

        studentService.updateStudentProfile(name,course,email,password,username);

        return "Profile Updated Successfully";
    }
    

    @GetMapping("/performance")
    public String myPerformance(Model model, Authentication auth) 
    {

        String username = auth.getName();

        List<PerformanceRecord> records =
                performanceService.getPerformanceByUsername(username);

        model.addAttribute("records", records);

        return "student-performance";
    }
    
    @GetMapping("/viewProfile")
    public String viewProfile(Model model, Authentication auth)
    {

        String username = auth.getName();

        Student student = studentService.getStudentByUsername(username);

        model.addAttribute("student", student);

        return "viewProfile";
    }
    
    @GetMapping("/chart-data")
    @ResponseBody
    public Map<String, Object> getChartData(Authentication auth) {

        String username = auth.getName();

        List<PerformanceRecord> records =
                performanceService.getPerformanceByUsername(username);

        double attendance = records.stream().mapToDouble(PerformanceRecord::getAttendance).average().orElse(0);
        double study = records.stream().mapToDouble(PerformanceRecord::getStudyHours).average().orElse(0);
        double previous = records.stream().mapToDouble(PerformanceRecord::getPreviousMarks).average().orElse(0);
        double predicted = records.stream().mapToDouble(PerformanceRecord::getPredictedMarks).average().orElse(0);

        Map<String, Object> data = new HashMap<>();
        data.put("attendance", attendance);
        data.put("study", study);
        data.put("previous", previous);
        data.put("predicted", predicted);

        return data;
    }
}