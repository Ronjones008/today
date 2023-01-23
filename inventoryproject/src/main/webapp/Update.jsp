<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script >

 

   function validateInput(regexString) {
        var theEvent = window.event || event;
        var key = theEvent.keyCode || theEvent.which;
        if (key >= 46) {
            key = String.fromCharCode(key);
            var regex = new RegExp("^" + regexString + "$");
            if (!regex.test(key)) {
                theEvent.returnValue = false;
                if (theEvent.preventDefault) {
                    theEvent.preventDefault();

 

                }
            }
        }
    }

 

</script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
      <center><h1>INVENTORY MANAGEMENT</h1></center>
      <hr>
</head>
<body>
<jsp:include page="AdminMenu.xhtml"></jsp:include>
<center><br><b>Update Details</b></center> <br><br>
<jsp:useBean id="beanDao" class="com.Infinite.inventoryproject.StockDAO"></jsp:useBean>
	<c:if test="${param.id != null }">
		<c:set var="stock" value="${beanDao.searchStock(param.id) }" />
		<div>
		<form>
		<center>
		
			Stock Id:
			<input name="stockid" class="form-control" value="${param.id }" readonly>
			
			Item Name:
			<input name="itemName" class="form-control" type="text" onkeypress="validateInput('[A-Za-z ]*')" value="${stock.itemName}" required >
			
			Price:
			<input name="price" class="form-control" type="text" value="${stock.price}" pattern="^[1-9][0-9]*$" required/>
			
			Quantity Available:
			<input name="quantityAvail" class="form-control" type="text" value="${stock.quantityAvail}" 
			pattern="^[1-9][0-9]*$" required><br/>
			<input type=submit class="btn btn-primary">
			</center>
			
		</form>	</div>
	</c:if>
	<c:if test="${param.stockid != null && param.itemName != null }">
		<jsp:useBean id="stock" class="com.Infinite.inventoryproject.StockDetails"/>
		<jsp:setProperty property="*" name="stock"/>
		
		<c:out value="${beanDao.updateStock(stock)}"/>
		<c:redirect url="ShowStockAdmin.jsp"></c:redirect>
	</c:if>
	
</body>
</html>