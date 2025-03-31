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
		
		
		try {
			String idPlaylistParam = request.getParameter("idplaylist");
	        String idMusicParam = request.getParameter("musicId");
	        
	        if (idPlaylistParam == null || idMusicParam == null) {
	            throw new IllegalArgumentException("Parâmetros não fornecidos");
	        }
	        
	        // Passo 2: Validar valores não vazios
	        if (idPlaylistParam.isEmpty() || idMusicParam.isEmpty()) {
	            throw new IllegalArgumentException("IDs não podem ser vazios");
	        }
	        
	        // Passo 3: Converter para inteiro
	        int idPlaylist = Integer.parseInt(idPlaylistParam);
	        int idMusic = Integer.parseInt(idMusicParam);
			
			System.out.println("id playlist:"+idPlaylist);

			DataSource dataSource = new DataSource();
			PlaylistDAO plDAO = new PlaylistDAO(dataSource);
			
			if(plDAO.createMusicPlaylist(idPlaylist, idMusic)) {
				request.setAttribute("strRESULT", "OK");
			}
			else {
				request.setAttribute("strRESULT", "ERROR");
			}
			
			dataSource.getConnection().close();
		}
		catch(Exception e) {
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
