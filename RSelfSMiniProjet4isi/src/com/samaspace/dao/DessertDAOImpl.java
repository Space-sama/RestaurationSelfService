package com.samaspace.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;
import com.samaspace.model.DessModel;
import com.samaspace.model.PlatsModel;
import com.samaspace.util.DbInteraction;

public class DessertDAOImpl implements IDesserts{

	
	@Override
	public List<DessModel> allDesserts() {
		List<DessModel> List_of_desserts = new ArrayList<>();
		DessModel D = null;
		
		
		String sql0 = "SELECT * FROM dessert";
		
		DbInteraction.Connecter();
		ResultSet res = DbInteraction.Select(sql0);
		
		try {
			
			while(res.next()) {
				
				D = new DessModel(res.getString("nomDess"), res.getDouble("prixDess"), res.getString("imgDessert"));
				D.setIdDess(res.getInt("idDess"));
				List_of_desserts.add(D);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		DbInteraction.Disconnect();
		System.out.println("taille desserts :" +List_of_desserts.size());
		return List_of_desserts;
	}
	
	
	
	@Override
	public DessModel addDesserts(DessModel D) {
		
		try {
			DbInteraction.Connecter();
			String sql0 = "INSERT INTO dessert(nomDess, prixDess, imgDessert) VALUES(?, ?, ?)";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql0);
			PS.setString(1, D.getNomDess());
			//PS.setString(2, D.getDescription());
			PS.setDouble(2, D.getPrixDess());
			PS.setString(3, D.getImgDess());
			PS.executeUpdate();
			
			String sql1 = "SELECT MAX(idDess) as MAX_ID from dessert";
			PreparedStatement PS1 = DbInteraction.conn.prepareStatement(sql1);
			
			
			ResultSet RS = PS1.executeQuery();
			
			if(RS.next()) {
				D.setIdDess(RS.getInt("MAX_ID"));
			}
			
			String sql2 = "SELECT * FROM dessert WHERE idDess=?";
			PreparedStatement PS2 = DbInteraction.conn.prepareStatement(sql2);
			PS2.setInt(1, RS.getInt("MAX_ID"));
			
			ResultSet RS1 = PS2.executeQuery();
			if(RS1.next()) {
				D.setDatePub(RS1.getDate("datePub").toLocalDate());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CANNOT ADD THE DESSERT");
		}
		
	
		return D;
	}

	@Override
	public List<DessModel> findOneDessertByName(String nomDess) {
		System.out.println("Searching Desserts ....");
		List<DessModel> maliste = new ArrayList<DessModel>();
		
		
		try {
			
			DbInteraction.Connecter();
			String sql3= "SELECT * FROM dessert WHERE nomDess LIKE ? AND idDess IS NOT NULL";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql3);
			PS.setString(1, "%"+nomDess+"%");
			
			ResultSet RS = PS.executeQuery();
			
			while(RS.next()) {
				
				DessModel DM = new DessModel();
				DM.setIdDess(RS.getInt("idDess"));
				DM.setNomDess(RS.getString("nomDess"));
				//DM.setDescription(RS.getString("description"));
				DM.setPrixDess(RS.getDouble("prixDess"));
				DM.setImgDess(RS.getString("imgDessert"));
				DM.setDatePub(RS.getDate("datePub").toLocalDate());
				
				maliste.add(DM);
				System.out.println("Liste desserts  --->  "+RS.getString("nomDess"));
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
	public DessModel updateDessert(DessModel D) {
		System.out.println("UPDATING DESSERT....");
		DessModel dessertToEdit = new DessModel();
		try {
			DbInteraction.Connecter();
			String sql4 = "UPDATE dessert SET nomDess=?, prixDess=? WHERE idDess=?";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql4);
			
			PS.setString(1, D.getNomDess());
			//PS.setString(2, D.getDescription());
			PS.setDouble(2, D.getPrixDess());
			PS.setInt(3, D.getIdDess());
			PS.executeUpdate();
			PS.close();
			
		} catch (Exception e) {
			System.out.println("CANNOT UPDATE THE DESSERT !");
			e.printStackTrace();
		}
		DbInteraction.Disconnect();
		return dessertToEdit;
	}

	@Override
	public DessModel DeleteDessById(int idD) {
		DessModel dessertToDelete= new DessModel();
		System.out.println("DELETNG DESSERT...");
		
		try {
			DbInteraction.Connecter();
			String sql5 = "DELETE FROM dessert WHERE idDess=?";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql5);
			PS.setInt(1, idD);
			
			int RS = PS.executeUpdate();
			PS.close();
			
			if(RS == 1) {
				System.out.println("Dessert "+idD+ "Deleted");
			}
			
			else {
				System.out.println("WE CANNOT FIND THIS ID OF DESSERT !");
			
			}

		} catch (Exception e) {
			System.out.println("Sorry, cannot delete this dessert");
			e.printStackTrace();
		}
		return dessertToDelete;
	}

	@Override
	public DessModel getOneDessById(int idDess) {
		DessModel DM = null;
		try {
			
			System.out.println("Getting one dessert from desserts...");
			DbInteraction.Connecter();
			
			String sql6 = "SELECT *FROM dessert WHERE idDess=? AND idDess IS NOT NULL";
			PreparedStatement PS = DbInteraction.conn.prepareStatement(sql6);
			PS.setInt(1, idDess);
			
			ResultSet RS = PS.executeQuery();
			while(RS.next()) {
				
				DM = new DessModel();
				DM.setIdDess(RS.getInt("idDess"));
				DM.setNomDess(RS.getString("nomDess"));
				//DM.setDescription(RS.getString("description"));
				DM.setPrixDess(RS.getDouble("prixDess"));
				DM.setImgDess(RS.getString("imgDessert"));
				DM.setDatePub(RS.getDate("datePub").toLocalDate());
			}
			
		} catch (Exception e) {
			System.out.println("CANNOT FIND THE ID OF THE DESSERT");
			e.printStackTrace();
		}
		DbInteraction.Disconnect();
		return DM;
	}



	@Override
	public int nbrDesserts() {
		int nbr=0;
		String sql0 = "SELECT count(*) FROM dessert ";
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
		System.out.println("Nombre desserts :" +nbr);
		
		return nbr;
	}

	

}
