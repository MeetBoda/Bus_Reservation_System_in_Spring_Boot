<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Service</title>
</head>
<body style="font-size:25px;">
	<h1 style="text-align:center;">Make Payment</h1>
	<hr>
	Amount to be Paid : ${totalcost}
	<form action="confirmbooking" method="post">
		<input type="radio" id="UPI" name="payment_way" value="UPI">
		<label for="UPI">UPI</label><br>
		<input type="radio" id="Net-Banking" name="payment_way" value="Net-Banking">
		<label for="Net-Banking">Net-Banking</label><br>
		<input type="radio" id="Debit/Credit Card" name="payment_way" value="Debit/Credit Card">
		<label for="Debit/Credit Card">Debit/Credit Card</label><br>
		<input type="hidden" name="route_id" value="${route_id}">
		<input type="hidden" name="nseats" value="${nseats}">
		<input type="hidden" name="price" value="${price}">
		<input type="submit" value="Pay" style="font-size:25px;">
	</form>
</body>
</html>