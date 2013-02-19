package controllers;


import static org.quartz.JobBuilder.newJob;
import static org.quartz.SimpleScheduleBuilder.simpleSchedule;
import static org.quartz.TriggerBuilder.newTrigger;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.catalina.core.ApplicationContext;
import org.quartz.DateBuilder.IntervalUnit;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import form.QuartzForm;

@Controller
@RequestMapping(value="/FormFill.htm")
public class QuartzController{
	
	@RequestMapping(method=RequestMethod.GET)
	public String showForm(ModelMap model){
		QuartzForm form = new QuartzForm();
		model.addAttribute("FORM", form);
		return "FormFill";
	}

	@RequestMapping(method=RequestMethod.POST)
	public String processForm(@ModelAttribute(value="FORM") QuartzForm form,BindingResult result) throws SchedulerException{
		if(result.hasErrors()){
			System.out.println(result.getAllErrors().toString());
			return "FormFill";
		}
		QuartzForm quartDate=(QuartzForm)form;
		String triggerName=form.getTriggerName();
		
    	JobDetail job1=newJob(RunMeJob.class)
			.withIdentity("sd","sd1")
			.build();
    	
    	Trigger trigger = newTrigger()
        .withIdentity("sd2","sd1")
         .startNow()
        .withSchedule(simpleSchedule()
                .withIntervalInSeconds(10)
                .repeatForever())
                .build();
    	
    	//schedule it
    	//ApplicationContext contxt=new ClassPathXmlApplicationContext(configLocation)
    	//Scheduler scheduler = MySchedulerManagerImpl.getScheduler();
    	Scheduler scheduler= new StdSchedulerFactory("quartz_JDBC.properties").getScheduler();
    	scheduler.start();
    	scheduler.scheduleJob(job1, trigger);
			
		
		return "FormFill";
	}
	
}
