package com.gg.repository;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.gg.model.PerformanceRecord;

@Repository
public class PerformanceRepositoryImpl implements IPerformanceRepository 
{

	 private final JdbcTemplate jdbcTemplate;

	    public PerformanceRepositoryImpl(JdbcTemplate jdbcTemplate) 
	    {
	        this.jdbcTemplate = jdbcTemplate;
	    }

	    @Override
	    public void savePerformance(PerformanceRecord r) 
	    {

	        String sql = """
	                INSERT INTO performance_records
	                (student_id, attendance_percentage, study_hours,
	                 previous_marks, predicted_marks, readiness_level)
	                VALUES (?, ?, ?, ?, ?, ?)
	                """;

	        jdbcTemplate.update(sql,
	                r.getStudentId(),
	                r.getAttendance(),
	                r.getStudyHours(),
	                r.getPreviousMarks(),
	                r.getPredictedMarks(),
	                r.getReadinessLevel());
	    }

	    @Override
	    public List<PerformanceRecord> getByStudentId(int studentId)
	    {

	    	String sql = """
	    			SELECT p.*, s.student_name
	    			FROM performance_records p
	    			JOIN students s ON p.student_id = s.student_id
	    			WHERE p.student_id = ?
	    			""";

	    	return jdbcTemplate.query(sql, (rs, rowNum) -> 
	    	{

	    	    PerformanceRecord r = new PerformanceRecord();

	    	    r.setRecordId(rs.getInt("record_id"));
	    	    r.setStudentId(rs.getInt("student_id"));
	    	    r.setStudentName(rs.getString("student_name")); // new
	    	    r.setAttendance(rs.getDouble("attendance_percentage"));
	    	    r.setStudyHours(rs.getDouble("study_hours"));
	    	    r.setPreviousMarks(rs.getDouble("previous_marks"));
	    	    r.setPredictedMarks(rs.getDouble("predicted_marks"));
	    	    r.setReadinessLevel(rs.getString("readiness_level"));

	    	    return r;

	    	}, studentId);
	    }

	    @Override
	    public List<PerformanceRecord> searchByStudentName(String name, int limit, int offset)
	    {

	        String sql = """
	            SELECT p.*, s.student_name
	            FROM performance_records p
	            JOIN students s ON p.student_id = s.student_id
	            WHERE LOWER(s.student_name) LIKE LOWER(?)
	            LIMIT ? OFFSET ?
	            """;

	        return jdbcTemplate.query(sql, (rs, rowNum) -> 
	        {

	            PerformanceRecord r = new PerformanceRecord();

	            r.setRecordId(rs.getInt("record_id"));
	            r.setStudentId(rs.getInt("student_id"));
	            r.setStudentName(rs.getString("student_name"));
	            r.setAttendance(rs.getDouble("attendance_percentage"));
	            r.setStudyHours(rs.getDouble("study_hours"));
	            r.setPreviousMarks(rs.getDouble("previous_marks"));
	            r.setPredictedMarks(rs.getDouble("predicted_marks"));
	            r.setReadinessLevel(rs.getString("readiness_level"));

	            return r;

	        }, "%" + name + "%", limit, offset);
	    }

		@Override
		public void deletePerformance(int id) 
		{
			String sql = "DELETE FROM performance_records WHERE record_id=?";

		    jdbcTemplate.update(sql, id);
			
		}
		@Override
		public List<PerformanceRecord> getPerformanceByUsername(String username) {

		    String sql = """
		        SELECT p.*, s.student_name
		        FROM performance_records p
		        JOIN students s ON p.student_id = s.student_id
		        JOIN users u ON s.user_id = u.id
		        WHERE u.username = ?
		        ORDER BY p.record_id DESC
		    """;

		    return jdbcTemplate.query(sql, (rs, rowNum) -> {

		        PerformanceRecord r = new PerformanceRecord();

		        r.setRecordId(rs.getInt("record_id"));
		        r.setStudentId(rs.getInt("student_id"));
		        r.setStudentName(rs.getString("student_name"));
		        r.setAttendance(rs.getDouble("attendance_percentage"));
		        r.setStudyHours(rs.getDouble("study_hours"));
		        r.setPreviousMarks(rs.getDouble("previous_marks"));
		        r.setPredictedMarks(rs.getDouble("predicted_marks"));
		        r.setReadinessLevel(rs.getString("readiness_level"));

		        return r;

		    }, username);
		}

		

		@Override
		public List<PerformanceRecord> getAllRecords(int limit, int offset)
		{

		    String sql = """
		    SELECT p.*, s.student_name
		    FROM performance_records p
		    JOIN students s ON p.student_id = s.student_id
		    LIMIT ? OFFSET ?
		    """;

		    return jdbcTemplate.query(sql,(rs,rowNum)->{

		        PerformanceRecord r = new PerformanceRecord();

		        r.setRecordId(rs.getInt("record_id"));
		        r.setStudentId(rs.getInt("student_id"));
		        r.setStudentName(rs.getString("student_name"));
		        r.setAttendance(rs.getDouble("attendance_percentage"));
		        r.setStudyHours(rs.getDouble("study_hours"));
		        r.setPreviousMarks(rs.getDouble("previous_marks"));
		        r.setPredictedMarks(rs.getDouble("predicted_marks"));
		        r.setReadinessLevel(rs.getString("readiness_level"));

		        return r;

		    },limit,offset);
		}
		@Override
		public int countAllRecords()
		{
		    String sql = "SELECT COUNT(*) FROM performance_records";

		    return jdbcTemplate.queryForObject(sql, Integer.class);
		}
		
		@Override
		public int countByStudentName(String name)
		{

		    String sql = """
		        SELECT COUNT(*)
		        FROM performance_records p
		        JOIN students s ON p.student_id = s.student_id
		        WHERE LOWER(s.student_name) LIKE LOWER(?)
		        """;

		    return jdbcTemplate.queryForObject(sql, Integer.class,"%"+name+"%");
		}
}
