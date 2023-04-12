<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Service</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
    input[type=text], input[type=email], input[type=number], input[type=password]{
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
	<h1 style="text-align: center;">Add Bus Category</h1>
    <form action='addbuscategory' method="post">
        <div class="form-group">
            <label for="exampleInputPassword1">Enter Bus Category Name: </label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="busclass" required>
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
    
</body>
</html>