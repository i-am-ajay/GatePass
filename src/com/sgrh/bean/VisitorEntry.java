package com.sgrh.bean;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.ColumnTransformer;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Component;

@Embeddable
public class VisitorEntry {
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
	
	@Column(name = "Pass_No", nullable = false)
	private int gatePassNo;

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

	public String getVisitReason() {
		return visitReason;
	}

	public void setVisitReason(String visitReason) {
		this.visitReason = visitReason;
	}

	public int getGatePassNo() {
		return gatePassNo;
	}

	public void setGatePassNo(int passNo) {
		this.gatePassNo = passNo;
	}
}
