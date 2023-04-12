<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Service</title>
<style>
*{
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}

html,body{
    display: grid;
    height: 100%;
    width: 100%;
    place-items: center;
    background: -webkit-linear-gradient(left, #66a1f3, white, #66a1f3);
}
.wrapper{
    max-width: 390px;
    background: #fff;
    padding: 30px;
    border-radius: 5px;
    overflow: hidden;
    box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.1);
}

.wrapper .titletext{
    display: flex;
    width: 200%;
}

.wrapper .titletext .title{
    width: 50%;
    font-size: 35px;
    font-weight: 600;
    text-align: center;
    transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

.wrapper .formcontainer{
    width: 100%;
    overflow: hidden;
}

.formcontainer .slidecontrols{
    position: relative;
    display: flex;
    height: 50px;
    width: 100%;
    border-radius: 5px;
    overflow: hidden;
    justify-content: space-between;
    margin: 30px 0 10px 0;
    border: 1px solid lightgrey;
}

.slidecontrols .slide{
    height: 100%;
    width: 100%;
    z-index: 1;
    color: #fff;
    font-size: 18px;
    font-weight: 500;
    text-align: center;
    line-height: 48px;
    cursor: pointer;
    transition: all 0.6s ease;
}

.slidecontrols .signup{
    color: #000;
}

.slidecontrols .slidetab{
    position: absolute;
    height: 100%;
    width: 50%;
    left: 0;
    z-index: 0;
    border-radius: 5px;
    transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    background: #66a1f3;
}

input[type="radio"]{
    display: none;
}

#signup:checked ~ .slidetab{
    left: 50%;
}

#signup:checked ~ .signup{
    color: #fff;
}

#signup:checked ~ .login{
    color: #000;
}

.formcontainer .forminner{
    display: flex;
    width: 200%;
}
.formcontainer .forminner form{
    width: 50%;
    transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}
.forminner form .field{
    height: 50px;
    width: 100%;
    margin-top: 20px;
}
.forminner form .field input{
    height: 100%;
    width: 100%;
    outline: none;
    padding-left: 15px;
    font-size: 17px;
    border-radius: 5px;
    border: 1px solid lightgrey;
    border-bottom-width: 2px;
    transition: all 0.4s ease;
}
.forminner form .field input:focus{
    border-color: #66a1f3;
}

.forminner form .passlink{
    margin-top: 5px;
}
.forminner form .passlink a,
.forminner form .signuplink a{
    color: #66a1f3;
    text-decoration: none;
}

.forminner form .signuplink{
    text-align: center;
    margin-top: 30px;
}


.forminner form .passlink a:hover,
.forminner form .signuplink a:hover{
    text-decoration: underline;
}

form .field input[type="submit"]{
    color: #fff;
    font-size: 20px;
    font-weight: 500;
    padding-left: 0px;
    border: none;
    cursor: pointer;
    background: #66a1f3;
}
</style>
</head>
<body onload = "login_signup()" >
	<div class="wrapper">
        <div class="titletext">
            <div class="title login"> Login Form</div>
            <div class="title signup"> Signup Form</div>


        </div>
        <div class="formcontainer">
            <div class="slidecontrols">
                <input type="radio" name="slider" id="login" checked>
                <input type="radio" name="slider" id="signup">
                <label for="login" class="slide  login">Login</label>
                <label for="signup" class="slide signup">Signup</label>
                <div class="slidetab"></div>
            </div>


            <div class="forminner">
                <form action="Login" method="POST" class="login">
                    <div class="field">
                        <input type="email" placeholder="Email Address" value="${email}" required name="email">

                    </div>
                    <div class="field">
                        <input type="password" placeholder="Password" value="${password}" required name="password">
                    </div>
                    <!-- <div class="passlink"><a href="#">Forgot Password</a></div> -->
                    <div class="field">
                        <input type="submit" value="Login" id="submit">
                    </div>
                    <div class="signuplink">Not a member?<a href="#">SignUp Now</a></div>
                    <!-- <div>{{msg}}</div> -->
                </form>

                <form action="register" method="post" class="signup">
                    <div class="field">
                        <input type="text" placeholder="Name" required name="name">
                    </div>

                    <div class="field">
                        <input type="email" placeholder="Email Address" required name="email">
                    </div>

                    <div class="field">
                        <input type="number" placeholder="Mobile No" required name="mobile">
                    </div>

                    <div class="field">
                        <input type="password" placeholder="Password" required name="password">
                    </div>
                    
                    <div class="field">
                        <input type="submit" value="Signup">
                    </div>
                </form>
            </div>
        </div>
    </div>

	<script>
		function login_signup(){
	    	<c:if test="${not empty message}">
	        	alert(`${message}`);
	    	</c:if>
	    	<c:if test="${not empty msg}">
        		alert(`${msg}`);
    		</c:if>
	    }
		const loginForm = document.querySelector("form.login");
        const signupForm = document.querySelector("form.signup");
        const loginBtn = document.querySelector("label.login");
        const signupBtn = document.querySelector("label.signup");
        const signupLink = document.querySelector(".signuplink a");
        const loginText = document.querySelector(".titletext .login");
        const signupText = document.querySelector(".titletext signup");

        signupBtn.onclick = (() => {
            loginForm.style.marginLeft = "-50%";
            loginText.style.marginLeft = "-50%";
        });

        loginBtn.onclick = (() => {
            loginForm.style.marginLeft = "0%";
            loginText.style.marginLeft = "0%";
        });

        signupLink.onclick = (() => {
            signupBtn.click();
            return false;
        });
	</script>
	
</body>
</html>