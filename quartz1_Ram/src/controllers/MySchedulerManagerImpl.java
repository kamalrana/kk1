package controllers;

import org.quartz.Scheduler;

public class MySchedulerManagerImpl {
	   public static Scheduler scheduler=null;

	   public MySchedulerManagerImpl(final Scheduler scheduler) {
		      this.scheduler = scheduler;
		   }

	public static Scheduler getScheduler() {
		return scheduler;
	}
		}