package main.controllers;


import static org.quartz.JobBuilder.newJob;
import static org.quartz.SimpleScheduleBuilder.simpleSchedule;
import static org.quartz.TriggerBuilder.newTrigger;

import java.util.Date;

import main.form.QuartzForm;

import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuartzController{
	public static Scheduler scheduler; 
	static{
		try {
			scheduler = new StdSchedulerFactory("quartz_JDBC.properties").getScheduler();
			//scheduler.start();
			/*PrintWriter out = new PrintWriter(new BufferedWriter(
					new FileWriter("C:\\Users\\kamal\\Music\\kk.txt", true)));
			out.println("scheduler started");
			out.close();*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/FormFill.html", method=RequestMethod.GET)
	public String showForm(ModelMap model){
		QuartzForm form = new QuartzForm();
		model.addAttribute("FORM", form);
		return "FormFill";
	}

	@RequestMapping(value="/FormFill.html", method=RequestMethod.POST)
	public ModelAndView processForm(@ModelAttribute(value="FORM") QuartzForm form,BindingResult result) throws SchedulerException{
		String addJobMessage="";
		if(result.hasErrors()){
			System.out.println(result.getAllErrors().toString());
			addJobMessage="There was an error in result verification";
			return new ModelAndView("FormFill", "addJobMessage", addJobMessage);
		}
		if(!scheduler.isStarted()){
			addJobMessage="schedular is not started yet - but ";
		}
		QuartzForm form1=(QuartzForm)form;
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
    	return new ModelAndView("FormFill", "addJobMessage", addJobMessage);
	}
	
}

