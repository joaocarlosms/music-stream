package br.com.jc.streamusic.controller;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class IncludePlaylistServlet
 */
@WebServlet("/includeplaylist")
public class IncludePlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncludePlaylistServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/result.jsp";
		DataSource dataSource = null;
		
		try {
	        int idMusic = Integer.parseInt(request.getParameter("musicId"));
	        Playlist playlist = (Playlist) request.getSession().getAttribute("Playlist");
	        
	        if(playlist != null) {
	        	request.getSession().setAttribute("Playlist", playlist);
	        }
	        else {
	        	request.setAttribute("strRESULT", "ERRO Playlist");
	        }
	        
	        
			System.out.println("id playlist:"+playlist.getId());

			dataSource = new DataSource();
			PlaylistDAO plDAO = new PlaylistDAO(dataSource);
			
			if(plDAO.createMusicPlaylist(playlist.getId(), idMusic)) {
				request.setAttribute("strRESULT", "OK");
			}
			else {
				request.setAttribute("strRESULT", "ERROR");
			}
			
			dataSource.getConnection().close();
		}
		catch(Exception e) {
			try {
				if(dataSource != null) {
					dataSource.getConnection().close();
				}
			}
			catch(SQLException ex) {
				ex.printStackTrace();
			}
			
			e.printStackTrace();
			request.setAttribute("strRESULT", "Erro ao inserir musica na playlist");
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
}
