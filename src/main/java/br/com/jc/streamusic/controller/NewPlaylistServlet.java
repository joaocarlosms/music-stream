package br.com.jc.streamusic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.jc.streamusic.model.User;

/**
 * Servlet implementation class MyPlaylistServlet
 */
@WebServlet("/newplaylist")
public class NewPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NewPlaylistServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("User");
		String url = "/login.jsp";
		
		if(user != null) {
			url = "/newplaylist.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
