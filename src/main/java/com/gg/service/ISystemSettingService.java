package com.gg.service;

import com.gg.model.SystemSetting;

public interface ISystemSettingService 
{
	SystemSetting getSettings();

    void updateSettings(SystemSetting setting);
}
