package com.sgrh.bean;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Visitor")
public class Visitor {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	@NotNull(message="Name cannot be Null.")
	@Size(min=1, message="Required.")
	private String  name;
	
	@Column(name="address")
	private String address;
	
	@Column(name="contact")
	@NotNull(message="Contact cannot be Null.")
	@Size(min=10, max=10, message="Should be 10 character.")
	private String contact;
	
	//@NotNull(message="Company cannot be Null.")
	//@Size(min=1, message="Cannot be Blank")
	@Column(name="company")
	@NotNull(message="Company cannot be Null.")
	@Size(min=1, message="Required.")
	private String company;
	
	@Column(name="email")
	private String email;
	
	
	//@ElementCollection(fetch=FetchType.EAGER)
	//@CollectionTable(name="visitorEntry", joinColumns=@JoinColumn(name="V_ID"))
	//@CollectionId(columns= {@Column(name = "Pass_No")}, generator = "pass_generator", type = @Type(type="long"))
	/*@GenericGenerator(name="pass_generator", strategy="enhanced-sequence", parameters = {
			@org.hibernate.annotations.Parameter(name="sequence_name",value="pass_no_table") 
	})*/
	@OneToMany(mappedBy = "visitor", cascade= {CascadeType.PERSIST},fetch = FetchType.EAGER)
	private Set<VisitorEntry> visitorEntryList = new HashSet<>();
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
	public void addId(int id) {
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
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
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
	
	public Set<VisitorEntry> getVisitorEntryList() {
		return visitorEntryList;
	}

	public void setVisitorEntryList(Set<VisitorEntry> visitorEntryList) {
		this.visitorEntryList = visitorEntryList;
	}
	
}
