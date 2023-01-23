<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
<center> <h1>INVENTORY MANAGEMENT</h1></center> 
<hr>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Customer</title>
</head>
<body>

<c:if test="${userName == null }">
		<c:redirect url="CustomerLoginjsp.jsp"></c:redirect>
	</c:if>
<jsp:include page="CustomerMenu.jsp"></jsp:include>
<jsp:useBean id="dao" class="com.Infinite.inventoryproject.CustomerDAO"></jsp:useBean>
	
	<c:set var="customers" value="${dao.searchCustomer(cid)}"/>
	<div class="align-items-center" style="width: 400px;display:flex;align-items:center;justify-content:center">
		<form action="UpdateCustomer.jsp">
			<div  class="mb-3 formI">
			<label style="width:27%">Customer Id:</label>
			<input name="customerid" style="width:70%" class="form-control" type="text" value="${cid}" readonly>
			</div>
			<div  class="mb-3 formI">
			<label style="width:27%">Customer Name:</label>
			<input name="customerName" style="width:70%" class="form-control" type="text" pattern="[A-Za-z]+\s[A-Za-z]+{1,15}" value="${customers.customerName }" required>
			</div>
			<div  class="mb-3 formI">
			<label style="width:27%">Customer Phone Number:</label>
			<input name="customerPhoneNo" style="width:70%" class="form-control" type="text" value="${customers.customerPhoneNo }" maxlength="10" required>
			</div>
			<div class="mb-3 formI">
			<label style="width:27%">address1:</label>
			<input name="address1" style="width:70%" class="form-control" type="text" value="${customers.address1}" required maxlength="25">
			</div>
			<div  class="mb-3 formI">
			<label style="width:27%">address2:</label>
			<input name="address2" style="width:70%" class="form-control" type="text" value="${customers.address2}"required  maxlength="25">
			</div>
			<div  class="mb-3 formI">
			 <label style="width:27%">Pincode:</label>
			<input name="zipcode" style="width:70%" class="form-control" type="number" value="${customers.zipcode}"required maxlength="6" >
			</div>
			<div  class="mb-3 formI">
			 <label style="width:27%">User Name:</label>
			<input name="userName" style="width:70%" class="form-control" type="text" value="${customers.userName}" readonly>
			</div>
			
			
			
			<div class="mb-3 formI">
			 <label style="width:27%">city:</label>
			<input name="city" style="width:70%" class="form-control" type="text"  pattern="[A-Za-z]{1,15}"  value="${customers.city}" required>
			</div>
			<input type="submit" class="btn btn-primary"  value="Update">
			</form>	
	</div>
	<c:if test="${param.customerName != null }">
		<jsp:useBean id="customer" class="com.Infinite.inventoryproject.Customer"/>
		<jsp:useBean id="beanDAO" class="com.Infinite.inventoryproject.CustomerDAO"/>				
		<jsp:setProperty property="*" name="customer"/>
		<c:out value="${beanDAO.updateCustomer(customer)}"/>
		<c:redirect url="CustomerPageShow.jsp"></c:redirect>
		
	</c:if>
	
</body>
</html>