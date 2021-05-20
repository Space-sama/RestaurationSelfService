package com.samaspace.model;

import java.io.Serializable;
import java.time.LocalDate;

public class DessModel implements Serializable{
	
	
	private int idDess;
	private String nomDess;
	//DessModel String description;
	private double prixDess;
	private String imgDess;
	private LocalDate datePub;
	
	public DessModel(String nomDess, double prixDess) {
		super();
		this.nomDess = nomDess;
		this.prixDess = prixDess;
	}
	public DessModel(String nomDess, double prixDess, String imgDess) {
		super();
		this.nomDess = nomDess;
		this.prixDess = prixDess;
		this.imgDess = imgDess;
	}
	
	public DessModel(int idDess,String nomDess, double prixDess, String imgDess) {
		super();
		this.idDess=idDess;
		this.nomDess = nomDess;
		this.prixDess = prixDess;
		this.imgDess = imgDess;
	}
	public DessModel(String nomDess, double prixDess, String imgDess, LocalDate dp) {
		super();
		this.nomDess = nomDess;
		this.prixDess = prixDess;
		this.imgDess = imgDess;
		this.datePub = dp;
	}
	
	
	public DessModel() {
		super();
	}
	public int getIdDess() {
		return idDess;
	}
	public void setIdDess(int idDess) {
		this.idDess = idDess;
	}
	public String getNomDess() {
		return nomDess;
	}
	public void setNomDess(String nomDess) {
		this.nomDess = nomDess;
	}

	/*
	 * public String getDescription() { return description; } public void
	 * setDescription(String description) { this.description = description; }
	 */
	public double getPrixDess() {
		return prixDess;
	}
	public void setPrixDess(double prixDess) {
		this.prixDess = prixDess;
	}
	public String getImgDess() {
		return imgDess;
	}
	public void setImgDess(String imgDess) {
		this.imgDess = imgDess;
	}
	public LocalDate getDatePub() {
		return datePub;
	}
	public void setDatePub(LocalDate datePub) {
		this.datePub = datePub;
	}
}
