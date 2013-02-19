<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="main.form.QuartzForm"%>
<%@page import="java.util.ArrayList"%>
<%@ page session="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>DataTables example</title>
		<style type="text/css" title="currentStyle">
			@import "../js/jsTable/demo_page.css";
			@import "../js/jsTable/demo_table_jui.css";
			@import "../js/jsTable/jquery-ui-1.8.4.custom.css";
		</style>
		<script type="text/javascript" language="javascript" src="../js/jsTable/jquery.js"></script>
		<script type="text/javascript" language="javascript" src="../js/jsTable/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				oTable = $('#example').dataTable({
					"bJQueryUI": true,
					"sPaginationType": "full_numbers"
				});
			} );
			
		</script>
		
		<script type="text/javascript">
/* var cols=new Array();
cols[0]="A";
cols[1]="B";
cols[2]="C"; */
function getData(_row){
   var _temp=document.getElementById("b"+_row).innerHTML;
	alert(_temp);
}
</script>
	</head>
	<body id="dt_example">
		<div id="container">
			
<table cellpadding="0" cellspacing="0" border="1" class="display" id="example">
	<thead>
		<tr>
			<th>Job Name</th>
			<th>Class</th>
			<th>Trigger Name</th>
			<th>Group</th>
			<th>Start Date</th>
			<th>End </th>
		</tr>
	</thead>
	<tbody>
	<%
	ArrayList<QuartzForm> items=(ArrayList<QuartzForm>)request.getAttribute("jobs");
	int i=0;
	for (QuartzForm job : items) {
		out.println("<tr class=\"gradeC\""+ " onclick="+"\"getData"+"("+ i + ")\""+ " id="+"\"b"+ i++ + "\""+">");
		out.println("<td>"+job.getJobName()+"</td>");
        out.println("<td>"+job.getJobClass()+"</td>");
        out.println("<td>"+job.getGroup()+"</td>");
        out.println("<td>"+job.getTriggerName()+"</td>");
        out.println("<td>"+job.getStartDate()+"</td>");
        out.println("<td>"+job.getEndDate()+"</td>");
        out.println("</tr>");
	}
	%>
<tr id="b3" onclick="getData(3)" class="gradeC">
<td><a href="FormFill.html">first</a></td>
<td>controllers.RunMeJob</td>
<td>first</td>
<td>first</td>
<td>1361089680000</td>
<td>1361176020000</td>
</tr>
<tr id="b4" onclick="getData(4)" class="gradeC">
<td>first</td>
<td>controllers.RunMeJob</td>
<td>first</td>
<td>first</td>
<td>1361089680000</td>
<td>1361176020000</td>
</tr>
<tr id="b5" onclick="getData(5)" class="gradeC">
<td>first</td>
<td>controllers.RunMeJob</td>
<td>first</td>
<td>first</td>
<td>1361089680000</td>
<td>1361176020000</td>
</tr>		
<!-- <tr id="b6" onclick="getData(3)" class="gradeC">
<td>first</td>
<td>controllers.RunMeJob</td>
<td>first</td>
<td>first</td>
<td>1361089680000</td>
<td>1361176020000</td>
</tr>
<tr id="b7" onclick="getData(3)" class="gradeC">
<td>second</td>
<td>main.controllers.RunMeJob</td>
<td>secnd</td>
<td>iian</td>
<td>1361122620000</td>
<td>1363541880000</td>
</tr>
<tr id="b8" onclick="getData(3)" class="gradeC">
<td>second</td>
<td>main.controllers.RunMeJob</td>
<td>secnd</td>
<td>iian</td>
<td>1361122620000</td>
<td>1363541880000</td>
</tr>
<tr id="b3" onclick="getData(3)" class="gradeC">
<td>second</td>
<td>main.controllers.RunMeJob</td>
<td>secnd</td>
<td>iian</td>
<td>1361122620000</td>
<td>1363541880000</td>
</tr>
<tr id="b3" onclick="getData(3)" class="gradeC">
<td>first</td>
<td>controllers.RunMeJob</td>
<td>first</td>
<td>first</td>
<td>1361089680000</td>
<td>1361176020000</td>
</tr>
<tr id="b3" onclick="getData(3)" class="gradeC">
<td>first</td>
<td>controllers.RunMeJob</td>
<td>first</td>
<td>first</td>
<td>1361089680000</td>
<td>1361176020000</td>
</tr>
<tr id="b3" onclick="getData(3)" class="gradeC">
<td>first</td>
<td>controllers.RunMeJob</td>
<td>first</td>
<td>first</td>
<td>1361089680000</td>
<td>1361176020000</td>
</tr>		
<tr id="b3" onclick="getData(3)" class="gradeC">
<td>first</td>
<td>controllers.RunMeJob</td>
<td>first</td>
<td>first</td>
<td>1361089680000</td>
<td>1361176020000</td>
</tr>
<tr id="b3" onclick="getData(3)" class="gradeC">
<td>second</td>
<td>main.controllers.RunMeJob</td>
<td>secnd</td>
<td>iian</td>
<td>1361122620000</td>
<td>1363541880000</td>
</tr>
<tr id="b3" onclick="getData(3)" class="gradeC">
<td>second</td>
<td>main.controllers.RunMeJob</td>
<td>secnd</td>
<td>iian</td>
<td>1361122620000</td>
<td>1363541880000</td>
</tr>
<tr id="b3" onclick="getData(3)" class="gradeC">
<td>second</td>
<td>main.controllers.RunMeJob</td>
<td>secnd</td>
<td>iian</td>
<td>1361122620000</td>
<td>1363541880000</td>
</tr> -->
	
	
		<%-- <c:forEach var="job" items="${jobs}">	
		<tr>
			<td>job.jobName</td>
			<td>job.jobClass</td>
			<td>job.triggerName</td>
			<td>job.group</td>
			<td>job.startDate</td>
			<td>job.endDate</td>
		</tr>
	</c:forEach>	 --%>
	</tbody>
</table>
</div>

	</body>
</html>