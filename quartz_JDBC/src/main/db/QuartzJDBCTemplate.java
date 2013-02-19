package main.db;

import java.util.List;

import javax.sql.DataSource;

import main.form.QuartzForm;

import org.springframework.jdbc.core.JdbcTemplate;

public class QuartzJDBCTemplate {
   private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
   
   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
   }

	public List<QuartzForm> getJobs() {
String SQL = "select qrtz_triggers.JOB_NAME,qrtz_job_details.JOB_CLASS_NAME," +
		"qrtz_triggers.JOB_GROUP,qrtz_triggers.TRIGGER_NAME," +
		"qrtz_triggers.START_TIME,qrtz_triggers.END_TIME from qrtz_triggers,qrtz_job_details where qrtz_triggers.JOB_NAME = qrtz_job_details.JOB_NAME";

/*String SQL="select qrtz_triggers.JOB_NAME,qrtz_job_details.JOB_CLASS_NAME,qrtz_triggers.JOB_GROUP,qrtz_triggers.TRIGGER_NAME,CONCAT(FROM_UNIXTIME(LEFT(qrtz_triggers.START_TIME, LENGTH(qrtz_triggers.START_TIME) - 3)), '.', RIGHT(qrtz_triggers.START_TIME, 3)),CONCAT(FROM_UNIXTIME(LEFT(qrtz_triggers.END_TIME, LENGTH(qrtz_triggers.END_TIME) - 3)), '.', RIGHT(qrtz_triggers.END_TIME, 3)) from qrtz_triggers,qrtz_job_details where qrtz_triggers.JOB_NAME = qrtz_job_details.JOB_NAME";*/
System.out.println("sql is : "+SQL);
		List<QuartzForm> quartzForm = jdbcTemplateObject.query(SQL,new FormMapper());
		return quartzForm;
	}

/*   public List<QuartzForm> listStudents() {
      String SQL = "select * from QuartzForm";
      List <QuartzForm> students = jdbcTemplateObject.query(SQL, 
                                new FormMapper());
      return students;
   }

   public void delete(Integer id){
      String SQL = "delete from QuartzForm where id = ?";
      jdbcTemplateObject.update(SQL, id);
      System.out.println("Deleted Record with ID = " + id );
      return;
   }

   public void update(Integer id, Integer age){
      String SQL = "update QuartzForm set age = ? where id = ?";
      jdbcTemplateObject.update(SQL, age, id);
      System.out.println("Updated Record with ID = " + id );
      return;
   }*/

}