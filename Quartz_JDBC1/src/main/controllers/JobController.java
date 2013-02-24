package main.controllers;

import static org.quartz.JobBuilder.newJob;
import static org.quartz.SimpleScheduleBuilder.simpleSchedule;
import static org.quartz.TriggerBuilder.newTrigger;

import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.db.QuartzJDBCTemplate;
import main.form.QuartzForm;

import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JobController {
	
	@RequestMapping(value="/Jobs.html", method=RequestMethod.GET)
	public ModelAndView getJobList() {
	      ApplicationContext context =new ClassPathXmlApplicationContext("Beans.xml");
	      QuartzJDBCTemplate quartzJDBCTemplate = (QuartzJDBCTemplate)context.getBean("quartzJDBCTemplate");
	      String date=null;
	      List<QuartzForm> quartzForm = quartzJDBCTemplate.getJobs();
	      for (QuartzForm job : quartzForm) {
	         System.out.print("job name : " + job.getJobName() );
	         System.out.print(", job Class : " + job.getJobClass());
	         System.out.println(", group : " + job.getGroup());
	         System.out.println(", trigger name : " + job.getTriggerName());
	         System.out.println(", start date : " + job.getStartDate());
	         System.out.println(", end date : " + job.getEndDate());
	         job.getJobKey();
	      }
		return new ModelAndView("ViewJob", "jobs", quartzForm);
	}
	
	
	@RequestMapping(value="/deleteJob.html",method=RequestMethod.POST)
	public String deleteJob(HttpServletRequest req, HttpServletResponse res) throws SchedulerException{
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
	
	@RequestMapping(value="/addJob.html", method=RequestMethod.POST)
	public ModelAndView addJob(@ModelAttribute(value="JobForm") QuartzForm quartzForm,BindingResult result) throws SchedulerException{
		Scheduler scheduler = SchedulerController.scheduler;  
		String addJobMessage="";
		if(result.hasErrors()){
			System.out.println(result.getAllErrors().toString());
			addJobMessage="There was an error in result verification";
			return new ModelAndView("Scheduler", "addJobMessage", addJobMessage);
		}
		if(!scheduler.isStarted()){
			addJobMessage="schedular is not started yet - but ";
		}
		QuartzForm form1=(QuartzForm)quartzForm;
		String startAt=form1.getStartDate()+" "+form1.getStartTime();
		String endAt=form1.getEndDate()+" "+form1.getEndTime();
    	JobDetail job1=null;
    	Class classType=null;
    	try {
    		classType=Class.forName(form1.getJobClass());
			//job1 = newJob((Class<RunMeJob>)Class.forName(jobClass))
			job1 = newJob(classType)
			.withIdentity(form1.getJobName(),form1.getGroup())
			.build();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	Trigger trigger = newTrigger()
        .withIdentity(form1.getTriggerName(),form1.getGroup())
        .startAt(new Date(startAt))
        //.startNow()
        .withSchedule(simpleSchedule()
                .withIntervalInSeconds(10)
               .repeatForever())
               .endAt(new Date(endAt))
                .build();
                //.withRepeatCount(10)
                //.forJob(job1)
                //.startAt(futureDate(5, IntervalUnit.MINUTE))
                //.endAt(dateOf(22, 0, 0)
                //.repeatForever())
    	
    	System.out.println("start time : "+trigger.getStartTime());
    	System.out.println("end time : "+trigger.getEndTime());
    	scheduler.scheduleJob(job1, trigger);

    	addJobMessage+="job has been successfully added to schedular";
    	return new ModelAndView("Scheduler", "addJobMessage", addJobMessage);
	}
	
	@RequestMapping(value="/triggerJob.html", method=RequestMethod.POST)
	public String triggerJob(HttpServletRequest req){
		Scheduler scheduler = SchedulerController.scheduler;
		String jobState= req.getParameter("jobState");
		String Group = req.getParameter("Group");
		String jobName = req.getParameter("jobName");
		JobKey jobKey=new JobKey(jobName, Group);
		try {
			if(jobState.equalsIgnoreCase("ACQUIRED")){
				System.out.println(jobKey);
				scheduler.pauseJob(jobKey);
				System.out.println("done");
			}
			else if(jobState.equalsIgnoreCase("PAUSED")){
				scheduler.resumeJob(jobKey);
				System.out.println("doneResuing");
			}
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		
		return "";
	}
}
