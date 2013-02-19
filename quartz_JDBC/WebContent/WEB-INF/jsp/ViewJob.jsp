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
var oTable;
var temp;
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
				});
				
				/* Add a click handler for the delete row */
				$('#delete').click( function() {
					var anSelected = fnGetSelected( oTable );
					if ( anSelected.length !== 0 ) {
						oTable.fnDeleteRow( anSelected[0] );
					}
					  $.ajax({  
						    type: "POST",  
						    url: "Jobs.html",  
						    data: "data=" + temp,  
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

			/* var cols=new Array();
cols[0]="A";
cols[1]="B";
cols[2]="C"; */
function getData(_row){
   temp=document.getElementById("b"+_row).innerHTML;
}
</script>
	</head>
	
	<body id="dt_example">
		<div id="container">
<!-- <p><a href="javascript:void(0)" id="delete">Delete selected row</a></p> -->
<p><button type="button" id="delete">Delete</button></p>
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
<td>first</td>
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