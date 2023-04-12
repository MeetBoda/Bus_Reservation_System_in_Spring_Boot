<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Service</title>
<style>
    h1{ 
        text-align:center;
        font-family: 'Pacifico', cursive;
        background-color:black;
        color:white;
    }
    table {
        font-family: times new roman, sans-serif;
        border-collapse: collapse;
        width:100%;
    }
    th {
        border: 1px solid silver;
        background-color:black;
        color:white;
        padding: 12px;
        font-family: 'Pacifico', cursive;
        font-size:25px;
    }
    td {
        border: 1px solid silver;
        text-align: left;
        padding: 12px;
        font-size:25px;
        font-family: 'Pacifico', cursive;
    }
        tr:nth-child(odd) {
        background-color:#66A1F3;
    }
        tr:nth-child(even) {
        background-color:  rgb(114, 133, 231);
    }

    p{
        font-size: 25px;
        margin-left: 50px;
        text-align:center;
        font-family: 'Pacifico', cursive;
    }
    input[type=submit]{
        font-size:25px;
        font-family: 'Pacifico', cursive;
        /* margin-left:47%; */
    }
</style>
</head>
<body onload="showmessage()">
	<table>
        	<tr>
        		<th>Source</th>
        		<th>Destination</th>
        		<th>Time</th>
        		<th>Price</th>
        		<th>Class</th>
        		<th>Seats Left</th>
        	</tr>
		    <c:forEach items="${routes}" var="i">
		    	<c:if test="${i.seats_left >= nseats}">
			        <tr>
			            <td><c:out value="${i.src}"/></td>
			            <td><c:out value="${i.dest}"/></td>
			         	<td><c:out value="${i.time}"/></td>
			         	<td><c:out value="${i.price}"/></td>
			         	<td><c:out value="${i.bus_class_id.bustype}"/></td>
			      		<td><c:out value="${i.seats_left}"/></td> 
			      		<td><form method="post" action="book">
			      			<input type="hidden" name="route_id" value="${i.route_id}">
			      			<input type="hidden" name="price" value="${i.price}">
			      			<input type="hidden" name="nseats" value="${nseats}">
			      			<c:if test="${i.date < curr_date}">
			      				<input type="submit" value="Book" disabled="true">
			      			</c:if>
			      			<c:if test="${i.date >= curr_date}">
			      				<input type="submit" value="Book">
			      			</c:if>
			      		</form></td>
			        </tr>
			   </c:if>
		    </c:forEach>
		</table>
		
		<script>
			function showmessage(){
				<c:if test="${not empty msg}">
	        		alert("${msg}");
		    	</c:if>
			}
		</script>
</body>
</html>