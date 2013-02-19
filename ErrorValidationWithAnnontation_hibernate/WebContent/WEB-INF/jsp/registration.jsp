<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Hello World with Spring 3 MVC</title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
  <style>
span { color:red; }
</style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
	<body>
		<h1>Registration Form</h1><br />
		<!-- onSubmit="return validate(this.name,this.standard,this.age,this.phone,this.email,false);" -->
<form:form commandName="Registration" method="POST">
		<table>
			<%-- <tr><td colspan="2"><form:errors path="age" cssStyle="color : red;"/></td></tr> --%>
			<tr><td>Name : </td><td><form:input id="name" path="name" onmouseover="txtToolTip(this.id)"/></td>
			<td><span id="nameError" style="display: none">Please enter your name text in correct format (limit is 3 to 15 words) like kamal kishor rana</span></td>
			<td colspan="2"><form:errors path="name" cssStyle="color : red;"/></td>
			</tr>
			<tr><td>Standard : </td><td><form:input id="standard" path="standard" onmouseover="txtToolTip(this.id)"/></td>
			<td><span id="standardError" style="display: none">Please enter your Correct education qualification (limit is 3 to 15 words) like M.Tech,B.Tech,MCA,BCA. etc</span></td>
			<td colspan="2"><form:errors path="standard" cssStyle="color : red;"/></td>
			</tr>
			<tr><td>Age : </td><td><form:input id="age" path="age" onmouseover="txtToolTip(this.id)" /></td>
			<td><span id="ageError" style="display: none">Please enter correct age (limit is 2 digit)</span></td>
			<td colspan="2"><form:errors path="age" cssStyle="color : red;"/></td>
			</tr>
			<tr><td>Sex : </td><td><form:select id="sex" path="sex" onmouseover="txtToolTip(this.id)">
					<form:option value="Male"/>
					<form:option value="Female"/>
            </form:select></td></tr>
			<tr><td>Phone : </td><td><form:input path="phone" id="phone" onmouseover="txtToolTip(this.id)"/></td>
			<td><span id="phoneError" style="display: none">Please enter a correct phone number (limit is 5 to 10 digit)</span></td>
			<td colspan="2"><form:errors path="phone" cssStyle="color : red;"/></td>
			</tr>
			<tr><td>Email : </td><td><form:input id="email" path="email" onmouseover="txtToolTip(this.id)"/></td>
			<td><span id="emailError" style="display: none">Please enter a correct email address or leave the field blank</span></td>
			<td colspan="2"><form:errors path="email" cssStyle="color : red;"/></td>
			</tr>

			<tr><td colspan="2"><input type="submit" value="Save Changes" /></td></tr>
		</table>
	</form:form>
</body>
	
<script type="text/javascript">
function txtToolTip(txtname)
{
	if(document.getElementById('Standard')){
document.getElementById('Standard').title = 'like M.Tech,B.Tech,MCA,BCA. etc';
	}
	if(document.getElementById('name')){
		document.getElementById('name').title = 'like kamal kishor rana';
			}
	if(document.getElementById('age')){
		document.getElementById('age').title = 'enter only integer';
			}
	if(document.getElementById('sex')){
		document.getElementById('sex').title = 'Male or Female';
			}
	if(document.getElementById('email')){
		document.getElementById('email').title = 'like xyz@xyz.com';
			}
	if(document.getElementById('phone')){
		document.getElementById('phone').title = 'enter only phone number between 5-10 numbers';
			}
}
function validate(name,standard,age,phone,email,optional){
	var valid=1;
	if(name.id=='name')
			{
				var field=name;
				var isVisible = document.getElementById(field.id+'Error').offsetWidth > 0 || document.getElementById(field.id+'Error').offsetHeight > 0;
				if(!field.value || field.value.length < 3 || field.value.max > 15)
					{
					valid=0;
					$("#"+field.id+"Error").show("slow");
					}
				else if(isVisible){
					$("#"+field.id+'Error').hide();}
			}
			if(standard.id=='standard')
			{
				var field=standard;
				var isVisible = document.getElementById(field.id+'Error').offsetWidth > 0 || document.getElementById(field.id+'Error').offsetHeight > 0;
				if(!field.value || field.value.length < 3 || field.value.max > 15)
					{
					valid=0;
					$("#"+field.id+"Error").show("slow");
					}
				else if(isVisible){
					$("#"+field.id+'Error').hide();}
			}
			
			if(age.id=='age')
			{
				var field=age;
				var isVisible = document.getElementById(field.id+'Error').offsetWidth > 0 || document.getElementById(field.id+'Error').offsetHeight > 0;
				if (parseInt(field.value) != field.value ||  field.value.length < 2 || field.value.length > 2)
					{
					valid=0;
					$("#"+field.id+"Error").show("slow");
					}
				else if(isVisible){
					$("#"+field.id+'Error').hide();}
			}
			if(phone.id=='phone')
			{
				var field=phone;
				var isVisible = document.getElementById(field.id+'Error').offsetWidth > 0 || document.getElementById(field.id+'Error').offsetHeight > 0;
				if (parseInt(field.value) != field.value ||  field.value.length < 5 || field.value.length > 10)
					{
					valid=0;
					$("#"+field.id+"Error").show("slow");
					}
				else if(isVisible){
					$("#"+field.id+'Error').hide();}
			}
			if(email.id=='email')
			{
				var field=email;
				var isVisible = document.getElementById(field.id+'Error').offsetWidth > 0 || document.getElementById(field.id+'Error').offsetHeight > 0;
				if (!field.value && optional) {
				valid=1;
				}
				var x=email.value;
				var atpos=x.indexOf("@");
				var dotpos=x.lastIndexOf(".");
				if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
					{
					valid=0;
					$("#"+field.id+"Error").show("slow");
					}
				else if(isVisible){
					$("#"+field.id+'Error').hide();}
			}
if(!valid){
	return false
	}
}

</script>
</html>

<%-- Spring provided ui taglibs for form elements.
<form:errors /> element shows form input errors and any other error associated with	the form data --%>