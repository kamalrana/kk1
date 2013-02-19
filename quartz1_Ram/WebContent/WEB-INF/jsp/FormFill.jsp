<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" >
	</head>
	<body>
		<h1></h1><br />
		<form:form commandName="FORM" enctype="multipart/form-data" method="POST">
		<table border="1" cellspacing="10">
			<tr>
			<td>Job Name</td>
			<td><form:input id="jobName" path="jobName" /></td>
			</tr>
			<tr>
			<td>Job Class</td>
			<td><form:input id="jobClass" path="jobClass" /></td>
			</tr>
			<tr>
			<td>Group</td>
			<td><form:input id="group" path="group" /></td>
			</tr>
			<tr>
			<td>Trigger Name</td>
			<td><form:input id="triggerName" path="triggerName" /></td>
			</tr>
			<tr>
			<td>start now</td>
			<td><form:radiobutton path="startNow" value="yes" label="Yes" />
			<form:radiobutton path="startNow" value="no" label="No" /></td>
			</tr>
			<tr>
			<td>Start Time</td>
			<td><form:input id="startTime" path="startTime" /></td>
			</tr>
			<tr>
			<td>End Time</td>
			<td><form:input id="endTime" path="endTime" /></td>
			</tr>
			<tr>
			<td>Interval</td>
			<td><form:input id="interval" path="interval" /></td>
			</tr>
			<tr>
			<td>Repeate forever</td>
			<td>
			<form:select path="repeate">
			<form:option value="yes" label="yes" />
			<form:option value="no" label="no" />
			</form:select>
			</td>
			</tr>
			</table>
			<tr><td colspan="2"><input type="submit" value="Save Changes" /></td></tr>
		</form:form>
	</body>
</html>