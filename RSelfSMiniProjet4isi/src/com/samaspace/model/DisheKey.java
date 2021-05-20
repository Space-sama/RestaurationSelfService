package com.samaspace.model;

import java.util.ArrayList;
import java.util.List;

public class DisheKey {
	
	private String keyDishe;
	List<PlatsModel> platmod = new ArrayList<PlatsModel>();
	List<BoissModel> listeBoiss = new ArrayList<BoissModel>();
	List<DessModel> listeDesserts = new ArrayList<DessModel>();
	


	public List<BoissModel> getListeBoiss() {
		return listeBoiss;
	}
	public void setListeBoiss(List<BoissModel> listeBoiss) {
		this.listeBoiss = listeBoiss;
	}
	public List<DessModel> getListeDesserts() {
		return listeDesserts;
	}
	public void setListeDesserts(List<DessModel> listeDesserts) {
		this.listeDesserts = listeDesserts;
	}
	public List<PlatsModel> getPlatmod() {
		return platmod;
	}
	public void setPlatmod(List<PlatsModel> platmod) {
		this.platmod = platmod;
	}
	
	
	public String getKeyDishe() {
		return keyDishe;
	}
	public void setKeyDishe(String keyDishe) {
		this.keyDishe = keyDishe;
	}
	
	
}
