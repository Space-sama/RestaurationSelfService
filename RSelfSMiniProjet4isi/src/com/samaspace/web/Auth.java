package com.samaspace.web;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.samaspace.dao.AdminDAO_Impl;
import com.samaspace.dao.IAdmin;
import com.samaspace.model.Admin;

/**
 * Servlet implementation class Auth
 */
public class Auth extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IAdmin AI;
	static int nbr = 0;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Auth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
	AI = new AdminDAO_Impl();
		

	}

	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		
		
			
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		Admin a = AI.authentification(email, pwd);
		Admin adminToEd = null;
		HttpSession sess = req.getSession();
		//boolean login=false;
		
		
		
		//for(int etat=0; etat<3;++etat) {
			if(a!=null) {
				
				sess.setAttribute("sessAdmin", a); 
				res.sendRedirect("PageAdministration.jsp");
				nbr =0;
				//login = true;
				//break;
			}
			
			
			if(a == null) {
				nbr++;
				if(nbr <= 2) {
					
					System.out.println("Tetative num "+nbr);
					
					System.out.println("Try again");
					res.sendRedirect("admin-page.jsp");
					
					//req.setAttribute("nbrTenta", nbr);
					//req.getRequestDispatcher("admin-page.jsp").forward(req, res);
					
					
				}
			
				if(nbr > 2) { 
				int e  = AI.updateAdmin();
				if(e == 1) {
					res.sendRedirect("error.io");
					//req.setAttribute("CloseAdmin", String.valueOf(e));
					//req.getRequestDispatcher("admin-page.jsp").forward(req, res);
					nbr = 0;
				}
				else 
					res.sendRedirect("error.io");
				
					//req.setAttribute("ClosAdmin", a);
					//req.getRequestDispatcher("admin-page.jsp").forward(req, res);
					}
				
			}
				
				
				

				
				
			
				
		
		
	}
		
	
	
	
		

}
