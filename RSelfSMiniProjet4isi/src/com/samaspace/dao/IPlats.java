package com.samaspace.dao;

import java.util.ArrayList;
import java.util.List;


import com.samaspace.model.PlatsModel;

public interface IPlats {
	
	public List<PlatsModel> allDishes();
	
	public PlatsModel addDishes(PlatsModel P);
	
	public List<PlatsModel> findOneDisheByName(String nomPlat);
	
	public PlatsModel updateADishe(PlatsModel P);
	
	public PlatsModel DeleteADisheById(int idP);
	
	public PlatsModel getOneDisheById(int idPlat);
	
	public int NbrOfDishes();
	
		
}
