package com.samaspace.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.samaspace.model.Panier;
import com.samaspace.model.PlatsModel;

/**
 * Servlet implementation class AjouterPlatPanier
 */
@WebServlet("/AjouterPlatPanier")
public class AjouterPlatPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterPlatPanier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String nom=request.getParameter("nom");
		double prix=Double.parseDouble(request.getParameter("prix"));
		String img=request.getParameter("img");
		PlatsModel p = new PlatsModel(id,nom,prix,img);
		Panier.AjouterPlat(p);
		response.sendRedirect("Client/plat-page.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
 */
}
