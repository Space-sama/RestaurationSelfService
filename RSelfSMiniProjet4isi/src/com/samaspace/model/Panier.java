package com.samaspace.model;

import java.util.ArrayList;

public class Panier {

	public static ArrayList<BoissModel> liste_boisson=new ArrayList<BoissModel>();
	public static ArrayList<PlatsModel> liste_plat=new ArrayList<PlatsModel>();
	public static ArrayList<DessModel> liste_dessert=new ArrayList<DessModel>();
		
	public static void AjouterBoisson(BoissModel b) {
		liste_boisson.add(b);
	}
	public static void AjouterPlat(PlatsModel p) {
		liste_plat.add(p);
	}
	public static void AjouterDessert(DessModel d) {
		liste_dessert.add(d);
	}
	
	public static void EffacerTout() {
		liste_boisson.clear();
		liste_plat.clear();
		liste_dessert.clear();
	}
	
	public static double Total() {
		double total=0;
		for(BoissModel b:liste_boisson) {
			total+=b.getPrixBoiss();
		}
		for(PlatsModel p:liste_plat) {
			total+=p.getPrixPlat();
		}
		for(DessModel d:liste_dessert) {
			total+=d.getPrixDess();
		}
		return total;
	}
}
