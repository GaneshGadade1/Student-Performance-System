package com.gg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gg.model.SystemSetting;
import com.gg.service.ISystemSettingService;

@Controller
@RequestMapping("admin/settings")
public class SystemSettingController 
{
	 private final ISystemSettingService service;
	 
	 public SystemSettingController(ISystemSettingService service)
	 {
		this.service = service;
	 }
	 
	 @GetMapping
	 public String viewSettings(Model model)
	 {
		 model.addAttribute("settings",service.getSettings());
		return "system-settings";
	 }
	 
	 @PostMapping("/update")
	 public String updateSettings(SystemSetting settings)
	 {
		 service.updateSettings(settings);
		 return "redirect:/admin/settings";
		 
	 }
}
