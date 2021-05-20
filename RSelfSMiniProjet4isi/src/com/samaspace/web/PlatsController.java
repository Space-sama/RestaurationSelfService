package com.samaspace.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

//import org.apache.catalina.connector.Response;

import com.samaspace.dao.IPlats;
import com.samaspace.dao.PlatsDAO_impl;
import com.samaspace.model.DisheKey;
import com.samaspace.model.PlatsModel;


@SuppressWarnings("serial")
public class PlatsController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "C:\\Users\\MYWORLD\\eclipse-workspace\\RSelfSMiniProjet4isi\\WebContent\\images\\";
	private static final int TAILLE_TOMPON = 10249;
	
	IPlats IP;
	@Override
	public void init() throws ServletException {
		
		IP = new PlatsDAO_impl();
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		
		if(path.equals("/Search.io?key=")) {
			
			req.getRequestDispatcher("Plats.jsp").forward(req, res);
		}
		
		
		else if(path.equals("/statistiques.io")) {
			req.getRequestDispatcher("statistiques.jsp").forward(req, res);
		}
		
 		
		else if(path.equals("/admin.io")) {
			req.getRequestDispatcher("PageAdministration.jsp").forward(req, res);
		}
		
		else if(path.equals("/push.io")) {
			
			req.getRequestDispatcher("ajouterPlats.jsp").forward(req, res);
		}
		
		else if(path.equals("/Search.io")) {
			
			  String key = req.getParameter("key"); 
			  DisheKey Dkey = new DisheKey();
			  Dkey.setKeyDishe(key);
			  
			  List<PlatsModel> listPlats = IP.findOneDisheByName(key);
			  Dkey.setPlatmod(listPlats); 
			  req.setAttribute("dk", Dkey);
			  req.getRequestDispatcher("Plats.jsp").forward(req, res);
		}
		
		 else if(path.equals("/editeP.io")) {
			 int idP = Integer.parseInt(req.getParameter("id"));
			 PlatsModel PM = IP.getOneDisheById(idP);
			 req.setAttribute("PMfound", PM);
			 req.getRequestDispatcher("editer.jsp").forward(req, res);
		 }

	 
		else if(path.equals("/supprimer.io")) {
		 int idP =  Integer.parseInt(req.getParameter("id"));
		 IP.DeleteADisheById(idP);
		 res.sendRedirect("Search.io?key=");
		 
	 }
		
	
	 else if(path.equals("/disconnect.io")) {
			
			HttpSession sess = req.getSession();
			sess.getAttribute("sessAdmin");
			sess.invalidate();
			req.getRequestDispatcher("admin-page.jsp").forward(req, res);
			
		}
		
	 else if(path.equals("/error.io")) {
			req.getRequestDispatcher("error.jsp").forward(req, res);
		}
		
	 else {
		 
		 res.sendError(res.SC_NOT_FOUND);
		 System.out.println("ERROORR 404");
	 }
		
	 
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
			String path = req.getServletPath();
			
		 if(path.equals("/insert.io") && req.getMethod().equals("POST")) {
			
			String nom_plat = req.getParameter("nomPlat");
			//String desc_plat = req.getParameter("desc");
			double prix_plat = Double.parseDouble(req.getParameter("prix"));
			//String image_plat = req.getParameter("imgPlat");
			
			// On récupère le champ du fichier
	        Part part = req.getPart("imgPlat");
	            
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
	        }
			
			PlatsModel pm = IP.addDishes(new PlatsModel(nom_plat, prix_plat, nomFichier));
			
			req.setAttribute("platFromCS", pm);
			
			req.getRequestDispatcher("ValidationPlat.jsp").forward(req, res);
		}
		 
		 
		 else if(path.equals("/update.io") && req.getMethod().equals("POST")) {
			 
				int id = Integer.parseInt(req.getParameter("id"));
				String nom_plat = req.getParameter("nomPlat");
				//String desc_plat = req.getParameter("desc");
				double prix_plat = Double.parseDouble(req.getParameter("prix"));
				
				
				
				PlatsModel P = new PlatsModel(nom_plat, prix_plat);
				P.setIdPlat(id);
				
				
				IP.updateADishe(P);
				req.setAttribute("confPM", P);
				req.getRequestDispatcher("/ConfUpdate.jsp").forward(req, res);
			 }
		 
		 else {
			 res.sendError(res.SC_NOT_FOUND);
			 System.out.println("ERROORR 404");
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
