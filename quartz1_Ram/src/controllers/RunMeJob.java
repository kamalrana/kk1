package controllers;



import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class RunMeJob implements Job
{
	public void execute(JobExecutionContext context)
	throws JobExecutionException {
		System.out.println("runniong : "+new Date()+ " job name : "+context.getJobDetail().getKey() +" & trigger is : "+context.getTrigger().getKey());
	}
	
}
