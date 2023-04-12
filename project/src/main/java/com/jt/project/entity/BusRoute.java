package com.jt.project.entity;

import java.sql.*;
import jakarta.persistence.*;

@Entity
@Table(name="Route")
public class BusRoute {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int route_id;
	private String src;
	private String dest;
	private Date date;
	private Time time;
	private int seats_left;
	private int price;
	
	@ManyToOne(cascade = CascadeType.ALL)
	private BusClass bus_class_id;

	public BusRoute() {
		super();
	}

	public int getRoute_id() {
		return route_id;
	}

	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getDest() {
		return dest;
	}

	public void setDest(String dest) {
		this.dest = dest;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public int getSeats_left() {
		return seats_left;
	}

	public void setSeats_left(int seats_left) {
		this.seats_left = seats_left;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public BusClass getBus_class_id() {
		return bus_class_id;
	}

	public void setBus_class_id(BusClass bus_class_id) {
		this.bus_class_id = bus_class_id;
	}

	@Override
	public String toString() {
		return "BusRoute [route_id=" + route_id + ", src=" + src + ", dest=" + dest + ", date=" + date + ", time="
				+ time + ", seats_left=" + seats_left + ", price=" + price + ", bus_class_id=" + bus_class_id + "]";
	}
	
	
}
