<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="main.form.QuartzForm"%>
<%@page import="main.*"%>
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
var oTable;
var jobName,Class,Trigger,Group,jobState,Start,End;
			$(document).ready(function() {
				/* Add a click handler to the rows - this could be used as a callback */
				$("#example tbody tr").click( function( e ) {
					if ( $(this).hasClass('row_selected') ) {
						$(this).removeClass('row_selected');
					}
					else {
						oTable.$('tr.row_selected').removeClass('row_selected');
						$(this).addClass('row_selected');
					}
					if(jobState=="ACQUIRED"){
					document.getElementById("triggerJob").innerHTML="Pause Job";
					}
					else if(jobState=="WAITING"||"PAUSED"){
						document.getElementById("triggerJob").innerHTML="Resume Job";
					}
				});
				
				/* Add a click handler for the delete row */
				$('#delete').click( function() {
					var anSelected = fnGetSelected( oTable );
					if ( anSelected.length !== 0 ) {
						oTable.fnDeleteRow( anSelected[0] );
					}
					  $.ajax({  
						    type: "POST",  
						    url: "deleteJob.html",  
data: "jobName=" + jobName+"&Class="+Class+"&Trigger="+Trigger+"&Group="+Group+"&Start="+Start+"&End="+End,
						    success: function(response){  
						      // we have the response  
						     alert('sucess');
						    },  
						    error: function(e){  
						      alert('Error: ' + e);  
						    }  
						  });
					
				} );
				
				/* Init the table */
				oTable = $('#example').dataTable( );
			} );
			
			/* Get the rows which are currently selected */
			function fnGetSelected( oTableLocal )
			{
				return oTableLocal.$('tr.row_selected');
			}

function getData(_row){
	jobName=document.getElementById("a"+_row).innerHTML;
	Class=document.getElementById("b"+_row).innerHTML;
	Trigger=document.getElementById("c"+_row).innerHTML;
	Group=document.getElementById("d"+_row).innerHTML;
	jobState=document.getElementById("e"+_row).innerHTML;
	Start=document.getElementById("f"+_row).innerHTML;
	End=document.getElementById("g"+_row).innerHTML;
}
</script>
<script type="text/javascript">
$(document).ready(function(){
    $("#triggerJob").click(function() {
        $.ajax({
            url:  "triggerJob.html",
            type: 'POST', 
			data: "jobState="+jobState+"&Group="+Group+"&jobName="+jobName,
			success: function(response){  
						     location.reload(true);
						    },  
						    error: function(e){  
						    	location.reload(true);						      
						    } 
        });
    });
});
</script>
	</head>
	
<body id="dt_example">
<div id="container" style="border:1px solid black;">
<div style="background-color: silver;">
<p><button type="button" id="delete">Delete Job</button>
<button type="button" id="triggerJob" style="float: right;position: absolute;" >Pause Job</button>
<button type="button" id="addJob" style="float: right" onclick="location.href='Scheduler.html'">Add Job</button></p>
</div>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Job Name</th>
			<th>Class</th>
			<th>Trigger Name</th>
			<th>Group</th>
			<th>Job State</th>
			<th>Start Date</th>
			<th>End Date</th>
		</tr>
	</thead>
	<tbody>
	<%
	ArrayList<QuartzForm> items=(ArrayList<QuartzForm>)request.getAttribute("jobs");
	int i=0;
	for (QuartzForm job : items) {
		out.println("<tr class=\"gradeC\""+ " onclick="+"\"getData"+"("+ i + ")\""+">");
		out.println("<td id=\"a"+i+"\">"+job.getJobName()+"</td>");
        out.println("<td id=\"b"+i+"\">"+job.getJobClass()+"</td>");
        out.println("<td id=\"c"+i+"\">"+job.getTriggerName()+"</td>");
        out.println("<td id=\"d"+i+"\">"+job.getGroup()+"</td>");
        out.println("<td id=\"e"+i+"\">"+job.getJobState()+"</td>");
		out.println("<td id=\"f"+i+"\">"+job.getStartDate()+"</td>");
		out.println("<td id=\"g"+i+"\">"+job.getEndDate()+"</td>");i++;
        out.println("</tr>");
	}
	%>
<tr onclick="getData(3)" class="gradeC">
<td id="a3">firstsssssssss</td>
<td id="b3">RunMeJob</td>
<td id="c3">fisddddddddddddrst</td>
<td id="d3">first</td>
<td id="e3">ACQUIRED</td>
<td id="f3">12/27/2013 11:02:00 PM</td>
<td id="g3">03/27/2013 11:02:00 PM</td>
</tr>
<tr onclick="getData(4)" class="gradeC">
<td id="a4">firstddddd</td>
<td id="b4">RunMeJob</td>
<td id="c4">first</td>
<td id="d4">first</td>
<td id="e4">ACQUIRED</td>
<td id="f4">03/27/2013 11:02:00 PM</td>
<td id="g4">04/27/2013 11:02:00 PM</td>
</tr>
<tr onclick="getData(5)" class="gradeC">
<td id="a5">first</td>
<td id="b5">RunMeJob</td>
<td id="c5">first</td>
<td id="d5">first</td>
<td id="e5">WAITING</td>
<td id="f5">03/27/2013 11:02:00 PM</td>
<td id="g5">05/27/2013 11:02:00 PM</td>
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