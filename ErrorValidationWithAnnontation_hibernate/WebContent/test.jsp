<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<form name="myForm" onSubmit="return validate();" >
<input id="secretValue" name="secretValue" type="hidden" value="I'm hidden value"/>
<input type="submit" value="save" />
</form>
</body>
<script type="text/javascript">
function validate(){
alert(document.getElementById('secretValue').value);
document.getElementById('secretValue').setAttribute('type', 'show');
}
</script>
</html>