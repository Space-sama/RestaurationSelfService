package com.samaspace.dao;

import java.util.List;

import com.samaspace.model.BoissModel;
import com.samaspace.model.PlatsModel;

public interface IBoisson {
	
	public List<BoissModel> allDrinks();
	
	public BoissModel addDrinks(BoissModel B);
	
	public List<BoissModel> findOneDrinkByName(String nDrink);
	
	public BoissModel updateADrink(BoissModel B);
	
	public BoissModel DeleteADrinkById(int idB);
	
	public BoissModel getOneDrinkById(int idBoisson);
	
	public int nbrDrinks();
}
