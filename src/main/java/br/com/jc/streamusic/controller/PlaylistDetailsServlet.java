package br.com.jc.streamusic.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.jc.streamusic.dao.DataSource;
import br.com.jc.streamusic.dao.PlaylistDAO;
import br.com.jc.streamusic.model.Playlist;

/**
 * Servlet implementation class PlaylistDetailsServlet
 */
@WebServlet("/playlistdetails")
public class PlaylistDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaylistDetailsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/error.jsp";
		
		if(request.getSession().getAttribute("User") != null) {
			try {
				DataSource dataSource = new DataSource();
				PlaylistDAO plDAO = new PlaylistDAO(dataSource);
				int id = Integer.parseInt(request.getParameter("id"));
				Playlist playlist = plDAO.readPlaylistDetailsById(id);
				
				if(playlist != null) {
					request.getSession().setAttribute("Playlist", playlist);
					url = "/playlistdetails.jsp";
				}
				else {
					request.setAttribute("errorSTR", "Erro ao recuperar Playlist!");
				}
			}
			catch(Exception e) {
				request.setAttribute("errorSTR", "Erro inesperado: "+e.getMessage());
			}
		}
		else {
			request.setAttribute("errorMSG", "Você não está conectado!");
			url = "/login.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
}
