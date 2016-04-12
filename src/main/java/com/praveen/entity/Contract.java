package com.praveen.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Contract
 * 
 * @author Praveen
 *
 */
@Entity
@Table(name = "Contracts")
public class Contract implements Serializable {
	private static final long serialVersionUID = -2984799579036123130L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private long id;

	@Column
	private String code;

	@Column
	private String description;

	@Column
	private long budget;

	@Column(name = "committed_cost")
	private long committedCost;

	@Column
	private long forecast;

	@Column
	private long paid;

	@Column
	private int complete;

	@Column
	private String vendor;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getBudget() {
		return budget;
	}

	public void setBudget(long budget) {
		this.budget = budget;
	}

	public long getCommittedCost() {
		return committedCost;
	}

	public void setCommittedCost(long committedCost) {
		this.committedCost = committedCost;
	}

	public long getForecast() {
		return forecast;
	}

	public void setForecast(long forecast) {
		this.forecast = forecast;
	}

	public long getPaid() {
		return paid;
	}

	public void setPaid(long paid) {
		this.paid = paid;
	}

	public int getComplete() {
		return complete;
	}

	public void setComplete(int complete) {
		this.complete = complete;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	@Override
	public String toString() {
		return "Contract{" + "id=" + id + ", code=" + code + ", description="
				+ description + ", budget=" + budget + ", Committed Cost="
				+ committedCost + ", Forecast=" + forecast + ", Paid=" + paid
				+ ", Completed=" + complete + ", Vendor=" + vendor + "}";
	}
}
