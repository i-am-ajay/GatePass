package com.sgrh.bean;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.ColumnTransformer;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Formula;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Component;

@Entity
@DynamicUpdate
public class VisitorEntry {
	
	@Id
	@Column(name = "Pass_no",unique = true)
	@GeneratedValue(generator = "pass_generator")
	@GenericGenerator(name="pass_generator", strategy="enhanced-sequence", parameters = {
			@org.hibernate.annotations.Parameter(name="sequence_name",value="pass_no_table") 
	})
	private int passNo;
	@Column(name="visit_date")
	@DateTimeFormat(iso=ISO.DATE)
	private LocalDate visitDate;
	
	@Column(name="visit_time")
	@DateTimeFormat(pattern="HH:mm")
	private LocalTime visitTime;
	
	@Column(name="visit_department")
	@NotNull(message="Cannot be blank")
	@Size(min=1, message="Cannot be blank")
	private String visitReason;
	
	@Column(name = "user")
	private String user;
	
	@Column(name="reason")
	@NotNull(message="Cannot be blank")
	@Size(min=1, message="Cannot be blank")
	private String reason;
	
	@ManyToOne(cascade = {CascadeType.PERSIST})
	@JoinColumn(name = "V_ID")
	private Visitor visitor;
	
	@Column(name="entry_date")
	private LocalDateTime entryTime;
	
	@Column(name="entry_user")
	private String entryUser;
	
	/*
	@Column(name = "Pass_No", nullable = false)
	private int gatePassNo;*/

	public LocalDate getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(LocalDate visitDate){
		this.visitDate = visitDate;
	}

	public LocalTime getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(LocalTime visitTime) {
		this.visitTime = visitTime;
	}

	public String getVisitReason() {
		return visitReason;
	}

	public void setVisitReason(String visitReason) {
		this.visitReason = visitReason;
	}
	
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getReason() {
		return reason;
	}
	/*
	public int getGatePassNo() {
		return gatePassNo;
	}*/
	
	/*
	public void setGatePassNo(int passNo) {
		this.gatePassNo = passNo;
	}
	*/
	
	public String getUser(){
		return this.user;
	}
	public void setUser(String user){
		this.user = user;
	}
	
	public void addPassNo(int passNo) {
		this.passNo = passNo;
	}
	public long getPassNo() {
		return passNo;
	}
	
	public Visitor getVisitor() {
		return this.visitor;
	}
	
	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}

	public LocalDateTime getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(LocalDateTime entryTime) {
		this.entryTime = entryTime;
	}

	public String getEntryUser() {
		return entryUser;
	}

	public void setEntryUser(String entryUser) {
		this.entryUser = entryUser;
	}
	
	
}
