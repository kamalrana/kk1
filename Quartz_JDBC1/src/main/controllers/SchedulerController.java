package main.controllers;

import main.form.QuartzForm;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SchedulerController {
	public static Scheduler scheduler; 
	public static QuartzForm quartzform;
	static{
		try {
			scheduler = new StdSchedulerFactory("quartz_JDBC.properties").getScheduler();
			quartzform = new QuartzForm();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/Scheduler.html", method=RequestMethod.GET)
	public String showForm(ModelMap model){
		// existing instance will qartzForm Bean properies null, so the input form contain no values
		model.addAttribute("JobForm", quartzform);
		return "Scheduler";
	}
	
	@RequestMapping("/startScheduler.html")
	public ModelAndView startScheduler(){
		try {
			scheduler.start();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		return new ModelAndView("Scheduler","JobForm", quartzform);
	}
	
	@RequestMapping(value="/pauseScheduler.html",method=RequestMethod.GET)
	public ModelAndView pauseScheduler(ModelMap model){
		try {
			scheduler.standby();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("FORM", new QuartzForm());
		return new ModelAndView("Scheduler","JobForm", quartzform);
	}
	
	@RequestMapping(value="/stopScheduler.html",method=RequestMethod.GET)
	public ModelAndView stopScheduler(){
		try {
			scheduler.shutdown();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		new QuartzForm();
		return new ModelAndView("Scheduler","JobForm", quartzform);
	}
	
}
