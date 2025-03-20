package br.com.jc.streamusic.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class PlaylistsServlet
 */
@WebServlet("/myplaylists")
public class PlaylistsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PlaylistsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/login.jsp";
		try {
			User user = (User) request.getSession().getAttribute("User");
			System.out.println("User da sessao: "+user);
			
			if(user.getPlaylist() == null) {
				DataSource ds = new DataSource();
				PlaylistDAO plDAO = new PlaylistDAO(ds);
				List<Object> list = plDAO.read(user.getId());
				
				if(list != null) {
					ArrayList<Playlist> myPlaylists = new ArrayList<>();
					
					for(Object obj : list) {
						Playlist newPl = (Playlist) obj;
						newPl.setUser(user);
						myPlaylists.add(newPl);
					}
					
					user.setPlaylist(myPlaylists);
				}
			}
			
			request.getSession().setAttribute("User", user);
			url = "/myplaylists.jsp";
		}
		catch(Exception e) {
			System.out.println("Erro ao recuperar playlists: "+e.getMessage());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
