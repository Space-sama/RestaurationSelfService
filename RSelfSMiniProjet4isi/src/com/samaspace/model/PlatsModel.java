package com.samaspace.model;

import java.io.Serializable;
import java.time.LocalDate;

public class PlatsModel implements Serializable{
	
	private int idPlat;
	private String nomPlat;
	//private String description;
	private double prixPlat;
	private String imgPlat;
	private LocalDate datePub;
	
	
	public LocalDate getDatePub() {
		return datePub;
	}

	public void setDatePub(LocalDate datePub) {
		this.datePub = datePub;
	}

	public PlatsModel(String nomPlat, double prixPlat, String img) {
		super();
		this.nomPlat = nomPlat;
		this.prixPlat = prixPlat;
		this.imgPlat = img;
	}
	public PlatsModel(int idPlat,String nomPlat, double prixPlat, String img) {
		super();
		this.idPlat=idPlat;
		this.nomPlat = nomPlat;
		this.prixPlat = prixPlat;
		this.imgPlat = img;
	}
	
	public PlatsModel(String nomPlat, double prixPlat) {
		super();
		this.nomPlat = nomPlat;
		this.prixPlat = prixPlat;
	}
	
	public PlatsModel(String nomPlat, double prixPlat, LocalDate dp) {
		super();
		this.nomPlat = nomPlat;
		this.prixPlat = prixPlat;
		this.datePub = dp;
	}
	
	
	
	public PlatsModel() {
		super();
	}



	public int getIdPlat() {
		return idPlat;
	}
	public void setIdPlat(int idPlat) {
		this.idPlat = idPlat;
	}
	public String getNomPlat() {
		return nomPlat;
	}
	public void setNomPlat(String nomPlat) {
		this.nomPlat = nomPlat;
	}

	/*
	 * public String getDescription() { return description; } public void
	 * setDescription(String description) { this.description = description; }
	 */
	public double getPrixPlat() {
		return prixPlat;
	}
	public void setPrixPlat(double prixPlat) {
		this.prixPlat = prixPlat;
	}
	public String getImgPlat() {
		return imgPlat;
	}
	public void setImgPlat(String imgPlat) {
		this.imgPlat = imgPlat;
	}
	
	
	

}
