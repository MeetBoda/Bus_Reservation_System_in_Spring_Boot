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
<body onload="display()">
		<table>
        	<tr>
        		<th>Source</th>
        		<th>Destination</th>
        		<th>Date</th>
        		<th>Time</th>
        		<th>No of Seats Booked</th>
        	</tr>
		    <c:forEach items="${bookings}" var="i">
			        <tr>
			            <td>${i.route_id.src}</td>
			            <td>${i.route_id.dest}</td>
			         	<td>${i.route_id.date}</td>
			         	<td>${i.route_id.time}</td>
			      		<td>${i.seats_booked}</td> 
			      		<td><form method="post" action="cancel">
			      			<input type="hidden" name="booking_id" value="${i.booking_id}">
			      			<input type="hidden" name="route_id" value="${i.route_id.route_id}">
			      			<input type="hidden" name="nseats" value="${i.seats_booked}">
			      			<c:if test="${i.route_id.date < curr_date}">
			      				<input type="submit" value="Cancel Booking" disabled="true">
			      			</c:if>
			      			<c:if test="${i.route_id.date == curr_date && i.route_id.time < curr_time}">
			      				<input type="submit" value="Cancel Booking" disabled="true">
			      			</c:if>
			      			<c:if test="${i.route_id.date == curr_date && i.route_id.time >= curr_time}">
			      				<input type="submit" value="Cancel Booking">
			      			</c:if>
			      			<c:if test="${i.route_id.date > curr_date}">
			      				<input type="submit" value="Cancel Booking">
			      			</c:if>
			      		</form></td>
			        </tr>
		    </c:forEach>
		</table>
		
		<script>
		function display(){
			<c:if test="${not empty message}">
        		alert("${message}");
	    	</c:if>
		}
	</script>

</body>
</html>