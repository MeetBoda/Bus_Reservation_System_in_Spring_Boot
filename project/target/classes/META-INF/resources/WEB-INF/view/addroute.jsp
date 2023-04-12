<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Service</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<style>
    input[type=text], input[type=date], input[type=number], input[type=time]{
      width: 600px;
      border: 1px solid black;
    }
    select{
      width: 600px;
      border: 1px solid black;
      border-radius: 5px;
      height: 38px;
    }
    form {
        margin-left: 40px;
    }
</style>
</head>
<body onload="display()">
	<h1 style="text-align: center;">Add Bus Route</h1>
    <form action='addbusroute' method="post">
        <div class="form-group">
            <label for="exampleInputPassword1">Enter Source : </label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="src" required>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Enter Destination : </label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="dest" required>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Enter Date : </label>
            <input type="date" class="form-control" id="exampleInputPassword1" name="dat" required>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Enter Time: </label>
            <input type="time" class="form-control" id="exampleInputPassword1" name="time" required>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Enter Seats Available: </label>
            <input type="number" class="form-control" id="exampleInputPassword1" name="nseats" required>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Enter Price: </label>
            <input type="number" class="form-control" id="exampleInputPassword1" name="price" required>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Select Bus Class : </label>
            <select name="busclass" id="role" class="form-select" style="height: 50px; width: 600px;">
            	<c:forEach items="${list}" var="i">
            		<option value="${i.bustype}">${i.bustype}</option>
            	</c:forEach>
             </select>
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
    </form>
    <script>
    	function display(){
    		<c:if test="${not empty message}">
	        	alert(`${message}`);
		    </c:if>
    	}
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>