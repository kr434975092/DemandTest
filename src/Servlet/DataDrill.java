package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.alibaba.fastjson.JSONObject;

import Bean.DataM;
import Dao.Drill;

import java.util.ArrayList;
import java.util.List;


/**
 * Servlet implementation class DataDrill
 */
public class DataDrill extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("doGet");
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String option = request.getParameter("option");
		if(option==null) {
			String key = request.getParameter("key");
			List<DataM>list = Drill.getGroup(key);
			List<String>keyList = new ArrayList<String>();
			List<Integer>valueList = new ArrayList<Integer>();
			for(DataM temp:list) {
				keyList.add(temp.getTitle());
				valueList.add(temp.getCount());
			}
			JSONObject json = new JSONObject();
			json.put("key",keyList);
			json.put("value",valueList);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}else if(option.equals("1")) {
			
			String focus = request.getParameter("focus");
			String[]list = request.getParameterValues("list[]");
			
			System.out.println(focus);
			System.out.println(list[0]);
			/*List<DataM>list2 = Drill.getGroup1(focus,list);
			List<String>keyList = new ArrayList<String>();
			List<Integer>valueList = new ArrayList<Integer>();
			for(DataM temp:list2) {
				keyList.add(temp.getTitle());
				valueList.add(temp.getCount());
			}
			JSONObject json = new JSONObject();
			json.put("key",keyList);
			json.put("value",valueList);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());*/
		}
	}
	
	

}
