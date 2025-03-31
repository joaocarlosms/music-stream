package br.com.jc.streamusic.controller;

import java.io.IOException;
import java.security.Identity;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.jc.streamusic.dao.DataSource;
import br.com.jc.streamusic.dao.MusicDAO;
import br.com.jc.streamusic.model.User;

/**
 * Servlet implementation class RecoverMusicServlet
 */
@WebServlet(name = "RecoverMusicsServlet", urlPatterns = { "/recovermusics" })
public class RecoverMusicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecoverMusicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/error.jsp";
		
		try {
			User user = (User) request.getSession().getAttribute("User");
			
			if(user == null) {
				request.setAttribute("errorSTR", "Usuário não conectado!");
			}
			else {
				DataSource dataSource = new DataSource();
				MusicDAO musDAO = new MusicDAO(dataSource);
				List<Object> list = musDAO.read(null);
				System.out.println(list);
				
				if(list == null) {
					request.setAttribute("errorSTR", "Erro ao recuperar musicas");
				}
				else {
					String idPlaylist = request.getParameter("idplaylist");
					System.out.println("DEBUG ID PLAYLIST: "+ idPlaylist);
					request.setAttribute("idplaylist", idPlaylist);
					
					request.setAttribute("ListMusics", list);
					url = "/mymusics.jsp";
				}
				
				dataSource.getConnection().close();
			}
		}
		catch(Exception e) {
			System.out.println("Erro ao carregar pagina de musicas: "+e.getMessage());
			request.setAttribute("errorSTR", "Erro ao carregar página de músicas");
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
}
