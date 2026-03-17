package com.gg.repository;

import com.gg.model.SystemSetting;

public interface ISystemSettingRepository 
{
	SystemSetting getSettings();

    void updateSettings(SystemSetting setting);
}
