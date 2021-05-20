package com.samaspace.model;

import java.io.Serializable;
import java.time.LocalDate;

public class BoissModel implements Serializable{

	private int idBoiss;
	private String nomBoiss;
	//private String description;
	private double prixBoiss;
	private String imgBoiss;
	private LocalDate datePub;
	
	
	
	
	
	public BoissModel(String nomBoiss, double prixBoiss, LocalDate datePub) {
		super();
		this.nomBoiss = nomBoiss;
		this.prixBoiss = prixBoiss;
		this.datePub = datePub;
	}
	
	public BoissModel() {
		super();
	}
	
	
	public BoissModel(String nomBoiss, double prixBoiss, String imgBoiss) {
		super();
		this.nomBoiss = nomBoiss;
		this.prixBoiss = prixBoiss;
		this.imgBoiss = imgBoiss;
	}
	
	public BoissModel(int idBoiss,String nomBoiss, double prixBoiss, String imgBoiss) {
		super();
		this.idBoiss=idBoiss;
		this.nomBoiss = nomBoiss;
		this.prixBoiss = prixBoiss;
		this.imgBoiss = imgBoiss;
	}
	
	public BoissModel(String nomBoiss, double prixBoiss) {
		super();
		this.nomBoiss = nomBoiss;
		this.prixBoiss = prixBoiss;
	}
	
	public int getIdBoiss() {
		return idBoiss;
	}
	public void setIdBoiss(int idBoiss) {
		this.idBoiss = idBoiss;
	}
	public String getNomBoiss() {
		return nomBoiss;
	}
	public void setNomBoiss(String nomBoiss) {
		this.nomBoiss = nomBoiss;
	}

	/*
	 * public String getDescription() { return description; } public void
	 * setDescription(String description) { this.description = description; }
	 */
	public double getPrixBoiss() {
		return prixBoiss;
	}
	public void setPrixBoiss(double prixBoiss) {
		this.prixBoiss = prixBoiss;
	}
	public String getImgBoiss() {
		return imgBoiss;
	}
	public void setImgBoiss(String imgBoiss) {
		this.imgBoiss = imgBoiss;
	}
	
	public LocalDate getDatePub() {
		return datePub;
	}
	public void setDatePub(LocalDate datePub) {
		this.datePub = datePub;
	}
	
	
}
