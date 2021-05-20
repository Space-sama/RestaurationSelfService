package com.samaspace.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.samaspace.model.Admin;
import com.samaspace.util.DbInteraction;

public class AdminDAO_Impl implements IAdmin{

	@Override
	public Admin authentification(String email, String pwd) {
		
		Admin A=null;
		
		DbInteraction.Connecter();
		String sql0 = "SELECT * FROM admin WHERE email ='"+email+"' AND pass= '"+pwd+"' AND Etat='Open' AND (access=0 || access=1)";
		
		ResultSet rs = DbInteraction.Select(sql0);
		
		try {
			
			if(rs.next()) {
				
				A = new Admin(rs.getString("pseudo"), rs.getString("email"), rs.getString("pass"), rs.getString("etat"));
				A.setIdAdmin(rs.getInt(1));
				
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DbInteraction.Disconnect();
		return A;

	}
	
	

	@Override
	public int nbrAdmin() {
		int nbr=0;
		String sql0 = "SELECT count(*) FROM admin ";
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
		System.out.println("Nombre admin :" +nbr);
		
		return nbr;
	}



	@Override
	public int updateAdmin() {
		
		
		int nb =0;
		 
		  try {
			  DbInteraction.Connecter();
			  String sql0 = "UPDATE admin SET Etat = 'Close' WHERE idAdmin IS NOT NULL AND access=0";
			  nb = DbInteraction.Maj(sql0);
			  
		  if(nb > 0) {
			  
			 System.out.println("Admin updated to Close status");
		  }

		  else {
			  System.out.println("Admin not updated !");
		  }
		 
		
		  } catch (Exception e) {
			  
		  e.printStackTrace();
		  System.out.println("Exception Admin here !"); 
		  
		  }
		  
		  return nb;
	}



	
	  
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
