package main.controllers;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class RunMeJob implements Job {
	public void execute(JobExecutionContext context)
			throws JobExecutionException {
		try {
			PrintWriter out = new PrintWriter(new BufferedWriter(
					new FileWriter("C:\\Users\\kamal\\Music\\kk.txt", true)));
			out.println("running : " + new Date() + " job name : "
					+ context.getJobDetail().getKey() + " & trigger is : "
					+ context.getTrigger().getKey());
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("runniong : " + new Date() + " job name : "
				+ context.getJobDetail().getKey() + " & trigger is : "
				+ context.getTrigger().getKey());
	}

}
