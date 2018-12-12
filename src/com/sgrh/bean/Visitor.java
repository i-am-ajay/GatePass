package com.sgrh.bean;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name="Visitor")
public class Visitor {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	@NotNull(message="Name cannot be Null.")
	@Size(min=1, message="Is required.")
	private String  name;
	
	@Column(name="address")
	private String address;
	
	@Column(name="contact")
	private String contact;
	
	@Column(name="company")
	private String company;
	
	@ElementCollection
	@CollectionTable(name="visitorEntry")
	@Embedded
	private List<VisitorEntry> visitorEntryList = new ArrayList<>();
	
	/*
	@Column(name="visit_department")
	@NotNull(message="Cannot be blank")
	@Size(min=1, message="Cannot be blank")
	private String visitReason;
	
	@Column(name="visit_date")
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate visitDate;
	
	@Column(name="visit_time")
	@DateTimeFormat(pattern="HH:mm")
	private LocalTime visitTime;
	*/
/*	@Column(name="departure_date")
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate departureDate;
	
	@Column(name="departure_time")
	@DateTimeFormat(pattern="HH:mm")
	private LocalTime departureTime;

	@Column(name="stay_duration")
	private int stayDuration;*/
	
	@Column(name="image_path")
	private String imagePath;
	
	@Column(name="id_image_path")
	private String idImagePath;
	
	// Id field
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	// name field
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	// address field
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	// contact field
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	// company field
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}

	/*
	// visit reason
	public String getVisitReason() {
		return visitReason;
	}
	public void setVisitReason(String visitReason) {
		this.visitReason = visitReason;
	}
	// visit date
	public LocalDate getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(LocalDate visitDate) {
		this.visitDate = visitDate;
	}
	
	public LocalTime getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(LocalTime visitTime) {
		this.visitTime = visitTime;
	}
	*/
	
	
	/*// departure date
	public LocalDate getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(LocalDate departureDate) {
		this.departureDate = departureDate;
	}
	// stay duration
	public int getStayDuration() {
		return stayDuration;
	}
	public void setStayDuration(int stayDuration) {
		this.stayDuration = stayDuration;
	}*/
	//save image path
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	/*public LocalTime getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(LocalTime departureTime) {
		this.departureTime = departureTime;
	}*/

	public String getIdImagePath() {
		return idImagePath;
	}

	public void setIdImagePath(String idImagePath) {
		this.idImagePath = idImagePath;
	}

	public List<VisitorEntry> getVisitorEntryList() {
		return visitorEntryList;
	}

	public void setVisitorEntryList(List<VisitorEntry> visitorEntryList) {
		this.visitorEntryList = visitorEntryList;
	}
	
}
