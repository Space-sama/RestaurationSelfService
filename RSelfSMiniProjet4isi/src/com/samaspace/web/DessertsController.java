package com.samaspace.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.samaspace.dao.DessertDAOImpl;
import com.samaspace.dao.IDesserts;
import com.samaspace.model.BoissModel;
import com.samaspace.model.DessModel;
import com.samaspace.model.DisheKey;

@SuppressWarnings("serial")
public class DessertsController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "C:\\Users\\MYWORLD\\eclipse-workspace\\RSelfSMiniProjet4isi\\WebContent\\images\\";
	private static final int TAILLE_TOMPON = 10249;
	
	IDesserts ID;
	
	@Override
	public void init() throws ServletException {
		ID = new DessertDAOImpl();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String path = req.getServletPath();
		
		if(path.equals("/Desserts.php")) {
			
			req.getRequestDispatcher("Desserts.jsp").forward(req, res);
		}
		
		else if(path.equals("/pushd.php")) {
			req.getRequestDispatcher("ajouterDess.jsp").forward(req, res);
		}

		else if(path.equals("/Searchd.php?key=")) {
			
			req.getRequestDispatcher("Desserts.jsp").forward(req, res);
		}
		
		else if(path.equals("/Searchd.php")) {
			String key = req.getParameter("key");
			DisheKey Dkey = new DisheKey();
			Dkey.setKeyDishe(key);
			
			List<DessModel> listeDess = ID.findOneDessertByName(key);
			Dkey.setListeDesserts(listeDess);	
			req.setAttribute("dk", Dkey);
			req.getRequestDispatcher("Desserts.jsp").forward(req, res);
		
		}
		
		
		else if(path.equals("/supprimerd.php")) {
			int idD = Integer.parseInt(req.getParameter("id"));
			ID.DeleteDessById(idD);
			res.sendRedirect("Searchd.php?key=");
		}
		
		
		else if(path.equals("/edited.php")) {
			int idDess = Integer.parseInt(req.getParameter("id"));
			DessModel DM = ID.getOneDessById(idDess);
			req.setAttribute("DMfound", DM);
			req.getRequestDispatcher("edited.jsp").forward(req, res);
		
		}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		
		if(path.equals("/insertd.php") && req.getMethod().equals("POST")) {
			String nomDess = req.getParameter("nomDess");
			//String descDess = req.getParameter("descDess");
			Double prixDess = Double.parseDouble(req.getParameter("prixDess"));
			
			// On récupère le champ du fichier
	        Part part = req.getPart("imgDess");
	            
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
	            
	            DessModel DessM = ID.addDesserts(new DessModel(nomDess, prixDess, nomFichier));
	            req.setAttribute("DessertFROMCD", DessM);
	            req.getRequestDispatcher("ValidationDess.jsp").forward(req, res);
		}
	}
		else if(path.equals("/updated.php") && req.getMethod().equals("POST")) {
			
			int idDess = Integer.parseInt(req.getParameter("id"));
			String nomDess = req.getParameter("nomDess");
			String descDess = req.getParameter("desc");
			Double prixDess = Double.parseDouble(req.getParameter("prix"));
			
			DessModel DM = new DessModel(nomDess, prixDess);
			DM.setIdDess(idDess);
			
			ID.updateDessert(DM);
			req.setAttribute("confDM", DM);
			req.getRequestDispatcher("ConfUpdate3.jsp").forward(req, res);
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
