package com.gg.service;

import org.springframework.stereotype.Service;

import com.gg.model.SystemSetting;
import com.gg.repository.ISystemSettingRepository;
@Service
public class SystemSettingServiceImpl implements ISystemSettingService 
{
	 private final ISystemSettingRepository repository;
	 
	 public SystemSettingServiceImpl(ISystemSettingRepository repository) 
	 {
	        this.repository = repository;
	 }
	 
	 
	@Override
	public SystemSetting getSettings() 
	{
		return repository.getSettings();
	}

	@Override
	public void updateSettings(SystemSetting setting) 
	{ 
		repository.updateSettings(setting);
	}

}
