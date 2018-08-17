package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Company;
import Bean.Director;
import Bean.Info;
import Dao.MenuDao;
import Dao.MsDao;

/**
 * Servlet implementation class Menu
 */

public class Menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String t = request.getParameter("t");
		if(t.equals("edit")||t.equals("update")) {
			HttpSession session = request.getSession();
			String infoid = (String)(session.getAttribute("currentid"));
			String statue = (String)(session.getAttribute("currentstatue"));
			if(t.equals("update")&&statue.equals("未完善")) {
				request.setAttribute("information","您的平台信息尚未完善,请先在基本信息表中填写这些信息");
				//request.setAttribute("showPage","infomsg.jsp");
				request.getRequestDispatcher("infomsg.jsp").forward(request, response);
				return;
			}
			List list = MenuDao.getInfo(infoid);
			Info info = (Info)(list.get(0));
			String pcc = info.getPlace();
			String[]pt = new String[3];
			if(pcc!=null&&!pcc.equals("")) {
				pt = pcc.split(" ");
			}
			Company company = list.get(1)==null?null:(Company)(list.get(1));
			String[]ci = (String[])(list.get(2));
			String[]si = (String[])(list.get(3));
			String[]ei = (String[])(list.get(4));
			Director director = list.get(5)==null?null:(Director)(list.get(5));
			request.setAttribute("info",info);
			request.setAttribute("company",company);
			request.setAttribute("ci",ci);
			request.setAttribute("si",si);
			request.setAttribute("ei",ei);
			request.setAttribute("province",pt[0]);
			request.setAttribute("city",pt[1]);
			request.setAttribute("country",pt[2]);
			request.setAttribute("director",director);
			//request.setAttribute("showPage","InfoEdit.jsp");
			request.getRequestDispatcher("InfoEdit.jsp").forward(request, response);
		}
		else if(t.equals("logout")) {
			HttpSession session = request.getSession();
			session.removeAttribute("currentid");
			session.removeAttribute("currentname");
			session.removeAttribute("currentstatue");
			request.getRequestDispatcher("Index.jsp").forward(request, response);
		}
		else if(t.equals("keys")) {
			String newpass = request.getParameter("newpass");
			HttpSession session = request.getSession();
			String infoid = (String)(session.getAttribute("currentid"));
			MsDao.updateKeys(infoid, newpass);
			session.removeAttribute("currentid");
			session.removeAttribute("currentname");
			session.removeAttribute("currentstatue");
			request.setAttribute("pid",infoid);
			request.setAttribute("error","已修改密码,请重新登陆");
			request.getRequestDispatcher("Index.jsp").forward(request, response);
		}else if(t.equals("fix")) {
			//request.setAttribute("showPage","key.jsp");
			request.getRequestDispatcher("key.jsp").forward(request, response);
		}else if(t.equals("query")) {
			HttpSession session = request.getSession();
			String infoid = (String)(session.getAttribute("currentid"));
			String statue = (String)(session.getAttribute("currentstatue"));
			if(statue.equals("未完善")) {
				request.setAttribute("information","您的平台信息尚未完善,请先在基本信息表中填写这些信息");
				//request.setAttribute("showPage","infomsg.jsp");
				request.getRequestDispatcher("infomsg.jsp").forward(request, response);
				return;
			}
			List list = MenuDao.getInfo(infoid);
			Info info = (Info)(list.get(0));
			String pcc = info.getPlace();
			String[]pt = new String[3];
			if(pcc!=null&&!pcc.equals("")) {
				pt = pcc.split(" ");
			}
			Company company = list.get(1)==null?null:(Company)(list.get(1));
			String[]ci = (String[])(list.get(2));
			String[]si = (String[])(list.get(3));
			String[]ei = (String[])(list.get(4));
			Director director = list.get(5)==null?null:(Director)(list.get(5));
			request.setAttribute("info",info);
			request.setAttribute("company",company);
			request.setAttribute("ci",ci);
			request.setAttribute("si",si);
			request.setAttribute("ei",ei);
			request.setAttribute("director",director);
			//request.setAttribute("showPage","InfoQuery.jsp");
			request.getRequestDispatcher("InfoQuery.jsp").forward(request, response);
		}
	}

}
