package com.jt.project.entity;

import jakarta.persistence.*;

@Entity
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int booking_id;
	
	@OneToOne(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private BusRoute route_id;
	
	@OneToOne(cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private User user_id;
	
	private int seats_booked;
	
	private String payment_method;
	
	private int Amount_paid;

	public Booking() {
		super();
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public BusRoute getRoute_id() {
		return route_id;
	}

	public void setRoute_id(BusRoute route_id) {
		this.route_id = route_id;
	}

	public User getUser_id() {
		return user_id;
	}

	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}
	

	public int getSeats_booked() {
		return seats_booked;
	}

	public void setSeats_booked(int seats_booked) {
		this.seats_booked = seats_booked;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public int getAmount_paid() {
		return Amount_paid;
	}

	public void setAmount_paid(int amount_paid) {
		Amount_paid = amount_paid;
	}

	@Override
	public String toString() {
		return "Booking [booking_id=" + booking_id + ", route_id=" + route_id + ", user_id=" + user_id + "]";
	}
}
