package com.samaspace.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DbInteraction {

	public static String url="";
	public static Statement state;
	public static Connection conn;
	
	
public static void Connecter()  {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		}
		url="jdbc:mysql://localhost:3306/restauselfservice?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		
		String username = "root";
		String pass = "";
		
		try {
			
			conn = DriverManager.getConnection(url, username, pass);
			state = conn.createStatement();
			
			System.out.println("Vous êtes connecter a la base de données...");
			
		} catch (Exception e) {
			
			System.out.println("Problème dans la base de données");
			e.printStackTrace();
		}
		
		
	}

	public  static int Maj(String sql)
	{
		int nb = 0;
		try {
			nb = state.executeUpdate(sql);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return nb;
	}
	
	public static ResultSet  Select(String sql)
	{
		ResultSet rs = null;
		try {
			rs = state.executeQuery(sql);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public static void Disconnect() {
		try {
			conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println("Vous êtes déconnecter");
	}
}
