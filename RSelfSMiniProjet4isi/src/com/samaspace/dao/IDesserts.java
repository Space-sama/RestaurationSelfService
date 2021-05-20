package com.samaspace.dao;

import java.util.List;

import com.samaspace.model.DessModel;
import com.samaspace.model.PlatsModel;

public interface IDesserts {

	
	public List<DessModel> allDesserts();
	
	public DessModel addDesserts(DessModel D);

	public List<DessModel> findOneDessertByName(String nomDess);
	
	
	public DessModel updateDessert(DessModel D);
	
	
	public DessModel DeleteDessById(int idD);
	
	
	public DessModel getOneDessById(int idDess);
	
	public int nbrDesserts();
}
