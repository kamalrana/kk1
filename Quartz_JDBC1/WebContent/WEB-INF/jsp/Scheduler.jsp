<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="../js/jquery.ui.timepicker.css?v=0.3.2" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.timepicker.js?v=0.3.2"></script>
	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
      <style type="text/css">
       body { font-size: 10px; /* for the widget natural size */ }
        button.ui-datepicker-close {display: none;}
        </style> 	
	<script>
  $(function() {
    $( ".datepicker1" ).datepicker({
	  showOn: "button",
	  showButtonPanel: true,
	  buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
      buttonImageOnly: true,
	  changeMonth: true,
      changeYear: true,
	  minDate: new Date(),
	  });
  });
  $(document).ready(function() {
      $('.timepicker1').timepicker({
		showNowButton: true,
		showOn: 'button',
		button: $('.timepicker_button_trigger'),
		showDeselectButton: true,
      	showPeriod: true,
		showCloseButton: true,
      showLeadingZero: true
      });
  });
	
$(document).ready(function() {
      $('.timepicker2').timepicker({
		showNowButton: true,
		showOn: 'button',
		button: $('.timepicker_disable_button_trigger'),
		showDeselectButton: true,
      showPeriod: true,
		showCloseButton: true,
      showLeadingZero: true
      });
  });
  
	</script>
	</head> 
	<body>
	<div style="border:2px solid black;float:left;border-color:yellow;">
		<h1><a href="Jobs.html">view jobs</a></h1>
		<p>${addJobMessage}</p></br>
		<form:form commandName="JobForm" action="addJob.html" method="POST" >
		<table  border="1" cellspacing="10" style="font-size:15px">
			<th width="97">New Job</th>
			<tr>
			<td>Job Name</td>
			<td width="185"><form:input id="jobName" path="jobName" width="300" height="900"/></td>
			<td width="105">Job Class</td>
			<td width="268"><form:input id="jobClass" path="jobClass" /></td>
			</tr>
			<tr>
			<td>Group</td>
			<td><form:input id="group" path="group" /></td>
			<td>Trigger Name</td>
			<td><form:input id="triggerName" path="triggerName" /></td>
			</tr>
			<tr>
			<td>start now</td>
			<td><form:radiobutton path="startNow" value="yes" label="Yes" />
			<form:radiobutton path="startNow" value="no" label="No" /></td>
			<td>Repeate forever</td>
			<td>
			<form:select path="repeate">
			<form:option value="yes" label="yes" />
			<form:option value="no" label="no" />
			</form:select>
			</td>
			
			</tr>
			
			<tr>
			<td>Start Date</td>
			<td><form:input path="startDate" id="startDate" value="" class="datepicker1"/></td>
			<td>Start Time</td>
			<td><form:input path="startTime" id="startTime" value="" class="timepicker1"/>
			<img src="../images/time_clock.png"
					alt="time" height="20" width="20"
					class="timepicker_button_trigger" /></td>
			</tr>
			<tr>
			<td>End Date</td>
			<td><form:input id="endDate" path="endDate" class="datepicker1" value=""/></td>
			<td>End Time</td>
			<td><form:input id="endTime" path="endTime" class="timepicker2" value=""/>
			<img src="../images/time_clock.png"
					alt="time" height="20" width="20"
					class="timepicker_disable_button_trigger" /></td>
			</tr>
			<%-- <tr>
			<td>Interval</td>
			<td><form:input id="interval" path="interval" /></td>
			</tr> --%>
			</table>
			<tr><td colspan="2"><input type="submit" value="Save Changes" width="258"/></td></tr>
		</form:form>
	</div>	
<div style="border:1px solid black;border-color:black;margin-left:65%;margin-top: 3%;font-size:15px">
<table style="border: 1px solid black;" cellspacing="10">
<tr>
<td>start schedular : </td><td><button type="button" id="startSchedular" onclick="location.href='startScheduler.html'">Start Schedular</button></td>
<%-- <td>${startMessage}</td> --%>
</tr>
<tr></tr>
<tr>
<td>Pause schedular : </td><td><button type="button" id="pauseSchedular" onclick="location.href='pauseScheduler.html'">Pause schedular</button></td>
<%-- <td>${pauseMessage}</td> --%>
</tr>
<tr></tr>
<tr>
<td>Stop schedular : </td><td><button type="button" id="stopSchedular" onclick="location.href='stopScheduler.html'">Stop Schedular</button></td>
<%-- <td>${stopMessage}</td> --%>
</tr>
</table>		
</div>
</body>
</html>