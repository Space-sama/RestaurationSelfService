package com.samaspace.model;

public class Admin {

	private int idAdmin;
	private String pseudo;
	private String email;
	private String password;
	private String etat;
	
	
	public Admin() {
		super();
	}


	public Admin(String pseudo, String email, String password, String etat) {
		super();
		this.pseudo = pseudo;
		this.email = email;
		this.password = password;
		this.etat = etat;
	}


	public int getIdAdmin() {
		return idAdmin;
	}


	public void setIdAdmin(int idAdmin) {
		this.idAdmin = idAdmin;
	}


	public String getPseudo() {
		return pseudo;
	}


	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	


	public String getEtat() {
		return etat;
	}


	public void setEtat(String etat) {
		this.etat = etat;
	}


	
	
	
	
	
}
