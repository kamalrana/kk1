package main.controllers;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.db.QuartzJDBCTemplate;
import main.form.QuartzForm;

import org.quartz.SchedulerException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/Jobs.html")
public class JobController {
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getJobList() {
	      ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
	      QuartzJDBCTemplate quartzJDBCTemplate = (QuartzJDBCTemplate)context.getBean("quartzJDBCTemplate");
	      String date=null;
	      List<QuartzForm> quartzForm = quartzJDBCTemplate.getJobs();
	      for (QuartzForm job : quartzForm) {
	         System.out.print("job name : " + job.getJobName() );
	         System.out.print(", job Class : " + job.getJobClass() );
	         System.out.println(", group : " + job.getGroup());
	         System.out.println(", trigger name : " + job.getTriggerName());
	         System.out.println(", start date : " + job.getStartDate());
	         System.out.println(", end date : " + job.getEndDate());
	         job.getJobKey();
	      }
		return new ModelAndView("ViewJob", "jobs", quartzForm);
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public String processForm(HttpServletRequest req,HttpServletResponse resp) throws SchedulerException{
		System.out.println("inside method");
		Enumeration<String> en=req.getParameterNames();
		while(en.hasMoreElements()){
			System.out.println(en.nextElement());
		}
		String jobName=req.getParameter("jobName");
		String Class=req.getParameter("Class");
		String Trigger=req.getParameter("Trigger");
		String Group=req.getParameter("Group");
		String Start=req.getParameter("Start");
		String End=req.getParameter("End");
System.out.println("jobName : "+jobName+" -ClassName : "+Class+" -trigger : "+Trigger+" -Group: "+Group+" -start : "+Start+" -End"+End);
		ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
	      QuartzJDBCTemplate quartzJDBCTemplate = (QuartzJDBCTemplate)context.getBean("quartzJDBCTemplate");
	      String date=null;
	      quartzJDBCTemplate.delete(jobName, Class, Trigger, Group);
		return "";
	}
	
}
