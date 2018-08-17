package Servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Director;
import Dao.LogDao;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		if(id.equals("admin")&&password.equals("admin"))
			request.getRequestDispatcher("admin.jsp").forward(request,response);
		else {
			String[]info = LogDao.login(id, password);
			if(info!=null) {
				request.setAttribute("platid",id);
				request.setAttribute("platname",info[0]);
				request.setAttribute("statue",info[1]);
				HttpSession session = request.getSession();
				session.setAttribute("currentid",id);
				session.setAttribute("currentname",info[0]);
				session.setAttribute("currentstatue",info[1]);
				request.getRequestDispatcher("Createinfor.jsp").forward(request,response);
			}
			else {
				request.setAttribute("error","编号不存在或密码有误!");
				request.getRequestDispatcher("Login.jsp").forward(request,response);
			}
		}
	}

}
