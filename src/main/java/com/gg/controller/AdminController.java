package com.gg.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.gg.model.PerformanceRecord;
import com.gg.model.Student;
import com.gg.repository.IPerformanceRepository;
import com.gg.service.IPerformanceService;
import com.gg.service.IStudentService;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class AdminController 
{

    private final IStudentService studentService;
    private final IPerformanceService performanceService;
    
    public AdminController(IStudentService studentService,IPerformanceService performanceService) 
    {
        this.studentService = studentService;
        this.performanceService = performanceService;
    }

    @GetMapping("/dashboard")
    public String adminDashboard() 
    {
        return "admin-dashboard";
    }

    @GetMapping("/students")
    public String manageStudents(Model model) 
    {

        List<Student> students = studentService.getAllStudents();

        model.addAttribute("students", students);

        return "manage-students";
    }

    // ADD
    @PostMapping("/students/add")
    public String addStudent(Student student)
    {

        studentService.saveStudent(student);

        return "redirect:/admin/students";
    }

    // DELETE
    @GetMapping("/students/delete/{id}")
    public String deleteStudent(@PathVariable("id") int id) 
    {

        studentService.deleteStudent(id);

        return "redirect:/admin/students";
    }

    // EDIT PAGE
    @GetMapping("/students/edit/{id}")
    public String editStudent(@PathVariable("id") int id, Model model) 
    {

        Student student = studentService.getStudentById(id);

        model.addAttribute("student", student);

        return "edit-student";
    }

    // UPDATE
    @PostMapping("/students/update")
    public String updateStudent(Student student) 
    {

        studentService.updateStudent(student);

        return "redirect:/admin/students";
    }
    
    @GetMapping("/reports")
    public String reports(
            @RequestParam(value="name", required=false) String name,
            @RequestParam(value="page", defaultValue="1") int page,
            Model model)
    {

        int size = 5;
        int offset = (page - 1) * size;

        List<PerformanceRecord> records;
        int totalRecords;

        if(name != null && !name.isEmpty())
        {
            records = performanceService.searchByStudentName(name, size, offset);
            totalRecords = performanceService.countByStudentName(name);
        }
        else
        {
            records = performanceService.getAllRecords(size, offset);
            totalRecords = performanceService.countAllRecords();
        }

        int totalPages = (int)Math.ceil((double)totalRecords / size);

        model.addAttribute("records", records);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("name", name);

        return "reports";
    }
    
    @GetMapping("/performance/add")
    public String addPerformancePage(Model model) 
    {

        List<Student> students = studentService.getAllStudents();

        model.addAttribute("students", students);

        return "add-performance";
    }

    @PostMapping("/performance/save")
    public String savePerformance(PerformanceRecord record) 
    {

        performanceService.savePerformance(record);

        return "redirect:/admin/reports?studentId=" + record.getStudentId();
    }
    

    @GetMapping("/performance/delete/{id}")
    public String deletePerformance(@PathVariable("id") int id) 
    {

        performanceService.deletePerformance(id);

        return "redirect:/admin/reports";
    }
    
    @GetMapping("/reports/search")
    @ResponseBody
    public List<PerformanceRecord> liveSearch(@RequestParam("name") String name)
    {
        return performanceService.searchByStudentName(name, 50, 0);
    }
    
    @GetMapping("/admin/analytics")
    public String analytics(Model model) {

        int totalStudents = studentService.getAllStudents().size();
        int totalRecords = performanceService.countAllRecords();

        model.addAttribute("students", totalStudents);
        model.addAttribute("records", totalRecords);

        return "admin-analytics";
    }
    
    @GetMapping("/admin/export/pdf")
    public void exportPdf(HttpServletResponse response) throws Exception {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=report.pdf");

        List<PerformanceRecord> records = performanceService.getAllRecords(100, 0);

        PdfWriter writer = new PdfWriter(response.getOutputStream());
        PdfDocument pdf = new PdfDocument(writer);
        Document doc = new Document(pdf);

        doc.add(new Paragraph("Student Performance Report"));

        for(PerformanceRecord r : records){
            doc.add(new Paragraph(
                "Student: " + r.getStudentName() +
                " | Marks: " + r.getPredictedMarks()
            ));
        }

        doc.close();
    }
    
}