package com.samaspace.test;

import java.util.List;

import com.samaspace.dao.PlatsDAO_impl;
import com.samaspace.model.PlatsModel;

public class Test {

	public static void main(String[] args) {
		PlatsDAO_impl plm = new PlatsDAO_impl();
		PlatsModel p1 = new PlatsModel();
		
		
		
		  List<PlatsModel> maliste = plm.findOneDisheByName("Pani");
		  
		  for (PlatsModel p: maliste) {
		  
		  System.out.println(p.getNomPlat()); }
		 
		
		//System.out.println("Nbr : "+plm.NbrOfDishes()); 

	}

}
