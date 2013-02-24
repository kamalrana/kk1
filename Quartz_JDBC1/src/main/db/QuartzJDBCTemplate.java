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
String SQL = "select qrtz_triggers.JOB_NAME,qrtz_job_details.JOB_CLASS_NAME," + " qrtz_triggers.TRIGGER_STATE, "+
		"qrtz_triggers.JOB_GROUP,qrtz_triggers.TRIGGER_NAME," +
		"DATE_FORMAT((CONCAT(FROM_UNIXTIME(LEFT(qrtz_triggers.START_TIME, LENGTH(qrtz_triggers.START_TIME) - 3)), '.', RIGHT(qrtz_triggers.START_TIME, 3))),'%m/%d/%Y %h:%m:%s %p') as START_TIME," +
		"DATE_FORMAT((CONCAT(FROM_UNIXTIME(LEFT(qrtz_triggers.END_TIME, LENGTH(qrtz_triggers.END_TIME) - 3)), '.', RIGHT(qrtz_triggers.END_TIME, 3))),'%m/%d/%Y %h:%m:%s %p') as END_TIME from qrtz_triggers,qrtz_job_details where qrtz_triggers.JOB_NAME = qrtz_job_details.JOB_NAME";

/*String SQL="select qrtz_triggers.JOB_NAME,qrtz_job_details.JOB_CLASS_NAME,qrtz_triggers.JOB_GROUP,qrtz_triggers.TRIGGER_NAME,
 * CONCAT(FROM_UNIXTIME(LEFT(qrtz_triggers.START_TIME, LENGTH(qrtz_triggers.START_TIME) - 3)), '.', RIGHT(qrtz_triggers.START_TIME, 3)),
 * CONCAT(FROM_UNIXTIME(LEFT(qrtz_triggers.END_TIME, LENGTH(qrtz_triggers.END_TIME) - 3)), '.', RIGHT(qrtz_triggers.END_TIME, 3)) from qrtz_triggers,qrtz_job_details where qrtz_triggers.JOB_NAME = qrtz_job_details.JOB_NAME";*/
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
      public void update(Integer id, Integer age){
      String SQL = "update QuartzForm set age = ? where id = ?";
      jdbcTemplateObject.update(SQL, age, id);
      System.out.println("Updated Record with ID = " + id );
      return;
   }*/

   public void delete(String jobName,String Class,String Trigger,String Group){
		/*String SQL = "delete * from qrtz_triggers,qrtz_simple_triggers,qrtz_job_details where qrtz_triggers.JOB_NAME='"+jobName+"'" +
				"& qrtz_triggers.JOB_GROUP='"+Group+"'"+ " & qrtz_simple_triggers.TRIGGER_NAME='"+Group+"'"+ " & qrtz_simple_triggers.TRIGGER_GROUP='"+Group+"'"+ " & " +
				"qrtz_job_details.JOB_NAME='"+jobName+"'"+ " & qrtz_job_details.JOB_GROUP='"+Group+"'"+" & qrtz_job_details.JOB_CLASS_NAME='"+Class+"'";*/
String SQL="DELETE FROM qrtz_simple_triggers WHERE  TRIGGER_NAME='"+Trigger+"'" +" AND TRIGGER_GROUP='"+Group+"'"+" LIMIT 1";	   
System.out.println(SQL);int i=0;
i=jdbcTemplateObject.update(SQL);
System.out.println("response : "+i);
SQL="DELETE FROM qrtz_triggers WHERE TRIGGER_NAME='"+Trigger+"'" + " AND TRIGGER_GROUP='"+Group+"'"+" LIMIT 1";
System.out.println(SQL);
i=jdbcTemplateObject.update(SQL);System.out.println("response : "+i);
SQL="DELETE FROM qrtz_job_details WHERE JOB_NAME='"+jobName+"'"+ " AND JOB_GROUP='"+Group+"'"+" LIMIT 1";
System.out.println(SQL);
i=jdbcTemplateObject.update(SQL);System.out.println("response : "+i);
   }



}