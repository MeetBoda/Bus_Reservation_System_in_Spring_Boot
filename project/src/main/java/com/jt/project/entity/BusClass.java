package com.jt.project.entity;

import jakarta.persistence.*;

@Entity
public class BusClass {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bus_class_id;
	private String bustype;
	
	public BusClass() {
		super();
	}

	public int getBus_class_id() {
		return bus_class_id;
	}

	public void setBus_class_id(int bus_class_id) {
		this.bus_class_id = bus_class_id;
	}

	public String getBustype() {
		return bustype;
	}

	public void setBustype(String bustype) {
		this.bustype = bustype;
	}

	@Override
	public String toString() {
		return "BusClass [bus_class_id=" + bus_class_id + ", bustype=" + bustype + "]";
	}
}
