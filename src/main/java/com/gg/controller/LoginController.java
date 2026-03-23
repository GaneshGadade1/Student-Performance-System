package com.gg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.gg.service.IUserService;

@Controller
public class LoginController 
{

    private final IUserService userService;

    public LoginController(IUserService userService) 
    {
        this.userService = userService;
    }

    @GetMapping("/")
    public String home()
    {
        return "login";
    }

    @GetMapping("/login")
    public String login() 
    {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage()
    {
        return "register";
    }

    @PostMapping("/registerStudent")
    public String registerStudent(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("course") String course,
            @RequestParam("password") String password) 
    {

        userService.registerStudent(name, email, course, password);

        return "redirect:/login";
    }
    
    @GetMapping("/about")
    public String about() {
        return "about";   // about.jsp
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact"; // contact.jsp
    }
}