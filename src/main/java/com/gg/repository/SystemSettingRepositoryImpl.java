package com.gg.repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.gg.model.SystemSetting;

@Repository
public class SystemSettingRepositoryImpl implements ISystemSettingRepository 
{
	private final JdbcTemplate jdbcTemplate;
	
	public SystemSettingRepositoryImpl(JdbcTemplate jdbcTemplate) 
	{
		this.jdbcTemplate =  jdbcTemplate;
	}
	
	@Override
	public SystemSetting getSettings() 
	{
		String sql = "SELECT * FROM system_settings LIMIT 1";

        return jdbcTemplate.queryForObject(sql,(rs,rowNum)->{

            SystemSetting s = new SystemSetting();

            s.setId(rs.getInt("id"));
            s.setAttendanceWeight(rs.getDouble("attendance_weight"));
            s.setStudyHoursWeight(rs.getDouble("study_hours_weight"));
            s.setPreviousMarksWeight(rs.getDouble("previous_marks_weight"));
            s.setIntercept(rs.getDouble("intercept"));

            return s;

        });
	}

	@Override
	public void updateSettings(SystemSetting s) 
	{
		 String sql="""
			        UPDATE system_settings
			        SET attendance_weight=?,
			            study_hours_weight=?,
			            previous_marks_weight=?,
			            intercept=?
			        WHERE id=?
			        """;

			        jdbcTemplate.update(sql,
			                s.getAttendanceWeight(),
			                s.getStudyHoursWeight(),
			                s.getPreviousMarksWeight(),
			                s.getIntercept(),
			                s.getId());
			    
	}

}
