package com.samaspace.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;
import com.samaspace.model.BoissModel;
import com.samaspace.model.PlatsModel;
import com.samaspace.util.DbInteraction;

public class BoissonsDAO_Impl implements IBoisson{

	@Override
	
	
	public List<BoissModel> allDrinks() {
		List<BoissModel> List_of_drinks = new ArrayList<BoissModel>();
		BoissModel B;
		
		String sql0 = "SELECT * FROM boisson";
		
		DbInteraction.Connecter();
		ResultSet RS =  DbInteraction.Select(sql0);
		
try {
			
			while(RS.next()) {
				
				B = new BoissModel(RS.getString("nomBoiss"), RS.getDouble("prixBoiss"), RS.getString("imgBoiss"));
				B.setIdBoiss(RS.getInt("idBoiss"));
				List_of_drinks.add(B);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		DbInteraction.Disconnect();
		System.out.println("taille Boissons :" +List_of_drinks);
		
		return List_of_drinks;
	}

	@Override
	public BoissModel addDrinks(BoissModel B) {
		
		System.out.println("INSERTING ....");
		
		try {
			DbInteraction.Connecter();
			String sql0 = "INSERT INTO boisson(nomBoiss, prixBoiss, imgBoiss) VALUES(?, ?, ?)";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql0);
			PS.setString(1, B.getNomBoiss());
			//PS.setString(2, B.getDescription());
			PS.setDouble(2, B.getPrixBoiss());
			PS.setString(3, B.getImgBoiss());
			/* --------- */ PS.executeUpdate();
			
			String sql1 = "SELECT MAX(idBoiss) AS MAX_ID FROM boisson";
			PreparedStatement PS1 = DbInteraction.conn.prepareStatement(sql1);
			
			ResultSet RS = PS1.executeQuery();
			if(RS.next()) {
				B.setIdBoiss(RS.getInt("MAX_ID"));
			}
			
			String sql2 = "SELECT *FROM boisson WHERE idBoiss=?";
			PreparedStatement PS2 = DbInteraction.conn.prepareStatement(sql2);
			PS2.setInt(1, RS.getInt("MAX_ID"));
			
			ResultSet RS1 = PS2.executeQuery();
			
			if(RS1.next()) {
				B.setDatePub(RS1.getDate("datePub").toLocalDate());
				System.out.println("DATE OF DRINK "+RS1.getDate("datePub").toLocalDate());
			}
			
			PS.close();
			PS1.close();
			PS2.close();
			
		} catch (Exception e) {
			System.out.println("CANNOT ADD THIS DRINK.. !");
			e.printStackTrace();
		}
		DbInteraction.Disconnect();
		return B;
	}
	
	

	@Override
	public List<BoissModel> findOneDrinkByName(String nDrink) {
		System.out.println("Searching Drinks ...");
		List<BoissModel> maliste = new ArrayList<BoissModel>();
		BoissModel BM;
		
		try {
			
			DbInteraction.Connecter();
			String sql="SELECT *FROM boisson WHERE nomBoiss LIKE ? AND idBoiss IS  NOT NULL";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql);
			PS.setString(1, "%"+nDrink+"%");
			ResultSet RS = PS.executeQuery();
			
			while (RS.next()) {
				BM = new BoissModel();
				BM.setIdBoiss(RS.getInt("idBoiss"));
				BM.setNomBoiss(RS.getString("nomBoiss"));
				//BM.setDescription(RS.getString("description"));
				BM.setPrixBoiss(RS.getDouble("prixBoiss"));
				BM.setImgBoiss(RS.getString("imgBoiss"));
				BM.setDatePub(RS.getDate("datePub").toLocalDate());
				maliste.add(BM);
				
			}
			
		} catch (Exception e) {
			System.out.println("CANNOT FIND THE DRINK(S)...");
			e.printStackTrace();
		}
		return maliste;
	}

	@Override
	public BoissModel updateADrink(BoissModel B) {
		System.out.println("UPDATING THE DRINK....");
		BoissModel drinkToEdit = new BoissModel();
		
		try {
			DbInteraction.Connecter();
			String sql0 = "UPDATE boisson SET nomBoiss=?, prixBoiss=? WHERE idBoiss=?";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql0);
			
			PS.setString(1, B.getNomBoiss());
			//PS.setString(2, B.getDescription());
			PS.setDouble(2, B.getPrixBoiss());
			PS.setInt(3, B.getIdBoiss());
			PS.executeUpdate();
			PS.close();
			
		} catch (Exception e) {
			System.out.println("CANNOT UPDATE THE DISHE !");
			e.printStackTrace();
		}
		DbInteraction.Disconnect();
		return drinkToEdit;
	}

	@Override
	public BoissModel DeleteADrinkById(int idB) {
		
		System.out.println("DELETING ...");
		try {
			
			DbInteraction.Connecter();
			String sql0 = "DELETE FROM boisson WHERE idBoiss=? AND idBoiss IS NOT NULL";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql0);
			PS.setInt(1, idB);
			
			int rs = PS.executeUpdate();
			
			if(rs == 1) {
				System.out.println("DRINK HAS BEEN DELETED SUCCESSFULLY...");
			}
			else System.out.println("ID DRINK NOT FOUND...");
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SORRY... CANNOT DELETE THIS DRINK");
		}
		
		return null;
	}

	@Override
	public BoissModel getOneDrinkById(int idBoisson) {
		
		System.out.println("Getting one drink from the whole drinks...");
		BoissModel BM=null;
		try {
			DbInteraction.Connecter();
			String sql0 = "SELECT * FROM boisson WHERE idBoiss=?";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql0);
			PS.setInt(1, idBoisson);
			
			ResultSet RS = PS.executeQuery();
			
			if(RS.next()) {
				BM = new BoissModel();
				BM.setIdBoiss(RS.getInt("idBoiss"));
				BM.setNomBoiss(RS.getString("nomBoiss"));
				//BM.setDescription(RS.getString("description"));
				BM.setPrixBoiss(RS.getDouble("prixBoiss"));
				BM.setImgBoiss(RS.getString("imgBoiss"));
				BM.setDatePub(RS.getDate("datePub").toLocalDate());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CANNOT GETTING THE ID !");
		}
		DbInteraction.Disconnect();
		return BM;
	}

	@Override
	public int nbrDrinks() {
		int nbr=0;
		String sql0 = "SELECT count(*) FROM boisson ";
		DbInteraction.Connecter();
		ResultSet RS =  DbInteraction.Select(sql0);
		
		try {	
			if(RS.next()) {
				nbr=RS.getInt(1);
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		DbInteraction.Disconnect();
		System.out.println("Nombre Boissons :" +nbr);
		
		return nbr;
	}
	

	
}
