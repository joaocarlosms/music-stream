package br.com.jc.streamusic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.jc.streamusic.dao.DataSource;
import br.com.jc.streamusic.dao.UserDAO;
import br.com.jc.streamusic.model.User;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_email = request.getParameter("txtEmail");
		String user_password = request.getParameter("txtPassword");
		String url = "/error.jsp";
		User usr = new User();
		DataSource ds;
		
		System.out.println("Email: "+ user_email);
		System.out.println("Password: "+ user_password);
		
		usr.setEmail(user_email);
		usr.setPassword(user_password);
		
		try { 
			ds = new DataSource();
			UserDAO userDAO = new UserDAO(ds);
			List<Object> res = userDAO.read(usr);
			
			if(res != null && res.size() > 0) {
				url = "/myaccount.jsp";
				request.getSession().setAttribute("User", res.get(0));
			}
			else {
				request.setAttribute("errorSTR", "Usuario / Senha inválidos");
			}
			ds.getConnection().close();
		} 
		catch(Exception e) {
			request.setAttribute("errorSTR", "Erro ao recuperar");
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
