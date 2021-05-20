package com.samaspace.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Result;
import com.samaspace.model.PlatsModel;

import com.samaspace.util.DbInteraction;

public class PlatsDAO_impl implements IPlats {

	@Override
	public List<PlatsModel> allDishes() {
		List<PlatsModel> List_of_dishes = new ArrayList<>();
		PlatsModel P = null;

		String sql0 = "SELECT * FROM plat WHERE idPlat IS NOT NULL";

		DbInteraction.Connecter();
		ResultSet res = DbInteraction.Select(sql0);

		try {

			while (res.next()) {

				P = new PlatsModel(res.getString("nomPlat"), res.getDouble("prixPlat"),
				res.getString("imgPlat"));
				P.setIdPlat(res.getInt("idPlat"));
				List_of_dishes.add(P);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		DbInteraction.Disconnect();
		System.out.println("taille plats :" + List_of_dishes.size());
		return List_of_dishes;

	}

	@Override
	public PlatsModel addDishes(PlatsModel PM) {

		try {

			DbInteraction.Connecter();
			String sql1 = "INSERT INTO plat(nomPlat, prixPlat, imgPlat) VALUES(?, ?, ?)";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql1);
			PS.setString(1, PM.getNomPlat());
			//PS.setString(2, PM.getDescription());
			PS.setDouble(2, PM.getPrixPlat());
			PS.setString(3, PM.getImgPlat());
			PS.executeUpdate();

			String sql2 = "SELECT MAX(idPlat) as MAX_ID from plat";
			PreparedStatement PS1 = DbInteraction.conn.prepareStatement(sql2);

			ResultSet RS = PS1.executeQuery();

			if (RS.next()) {
				PM.setIdPlat(RS.getInt("MAX_ID"));
				System.out.println("MAX ID OF Drinks: " + RS.getInt("MAX_ID"));
			}

			String sql3 = "SELECT * FROM plat WHERE idPlat=?";
			PreparedStatement PS2 = DbInteraction.conn.prepareStatement(sql3);
			PS2.setInt(1, RS.getInt("MAX_ID"));

			ResultSet RS1 = PS2.executeQuery();

			if (RS1.next()) {
				PM.setDatePub((RS1.getDate("datePub").toLocalDate()));
				System.out.println("DATE " + RS1.getDate("datePub").toLocalDate());
			}

			PS.close();
			PS1.close();
			PS2.close();

		} catch (Exception e) {
			System.out.println("NOT ADDED ! ");
			e.printStackTrace();
		}
		DbInteraction.Disconnect();
		return PM;
	}

	@Override
	public List<PlatsModel> findOneDisheByName(String nomPlat) {

		System.out.println("Searching Dishes ....");
		List<PlatsModel> maliste = new ArrayList<PlatsModel>();

		try {

			DbInteraction.Connecter();
			String sql3 = "SELECT * FROM plat WHERE nomPlat LIKE ? AND idPlat IS NOT NULL";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql3);
			PS.setString(1, "%" + nomPlat + "%");

			ResultSet RS = PS.executeQuery();

			while (RS.next()) {

				PlatsModel PM = new PlatsModel();
				PM.setIdPlat(RS.getInt("idPlat"));
				PM.setNomPlat(RS.getString("nomPlat"));
				//PM.setDescription(RS.getString("description"));
				PM.setPrixPlat(RS.getDouble("prixPlat"));
				PM.setImgPlat(RS.getString("imgPlat"));
				PM.setDatePub(RS.getDate("datePub").toLocalDate());

				maliste.add(PM);
				System.out.println("Liste   --->  " + RS.getString("nomPlat"));
				System.out.println(RS.getDate("datePub").toLocalDate());
			}
			PS.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		DbInteraction.Disconnect();
		return maliste;
	}

	@Override
	public PlatsModel updateADishe(PlatsModel P) {

		System.out.println("UPDATING DISHE....");
		PlatsModel disheToEdit = new PlatsModel();
		try {
			DbInteraction.Connecter();
			String sql4 = "UPDATE plat SET nomPlat=?, prixPlat=? WHERE idPlat=?";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql4);

			PS.setString(1, P.getNomPlat());
			//PS.setString(2, P.getDescription());
			PS.setDouble(2, P.getPrixPlat());
			PS.setInt(3, P.getIdPlat());
			PS.executeUpdate();
			PS.close();

		} catch (Exception e) {
			System.out.println("CANNOT UPDATE THE DISHE !");
			e.printStackTrace();
		}
		DbInteraction.Disconnect();
		return disheToEdit;
	}

	@Override
	public PlatsModel DeleteADisheById(int idPlat) {
		PlatsModel disheToDelete = new PlatsModel();
		System.out.println("DELETNG...");

		try {
			DbInteraction.Connecter();
			String sql5 = "DELETE FROM plat WHERE idPlat=?";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql5);
			PS.setInt(1, idPlat);

			int RS = PS.executeUpdate();
			PS.close();

			if (RS == 1) {
				System.out.println("Plat " + idPlat + "Deleted");
			}

			else {
				System.out.println("WE CANNOT FIND THIS ID !");

			}

		} catch (Exception e) {
			System.out.println("Sorry, cannot delete this dishe");
			e.printStackTrace();
		}
		return disheToDelete;
	}

	@Override
	public PlatsModel getOneDisheById(int id) {
		PlatsModel PM = null;
		try {

			System.out.println("Geting one dishe from dishes...");
			DbInteraction.Connecter();

			String sql6 = "SELECT *FROM plat WHERE idPlat=? AND idPlat IS NOT NULL";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql6);
			PS.setInt(1, id);

			ResultSet RS = PS.executeQuery();
			while (RS.next()) {
				PM = new PlatsModel();
				PM.setIdPlat(RS.getInt("idPlat"));
				PM.setNomPlat(RS.getString("nomPlat"));
				//PM.setDescription(RS.getString("description"));
				PM.setPrixPlat(RS.getDouble("prixPlat"));
				PM.setImgPlat(RS.getString("imgPlat"));
				PM.setDatePub(RS.getDate("datePub").toLocalDate());
			}

		} catch (Exception e) {
			System.out.println("CANNOT FIND THE ID OF THE DISHE");
			e.printStackTrace();
		}
		DbInteraction.Disconnect();
		return PM;
	}

	@Override
	public int NbrOfDishes() {
		int nbr=0;
		String sql0 = "SELECT count(*) FROM plat ";
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
