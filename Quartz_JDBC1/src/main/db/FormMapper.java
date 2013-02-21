package main.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import main.form.QuartzForm;

import org.springframework.jdbc.core.RowMapper;
public class FormMapper implements RowMapper<QuartzForm> {
	   public QuartzForm mapRow(ResultSet rs, int rowNum) throws SQLException {
		      QuartzForm quartzForm = new QuartzForm();
		      quartzForm.setJobName(rs.getString("JOB_NAME"));
		      quartzForm.setJobClass(rs.getString("JOB_CLASS_NAME"));
		      quartzForm.setGroup(rs.getString("JOB_GROUP"));
		      quartzForm.setTriggerName(rs.getString("TRIGGER_NAME"));
		      quartzForm.setStartDate(rs.getString("START_TIME"));
		      quartzForm.setEndDate(rs.getString("END_TIME"));
		      return quartzForm;
		      
		   }
		}
