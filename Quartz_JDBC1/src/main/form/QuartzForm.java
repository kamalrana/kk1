package main.form;

import org.quartz.JobKey;


public class QuartzForm {
	
	private String jobName;
	private String jobClass;
	private String group;
	private String triggerName;
	private String interval;
	private String repeate;
	private String startNow;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private JobKey jobKey;
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getJobClass() {
		return jobClass;
	}
	public void setJobClass(String jobClass) {
		this.jobClass = jobClass;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getTriggerName() {
		return triggerName;
	}
	public void setTriggerName(String triggerName) {
		this.triggerName = triggerName;
	}
	public String getInterval() {
		return interval;
	}
	public void setInterval(String interval) {
		this.interval = interval;
	}
	public String getRepeate() {
		return repeate;
	}
	public void setRepeate(String repeate) {
		this.repeate = repeate;
	}
	public String getStartNow() {
		return startNow;
	}
	public void setStartNow(String startNow) {
		this.startNow = startNow;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public JobKey getJobKey() {
		return jobKey;
	}
	public void setJobKey(JobKey jobKey) {
		this.jobKey = jobKey;
	}
	
}
