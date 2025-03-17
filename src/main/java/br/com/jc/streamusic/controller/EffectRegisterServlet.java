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
import br.com.jc.streamusic.dao.UserDAO;
import br.com.jc.streamusic.model.User;

/**
 * Servlet implementation class effectRegisterServlet
 */
@WebServlet("/effectregister")
public class EffectRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EffectRegisterServlet() {
        super();
    }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
    
    /* receive data form to manipulate data and
     * redirect user for url correct
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/login.jsp";
		String name = request.getParameter("txtName");
		String email = request.getParameter("txtEmail");
		String password = request.getParameter("txtPassword");
		String confirmPassword = request.getParameter("txtConfirmPassword");
		
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		
		DataSource ds = new DataSource();
		UserDAO userDAO = new UserDAO(ds);
		userDAO.create(user);
	
		System.out.println(user);
		
		try {
			ds.getConnection().close();
		}
		catch(SQLException e) {
			System.out.println("Error to close database"+e.getMessage());
			request.setAttribute("errorMSG", "Erro ao criar nova conta de usuário");
			url = "/error.jsp";
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
