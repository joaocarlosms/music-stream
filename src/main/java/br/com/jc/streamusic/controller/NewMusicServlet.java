package br.com.jc.streamusic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewMusicServlet
 */
@WebServlet("/newmusic")
public class NewMusicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewMusicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/error.jsp";
		
		if(request.getSession().getAttribute("User") != null) {
			url = "/newmusic.jsp";
		}
		else {
			request.setAttribute("errorSTR", "Erro: Usuário não encontrado");
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
}
