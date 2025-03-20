package br.com.jc.streamusic.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.jc.streamusic.dao.DataSource;
import br.com.jc.streamusic.dao.PlaylistDAO;
import br.com.jc.streamusic.model.Playlist;
import br.com.jc.streamusic.model.User;

/**
 * Servlet implementation class EffectPlaylistServlet
 */
@WebServlet("/effectplaylist")
public class EffectPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EffectPlaylistServlet() {
        super();
    }

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/login.jsp";
		
		try {
			User user = (User) request.getSession().getAttribute("User");
			
			if(user != null) {
				String title = request.getParameter("playlistTitle");
				Playlist pl = new Playlist();
				pl.setTitle(title);
				pl.setUser(user);
				System.out.println(pl);
				
				DataSource ds = new DataSource();
				PlaylistDAO plDAO = new PlaylistDAO(ds);
				plDAO.create(pl);
				ds.getConnection().close();
				
				if(user.getPlaylist() == null) {
					user.setPlaylist(new ArrayList<Playlist>());
				}
				
				user.getPlaylist().add(pl);
				
				/*Temos que pegar nosso user na session
				 * de novo por causa que ele sofreu alteração,
				 * para evitar erro, é melhor atualiza-lo na sessão também */
				request.getSession().setAttribute("User", user);
				url = "/myplaylists.jsp";
			}
		}
		catch(Exception e) {
			System.out.println("Erro ao cadastrar new playlist"+e.getMessage());
			request.setAttribute("errorSTR", "Error ao criar a playlist");
			url = "/error.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
