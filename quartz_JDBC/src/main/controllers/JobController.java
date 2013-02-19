package main.controllers;

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
	      QuartzJDBCTemplate quartzJDBCTemplate = 
	       (QuartzJDBCTemplate)context.getBean("quartzJDBCTemplate");
	      String date=null;
	      List<QuartzForm> quartzForm = quartzJDBCTemplate.getJobs();
	      for (QuartzForm job : quartzForm) {
	         System.out.print("job name : " + job.getJobName() );
	         System.out.print(", job Class : " + job.getJobClass() );
	         System.out.println(", group : " + job.getGroup());
	         System.out.println(", trigger name : " + job.getTriggerName());
	         System.out.println(", start date : " + job.getStartDate());
	         System.out.println(", end date : " + job.getEndDate());
	      }
		return new ModelAndView("ViewJob", "jobs", quartzForm);
	}
	
	
	@RequestMapping(method=RequestMethod.POST)
	public String processForm(HttpServletRequest req,HttpServletResponse resp) throws SchedulerException{
		System.out.println("inside method");
		String data=req.getParameter("data");
		System.out.println(data);
		String n =data.substring(data.indexOf(">"), data.indexOf("</td>"));
		System.out.println(n);
		return "";
	}

/*	public List<QuartzForm> getJobList(){
	      ApplicationContext context = 
	              new ClassPathXmlApplicationContext("Beans.xml");

	      QuartzJDBCTemplate quartzJDBCTemplate = 
	       (QuartzJDBCTemplate)context.getBean("quartzJDBCTemplate");
	      List<QuartzForm> quartzForm = quartzJDBCTemplate.getJobs();
	      for (QuartzForm job : quartzForm) {
	         System.out.print("job name : " + job.getJobName() );
	         System.out.print(", job Class : " + job.getJobClass() );
	         System.out.println(", group : " + job.getGroup());
	         System.out.println(", trigger name : " + job.getTriggerName());
	         System.out.println(", start date : " + job.getStartDate());
	         System.out.println(", end date : " + job.getEndDate());
	      }

		return quartzForm;
	}*/
	
}
