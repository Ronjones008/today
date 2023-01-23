<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
 
<link rel="stylesheet" href="style.css">

<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
</head>
<body>

<script>
function matchPassword() {
  var pw1 = document.getElementById("pswd1").value;
  var pw2 = document.getElementById("pswd2").value;
  if(pw1 != pw2)
  {    
      alert("Passwords did not match");
  } else {
      alert("Password created successfully");
  }
}
</script>
 

<form>
 


<h3>Create new Password</h3><br>

 
 User Name<input name="userName" value="${param.name}" class="form-control" type="text" required="required"/> <br/><br/>

 Enter Password 
<input type="password" name="password" class="form-control" pattern="/^[a-zA-Z0-9!@#\$%\^\&*_=+-]{8,12}$/g" id="pswd1" required="required"> <br/><br/>

 Confirm Password
<input type="password" name="passcode" class="form-control" pattern="/^[a-zA-Z0-9!@#\$%\^\&*_=+-]{8,12}$/g" id = "pswd2" required="required"> <br/><br/>

<c:set var="password" value="${param.password }"/>
		<c:set var="password1" value="${param.passcode }"/>
		<c:set var="userName" value="${param.userName }"/>
	 	<c:if test="${password != null && password1 !=null  && password==password1 }">
<c:if test="${password != password1}">
		<c:out value="Password did not match"/>
		</c:if>
</c:if>

 
<button type = "submit"  class="btn btn-secondary">Submit</button>
 
<button type = "reset" value = "Reset" class="btn btn-secondary">Clear</button>&nbsp;
                    <a href="CustomerLoginjsp.jsp"  class="btn btn-secondary">Back</a>



</form> 
		
	 	<c:if test="${password != null && password1 !=null  && password==password1 }">
			<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.CustomerDAO"/>
			${beanDao.forgetPassword(userName, password)}
			<c:redirect url="CustomerLoginjsp.jsp"/> 
			
		</c:if>
		

</body>
</html>

