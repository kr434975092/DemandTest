package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Company;
import Bean.Director;
import Bean.Info;
import Dao.AdminDao;
import Dao.MenuDao;



/**
 * Servlet implementation class Admin
 */
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String kind1 = null;
	private static String kind2 = null;
	
    private static String su = null;
	private static String place = null;
	private static String fa = null;
	private static String skind1 = null;
	private static String skind2 = null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String page = request.getParameter("page");
		String method = request.getParameter("method");
		if(method==null) {
			
		}else if(method.equals("userList")) {
			if(page==null)page="1";
			List<Info>userList = AdminDao.getSimpleMsgList(Integer.parseInt(page),10);
			int total = AdminDao.getListCount();
			String pageCode = this.genPagation(total,Integer.parseInt(page),10,"userList");
			request.setAttribute("userList",userList);
			request.setAttribute("pageCode",pageCode);
			//request.setAttribute("showPage","userList.jsp");
			request.getRequestDispatcher("userList.jsp").forward(request, response);
		}else if(method.equals("query")) {
			String infoid = request.getParameter("infoid");
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
			request.getRequestDispatcher("InfoQuery.jsp").forward(request, response);//
		}else if(method.equals("tree")) {
			String st = request.getParameter("st");
			//System.out.println(page+" "+st);
			if(st==null) {
			if(page==null)page="1";
			String k1 = request.getParameter("k1");
			String k2 = request.getParameter("k2");
			if(k1!=null) {
				kind1 = k1;
				kind2 = k2;
			}
			//System.out.println("k1:"+k1+",k2:"+k2);
			List<Info>list = AdminDao.getSimpleMsgList(Integer.parseInt(page),10,kind1,kind2);
			if(list.size()>0)request.setAttribute("st",1);
			else request.setAttribute("st",2);
			int total = AdminDao.getListCount(kind1,kind2);  //这里得改改才行.
			String pageCode = this.genPagation(total,Integer.parseInt(page),10,"tree");
			request.setAttribute("userList",list);
			request.setAttribute("pageCode",pageCode);}
			//request.setAttribute("showPage","tree2.jsp");
			request.getRequestDispatcher("tree2.jsp").forward(request, response);
		}else if(method.equals("select")) {
			String st = request.getParameter("st");
			if(st==null) {
				
				if(page==null) {
					String su1 = request.getParameter("一级学科");
					String su2 = request.getParameter("二级学科");
					String su3 = request.getParameter("三级学科");
					
					String p = request.getParameter("province");
					String c = request.getParameter("city");
					String country = request.getParameter("country");
					
					String fa1 = request.getParameter("行业1");
					String fa2 = request.getParameter("行业2");
					String fa3 = request.getParameter("行业3");
					
					String sk1 = request.getParameter("kind");
					String sk2 = request.getParameter("field");
					
					
					su = su1+" "+su2+" "+su3;
					place = p+" "+c+" "+country;
					fa = fa1+" "+fa2+" "+fa3;
					skind1 = sk1;
					skind2 = sk2;
					
					page="1";
				}
				//System.out.println("hehe"+su+"cao");
				List<Info>list = AdminDao.getSelectMsgList(Integer.parseInt(page),10, su, fa, place, skind1, skind2);
				if(list.size()>0)request.setAttribute("st",1);
				else request.setAttribute("st",2);
				//System.out.println("hehe"+place+"cao");
				int total = AdminDao.getListCount(su, fa, place, skind1, skind2);
				String pageCode = this.genPagation(total,Integer.parseInt(page),10,"select");
				request.setAttribute("userList",list);
				request.setAttribute("pageCode",pageCode);
			}
			//request.setAttribute("showPage","testsel.jsp");
			request.getRequestDispatcher("testsel.jsp").forward(request,response);
			//request.getRequestDispatcher("select.jsp").forward(request,response);
		}
		
	}
	
	public String genPagation(int totalNum,int currentPage,int pageSize,String title) {
		int totalPage = totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		StringBuffer pageCode = new StringBuffer();
		pageCode.append("<li><a href='admin?method="+title+"&page=1'>首页</a></li>");
		if(currentPage==1) {
			//pageCode.append("<li class='disabled'><a href='#'>上一页</a></li>");
		}else {
			pageCode.append("<li><a href='admin?method="+title+"&page="+(currentPage-1)+"'>上一页</a></li>");
		}
		for(int i=currentPage-2;i<=currentPage+2;i++) {
			if(i<1||i>totalPage) {
				continue;
			}
			if(i==currentPage) {
				pageCode.append("<li class='active'><a href='#'>"+i+"</a></li>");
			} else {
				pageCode.append("<li><a href='admin?method="+title+"&page="+i+"'>"+i+"</a></li>");
			}
		}
		if(currentPage==totalPage) {
			//pageCode.append("<li class='disabled'><a href='#'>下一页</a></li>");
		} else {
			pageCode.append("<li><a href='admin?method="+title+"&page="+(currentPage+1)+"'>下一页</a></li>");
		}
		pageCode.append("<li><a href='admin?method="+title+"&page="+totalPage+"'>尾页</a></li>");
		return pageCode.toString();
	}
	
}
