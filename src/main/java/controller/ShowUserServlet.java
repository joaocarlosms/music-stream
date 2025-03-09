package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.User;

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
    	
    	String url = "/error.jsp";
    	
    	if(pUser.equals("jcdev") && pPassword.equals("123")) {
    		User usr = new User();
    		usr.setId(1);
    		usr.setUsername("jc");
    		usr.setFullname("Joao Carlos");
    		usr.setEmail("joao@gmail.com");
    		
    		if(pModo.equals("html")) {
    			request.setAttribute("User", usr);        		
        		url = "/ok.jsp";
    		} 
    		else {
    			Gson json = new Gson();
    			String result = json.toJson(usr);
    			url = "/results.jsp";
    		}
    	}
    	
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
    	dispatcher.forward(request, response);
    }
 
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
