package com.samaspace.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import com.samaspace.model.BoissModel;
import com.samaspace.model.Panier;

/**
 * Servlet implementation class AjouterBoissonPanier
 */
@WebServlet("/AjouterBoissonPanier")
public class AjouterBoissonPanier extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterBoissonPanier() {
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
		BoissModel b = new BoissModel(id,nom,prix,img);
		Panier.AjouterBoisson(b);
		response.sendRedirect("Client/boisson-page.jsp");
		

	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}
	 */
}
