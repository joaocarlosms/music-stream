package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowUserServlet
 */
@WebServlet("/ShowUserServlet")
public class ShowUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowUserServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String pUser = request.getParameter("user");
    	String pPassword = request.getParameter("password");
    	String pModo = request.getParameter("modo");
    	
    	System.out.println("User -> "+ pUser);
    	System.out.println("Password -> "+ pPassword);
    	System.out.println("Modo -> "+ pModo);
    	
    	
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ok.jsp");
    	dispatcher.forward(request, response);
    }
 
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
