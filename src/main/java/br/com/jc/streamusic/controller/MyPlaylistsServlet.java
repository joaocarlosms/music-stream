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
 * Servlet implementation class MyPlaylistsServlet
 */
@WebServlet("/myplaylists")
public class MyPlaylistsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPlaylistsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url;
		User user = (User)request.getSession().getAttribute("User");
		
		if(user == null) {
			url = "/login.jsp";
		}
		else {
			url = "/myplaylists.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
}
