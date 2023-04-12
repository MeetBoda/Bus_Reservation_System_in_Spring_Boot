<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Service</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,100,500,300italic,500italic,700italic,900,300);

html, body {
  margin: 0;
  padding: 0;
  font-family: "Roboto", 'Helvetica Neue, Helvetica, Arial';
}
ul {
	padding: 0;
	margin: 0;
}
li {
	list-style: none;
}
figure {
	margin: 0;
}
body {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}
.main {
	width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #66a1f3;	
}
.app {
	width: 375px;
	height: 667px;
	border: 1px solid #efefef;
	position: relative;
  background-color: white;
  border-radius: 10px;
  overflow: hidden;
}

/* ========== Home ========== */
.screen-home__location,
.screen-home__date {
	margin-bottom: 30px;
}
.screen-home {
  width: 100%;
  position: absolute;
  z-index: 1;
}
.screen-home__form-wrap {
  padding: 0 1rem;
}
.screen-home__form {
	padding: 40px 0 0 0;
}
.screen-home__location .lable {
	display: flex;
  align-items: center;
}
.lable {
	display: flex;
  align-items: center;
  margin-bottom: 10px;
}
.lable .icon {
	margin: 0 10px 0 0;
}
.lable .text {
	font-family: roboto;
}
.inside-wrap {
	background-color: #66A1F3;
  /*padding: 10px 0px;*/
  position: relative;
  border-radius: 5px;
}
.inside-lable {
  font-size: 0.7rem;
  padding: 0px 0 5px 0;
  display: inline-block;
}
.input {
	width: 100%;
  border: 0;
  padding: 8px 0;
  font-size: 1.4rem;
  background: none;
  outline: none;
  color: #ffffff;
}
 .from {
 	border-bottom: 2px solid #ffffff;
 }
.from, .to {
	padding: 8px 15px;
}
.rotate-btn {
  position: absolute;
  right: 20px;
  height: 100%;
  display: flex;
  align-items: center;
}
.rotate-btn figure {
	margin: 0;
  width: 40px;
  height: 40px;
  background-color: #ffffff;
  border-radius: 100px;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 2px solid #66a1f3;
}
.screen-home__date .inside-wrap {
	display: flex;
	padding: 4px 15px;
}
.onward {
  	width: 50%;
	position: relative;
	/* z-index:50px; */
}
.return {
  width: calc(50% - 15px);
  padding-left: 15px;
}
.onward:before {
	content: '';
  position: absolute;
  width: 1px;
  height: 35px;
  background-color: #ffffff;
  right: 0;
  top: 0;
  bottom: 0;
  margin: auto;
}
.onward,
.return {
  display: flex;
}
.onward .input,
.return .input {
  width: 37px;
}
.mon-day {
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  font-size: 0.7rem;
  padding-left: 13px;
  color: #ffffff;
}
.mon-day:before {
  content: "";
  position: absolute;
  left: 0;
  width: 1px;
  height: 20px;
  background-color: #ffffff;
  top: 0;
  bottom: 0;
  margin: auto 0;
}
.month {
  padding-top: 4px;
}
.day {
  padding-bottom: 4px;
}
.inside-lable-wrap {
	display: flex;
}
.inside-lable-wrap .inside-lable-col {
	width: 50%;
}
.screen-bottom {
	position: absolute;
  bottom: 0;
  width: 100%;
  padding: 15px 0;
}
.screen-bottom ul {
	display: flex;
	justify-content: space-between;
	padding: 0 15px;
}
.screen-home__submit-wrap .screen-home__bus-page {
	background-color: #66a1f3;
  width: 46px;
  height: 46px;
  position: relative;
  border-radius: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
  outline: none;
  padding: 0;
  border: 3px solid #ffffff;
}
.screen-home__submit-wrap .screen-home__bus-page figure {
	height: 26px;
  cursor: pointer;
}
.screen-home__submit-wrap {
	display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
}
.line {
	position: absolute;
	width: 100%;
	height: 1px;
	background-color: #66a1f3;
	z-index: -1;
}


.screen-home__recent-search {
  margin-top: 20px;
}
.screen-home__rs-col {
  display: flex;
  justify-content: space-between;
  padding: 0.5rem 1rem;
  border: 1px solid #c7deff;
  border-radius: 4px;
  font-size: 0.8rem;
  margin-bottom: 1rem;
}
.screen-homers-from-to {
  display: flex;
  align-items: center;
}
.screen-home__rs-arrow {
  display: inline-block;
  width: 20px;
  height: 1px;
  background-color: #000000;
  margin: 0 10px;
  position: relative;
}
.screen-home__rs-arrow:before,
.screen-home__rs-arrow:after {
  content: "";
  width: 6px;
  height: 1px;
  background-color: #000000;
  position: absolute;
  right: 0;
}
.screen-home__rs-arrow:before {
  transform: rotate(45deg);
  top: -2px;
}
.screen-home__rs-arrow:after {
  transform: rotate(-45deg);
  top: 2px;
}


/* ========== Bus ========== */
.screen-bus {
  opacity: 0;
}
.screen-bus__location-filter-row {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #66A1F3;
}
.screen-bus__location {
  padding: 1.3rem 15px;
  color: #ffffff;
}
.screen-bus__filter {
  padding-right: 1rem;
}
.screen-bus__location-row {
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
  font-size: 0.9rem;
}
.screen-bus__date-row {
  font-size: 0.7rem;
}
.screen-bus__center-arrow{
  display: inline-block;
  width: 18px;
  height: 18px;
  background-color: #ffffff;
  border-radius: 100px;
  margin: 0 1.2rem;
}
.screen-bus__travels-wrap {
  padding: 1rem 1rem 0 1rem;
}
.screen-bus__travels-col {
  box-shadow: 0px 1px 4px rgba(170, 170, 170, 0.25);
  border-radius: 3px;
  padding: 12px;
  border: 1px solid whitesmoke;
  margin-bottom: 1rem;
  opacity: 0;
  transform: translateY(5px);
}
.screen-bus__name-time-seat {
  display: flex;
  justify-content: space-between;
}
.screen-bus__name-wrap,
.screen-bus__time-wrap,
.screen-bus__seat-wrap {
  width: 33.333%;
}
.screen-bus__name-wrap {
  display: flex;
  flex-direction: column;
  font-size: 0.7rem;
}
.screen-bus__name {
  margin-bottom: 0.3rem;
}
.screen-bus__type,
.screen-bus__hrs span {
  font-size: 0.6rem;
  color: #cacaca;
}
.screen-bus__seat-wrap {
  text-align: right;
  font-size: 0.7rem;
}
.screen-bus__count {
  font-size: 0.9rem;
  color: #81e276;
}
.screen-bus__time-wrap {
  font-size: 0.7rem;
  display: flex;
  flex-direction: column;
}
.screen-bus__time {
  display: flex;
  margin-bottom: 0.3rem;
}
.screen-bus__time-arrow-wrap {
  margin: 0 0.7rem;
}
.screen-bus__time-arrow {
  display: inline-block;
  width: 15px;
  height: 1px;
  background-color: red;
  position: relative;
}
.screen-bus__time-arrow:after,
.screen-bus__time-arrow:before {
  content: "";
  width: 5px;
  height: 1px;
  background-color: red;
  position: absolute;
  right: 0;
}
.screen-bus__time-arrow:after {
  transform: rotate(-45deg);
  top: 2px;
}
.screen-bus__time-arrow:before {
  transform: rotate(45deg);
  top: -2px;
}
.screen-bus__rating-price-row {
  display: flex;
  justify-content: space-between;
}
.screen-bus__rating-price {
  margin-top: 0.5rem;
}
.screen-bus__rating-row {
  display: flex;
}
.screen-bus__rating-row li {
  margin-right: 5px;
}
.screen-bus__rating-row li:last-child {
  margin-right: 0;
}
.screen-home__inside-wave {
  width: 0%;
  height: 0%;
  position: absolute;
  border-radius: 100px;
  background-color: #ffffff7d;
  cursor: pointer;
}

button {
    background: transparent;
    border: none !important;
    font-size:0; 
/*     border-radius:100%;
    height:40px;
    width:50px; */
}
</style>

</head>
<body onload="display()">
<div class="main">
	<main class="app">
		<div class="screen-wrap">
			<section class="screen-home">
				<div class="screen-home__form-wrap">
					<div class="screen-home__form">
						<form action="SearchBus" method="post">
							<div id="formdetail">
								<div class="screen-home__location">
									<div class="lable">
										<div style="text-align:center;">
											<h1>Bus Reservation System</h1>
										</div>
									</div>
									<div style="text-align:right;">
										<c:if test="${not empty username}">
									       	${username}<br>
									    </c:if>
									</div>
									<img src="https://i.ibb.co/KwnYdXN/location.png"></figure>
										<span class="text">Location Details</span>
									<div class="input-wrap">
										<div class="inside-wrap">
											<div class="rotate-btn">
												<figure onclick="swap()">
													<img src="https://i.ibb.co/HPBrQkn/rotate-btn.png">
												</figure>
											</div>
											<div class="from">
												<span class="inside-lable">From</span>
												<input class="input" type="text" name="src" id="src" required>
											</div>
											<div class="to">
												<span class="inside-lable">To</span>
												<input class="input" type="text" name="dest" id="dest" required>
											</div>
										</div>
									</div>
								</div>
								<div class="screen-home__date">
									<div class="lable">
										<figure class="icon"><img src="https://i.ibb.co/7N5zdnc/calendar.png"></figure>
										<span class="text">Date Details</span>
									</div>
									<!-- <div class="input-wrap"> -->
										<div class="inside-wrap">
											<div class="onward">
												<input class="input" type="date" name="dat" required>
												<!-- <div class="mon-day">
													<span class="month">Dec</span>
													<span class="day">Wed</span>
												</div> -->
											</div>
											<div class="return">
												<input class="input" type="number" name="nseats" value="1">
												<!-- <div class="mon-day">
													<span class="month">Dec</span>
													<span class="day">Fri</span>
												</div> -->
											</div> 
										</div>
										<div class="inside-lable-wrap">
											<div class="inside-lable-col">
												<span class="inside-lable">Onward</span>
											</div>
										<div class="inside-lable-col">
												<span class="inside-lable">Seats</span>
											</div>
										</div> 
									</div>
								</div>
							</div>
							<div class="screen-home__submit-wrap">
								<span class="line"></span>
								<div class="screen-home__bus-page" id="buspage">
									<div class="screen-home__inside-wave">
										
									</div>
									<figure class="screen-home__bus-arrow-wrap">
<!--                     <span class="screen-home__btn-blink"></span> -->
										<button type="submit"><img src="https://i.ibb.co/nQ4khG8/arrow.png"></button>
									</figure>
								</div>
							</div>
						</form>
					</div>
			</section>
		</div>
		<section class="screen-bottom">
			<div>
				<ul>
					<!-- <li>
						<figure>
							<img src="https://i.ibb.co/n1kQzHj/home.png">
						</figure>
					</li> -->
					<li>
						<figure>
							<a href="managebookings" title="View Your Bookings"><img src="https://i.ibb.co/sjXwWkz/tickets.png"></a>
						</figure>
					</li>
					<li>
						<figure>
							<a href="login" title="Login"><img src="https://i.ibb.co/5nFHJvJ/user.png"></a>
						</figure>
					</li>
					<li>
						<figure>
							<a href="viewprofile" title="View Your Profile"><img src="https://i.ibb.co/qpb5dSj/support.png"></a>
						</figure>
					</li>
					<li>
						<figure>
							<a href="logout" title="Logout"><img height="28px" src="data:image/png;base64,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"></a>
						</figure>
					</li>
				</ul>
			</div>
		</section>
	</main>
</div>
	<script>
		function display(){
			<c:if test="${not empty message}">
        		alert(`${message}`);
	    	</c:if>
	    	<c:if test="${not empty msg}">
    			alert(`${msg}`);
    		</c:if>
		}
		function swap(){
			var src = document.getElementById("src").value;
			var dest = document.getElementById("dest").value;
			document.getElementById("src").value = dest;
			document.getElementById("dest").value = src;
		}
		$(document).ready(function(){
			 $('#buspage').click(function(){
					var Tl = new TimelineMax()
					var nextbutton = $('.screen-home__bus-page')
					var screenBottom = $('.screen-bottom');
							Tl
								// .fromTo('.screen-home__bus-page', '0.3', {scale: 1, ease:Expo.easeInOut}, {scale: 1.2, ease: Expo.easeInOut }, '0.6')
								// .to('.screen-home__bus-page', '0.3', {scale: 1, ease:Expo.easeInOut, onComplete: clkAnimComplete})
								.to('.screen-home__inside-wave', '0.3', {width: 52, height: 52 })
								.to('.screen-home__inside-wave', '0.3', {opacity: 0, onComplete: clkAnimComplete})
								function clkAnimComplete() {
									// .to('.screen-home__inside-wave', '0.3', {width: 100, height: 100 })
									Tl.to('#formdetail', 0.1, {scale: 0.9, y: 5, opacity:0, ease: Power2.easeIn})
									Tl.to('.screen-home__recent-search', 0.1, {scale: 0.9, y: 5, opacity:0, ease: Power2.easeIn}, '0')
									Tl.to('.screen-bottom', 0.1, {opacity: 0}, '0')
									Tl.to(nextbutton, 1, {rotation: 720, scale: 0.4, borderWidth: 0, ease: Expo.easeOut})
									Tl.to('.screen-home__bus-arrow-wrap', 1, {scale: 0, opacity: 0, ease: Expo.easeOut}, '0')
									Tl.to('.line', 0.6, {width: 0}, '0.6')
									Tl.to('.screen-home__submit-wrap', 0.6, {width: 375, height: 90, x: -15, y: -409, ease: Expo.easeOut })
									Tl.to(nextbutton, 0.6, {scale: 1, width: 375, height: 90, borderRadius: 0, ease: Expo.easeOut, onStart: visibleBox})
									Tl.to(screenBottom, 0.1, {opacity: 1})
									Tl.to('.screen-bus', 0, {opacity:1})
									Tl.to('.screen-home', 0.6, {opacity: 0})
									Tl.to('.screen-home', 0, {display: 'none'})
									function visibleBox() {
										Tl.staggerTo('.screen-bus__travels-col', 0.4, {opacity: 1, y: 0, ease: Expo.easeIn}, '0.1'); 
										console.log('start');
									} 
								}
				 });
			  
			var TlWaveAnim = new TimelineMax({repeat: -1});
			    TlWaveAnim
			              .to('.screen-home__inside-wave', 0.8, {width: '100%', height: '100%'});
			});
	</script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
</body>
</html>