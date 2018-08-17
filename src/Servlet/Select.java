package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;
import java.util.List;

import Bean.Company;
import Bean.Director;
import Bean.Info;
import Util.DBUtil;
import Dao.SelectDao;

/**
 * Servlet implementation class Select
 */

public class Select extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String option = request.getParameter("option");
		if(option.equals("1")) {
			String[]key = request.getParameterValues("key[]");
			String[]value = request.getParameterValues("value[]");
			String[]orand = request.getParameterValues("orand[]");
			String[]lidu = request.getParameterValues("lidu[]");
			String[]month = request.getParameterValues("month[]");
			String[]year = request.getParameterValues("year[]");
			List<Info>list = SelectDao.resAjax(key, value, orand, lidu, month, year);
			JSONArray array = new JSONArray();
			for(Info info:list) {
				JSONObject json = new JSONObject();
				json.put("id",info.getInfoid());
				json.put("name",info.getName());
				json.put("pk",info.getField());
				json.put("status",info.getStatus()==1?"已认证":"未认证");
				array.put(json);
			}
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(array.toString());
			//
		}else if(option.equals("2")) {
			String[]key = request.getParameterValues("key[]");
			String[]value = request.getParameterValues("value[]");
			String[]orand = request.getParameterValues("orand[]");
			String[]lidu = request.getParameterValues("lidu[]");
			String[]month = request.getParameterValues("month[]");
			String[]year = request.getParameterValues("year[]");
			String title = request.getParameter("title");
			int op = Integer.parseInt(request.getParameter("option1"));
			String params1 = request.getParameter("params1");
			String params2 = request.getParameter("params2");
			String params3 = request.getParameter("params3");
			List<Info>list = SelectDao.resAjax2(title,params1,params2,params3,op,key, value, orand, lidu, month, year);
			JSONArray array = new JSONArray();
			for(Info info:list) {
				JSONObject json = new JSONObject();
				json.put("id",info.getInfoid());
				json.put("name",info.getName());
				json.put("pk",info.getField());
				json.put("status",info.getStatus()==1?"已认证":"未认证");
				array.put(json);
			}
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(array.toString());
		}
	}
	public String genPagation(int totalNum,int currentPage,int pageSize,String title) {
		int totalPage = totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		StringBuffer pageCode = new StringBuffer();
		pageCode.append("<li><a href='select?method="+title+"&page=1'>首页</a></li>");
		if(currentPage==1) {
			//pageCode.append("<li class='disabled'><a href='#'>上一页</a></li>");
		}else {
			pageCode.append("<li><a href='select?method="+title+"&page="+(currentPage-1)+"'>上一页</a></li>");
		}
		for(int i=currentPage-2;i<=currentPage+2;i++) {
			if(i<1||i>totalPage) {
				continue;
			}
			if(i==currentPage) {
				pageCode.append("<li class='active'><a href='#'>"+i+"</a></li>");
			} else {
				pageCode.append("<li><a href='select?method="+title+"&page="+i+"'>"+i+"</a></li>");
			}
		}
		if(currentPage==totalPage) {
			//pageCode.append("<li class='disabled'><a href='#'>下一页</a></li>");
		} else {
			pageCode.append("<li><a href='select?method="+title+"&page="+(currentPage+1)+"'>下一页</a></li>");
		}
		pageCode.append("<li><a href='select?method="+title+"&page="+totalPage+"'>尾页</a></li>");
		return pageCode.toString();
	}
}
