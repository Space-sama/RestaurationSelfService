package com.samaspace.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.samaspace.dao.BoissonsDAO_Impl;
import com.samaspace.dao.IBoisson;
import com.samaspace.model.BoissModel;
import com.samaspace.model.DisheKey;

@SuppressWarnings("serial")
public class BoissonsController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "C:\\Users\\MYWORLD\\eclipse-workspace\\RSelfSMiniProjet4isi\\WebContent\\images\\";
	private static final int TAILLE_TOMPON = 10249;
	
	
	IBoisson IB;
	
	@Override
	public void init() throws ServletException {
		IB = new BoissonsDAO_Impl();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String path = req.getServletPath();
		
		if(path.equals("/boissons.net")) {
			req.getRequestDispatcher("Boissons.jsp").forward(req, res);
		}
		
		else if(path.equals("/pushb.net")) {
			req.getRequestDispatcher("ajouterBoiss.jsp").forward(req, res);
		}
		
		else if(path.equals("/Searchb.net?key=")) {
			
			req.getRequestDispatcher("Boissons.jsp").forward(req, res);
		}

		
		
		
		else if(path.equals("/Searchb.net")) {
			String key = req.getParameter("key");
			DisheKey Dkey = new DisheKey();
			Dkey.setKeyDishe(key);
			
			List<BoissModel> listBoiss = IB.findOneDrinkByName(key);
			Dkey.setListeBoiss(listBoiss);	
			req.setAttribute("dk", Dkey);
			req.getRequestDispatcher("Boissons.jsp").forward(req, res);
		
		}
		
		else if(path.equals("/supprimerb.net")) {
			int idB = Integer.parseInt(req.getParameter("id"));
			IB.DeleteADrinkById(idB);
			res.sendRedirect("Searchb.net?key=");
		}
		
		else if(path.equals("/editeb.net")) {
			int idBoiss = Integer.parseInt(req.getParameter("id"));
			BoissModel BM = IB.getOneDrinkById(idBoiss);
			req.setAttribute("BMfound", BM);
			req.getRequestDispatcher("editeb.jsp").forward(req, res);
		
		}
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		
		if(path.equals("/insertb.net") && req.getMethod().equals("POST")) {
			String nomBoiss = req.getParameter("nomBoiss");
			//String descBoiss = req.getParameter("descBoiss");
			Double prixBoiss = Double.parseDouble(req.getParameter("prixBoiss"));
			
			// On récupère le champ du fichier
	        Part part = req.getPart("imgBoiss");
	            
	        // On vérifie qu'on a bien reçu un fichier
	        String nomFichier = getNomFichier(part);

	        // Si on a bien un fichier
	        if (nomFichier != null && !nomFichier.isEmpty()) {
	            String nomChamp = part.getName();
	            
	            //System.out.println(nomChamp);
	            // Corrige un bug du fonctionnement d'Internet Explorer
	             nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1).substring(nomFichier.lastIndexOf('\\') + 1);

	            // On écrit définitivement le fichier sur le disque
	            ecrireFichier(part, nomFichier, SAVE_DIR);
	            req.setAttribute(nomChamp, nomFichier);
	            
	            BoissModel BoissM = IB.addDrinks(new BoissModel(nomBoiss, prixBoiss, nomFichier));
	            req.setAttribute("BoissonFROMCB", BoissM);
	            req.getRequestDispatcher("ValidationBoiss.jsp").forward(req, res);
	            
			
		}
	}
		else if(path.equals("/updateb.net") && req.getMethod().equals("POST")) {
			
			int idBoiss = Integer.parseInt(req.getParameter("id"));
			String nomBoiss = req.getParameter("nomBoiss");
			String descBoiss = req.getParameter("desc");
			Double prixBoiss = Double.parseDouble(req.getParameter("prix"));
			
			BoissModel BM = new BoissModel(nomBoiss, prixBoiss);
			BM.setIdBoiss(idBoiss);
			
			IB.updateADrink(BM);
			req.setAttribute("confBM", BM);
			req.getRequestDispatcher("ConfUpdate2.jsp").forward(req, res);
		}
	
	
}
	
	private void ecrireFichier( Part part, String nomFichier, String chemin ) throws IOException {
        BufferedInputStream entree = null;
        BufferedOutputStream sortie = null;
        try {
            entree = new BufferedInputStream(part.getInputStream(), TAILLE_TOMPON);
            sortie = new BufferedOutputStream(new FileOutputStream(new File(chemin + nomFichier)), TAILLE_TOMPON);

            byte[] tampon = new byte[TAILLE_TOMPON];
            int longueur;
            while ((longueur = entree.read(tampon)) > 0) {
                sortie.write(tampon, 0, longueur);
            }
        } finally {
            try {
                sortie.close();
            } catch (IOException ignore) {
            }
            try {
                entree.close();
            } catch (IOException ignore) {
            }
        }
    }
	
	
	 private static String getNomFichier( Part part ) {
	        for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
	            if ( contentDisposition.trim().startsWith( "filename" ) ) {
	                return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
	            }
	        }
	        return "";
	    } 
	
	
}
