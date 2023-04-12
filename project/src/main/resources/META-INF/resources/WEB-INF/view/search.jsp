<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Service</title>
</head>
<body onload="showmessage()">
	<form action="SearchBus" method="post">
		Source : <input type="text" name="src"><br>
		Destination : <input type="text" name="dest"><br>
		Date : <input type="date" name="dat"><br>
		No of Seats : <input type="number" name="nseats" value="1"><br>
		<input type="submit" value="Search">
	</form>
	
	<script>
		function showmessage(){
			<c:if test="${not empty message}`>
	        	alert(`${message}`);
		    </c:if>
		}
	</script>
	
	
</body>
</html>