package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import Util.DBUtil;



public class Cservlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public Cservlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		doPost(request, response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		System.out.println(111);
		if("chart1".equals(method))
		{
			try {
				try {
					chart1(request,response);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if("chart2".equals(method))
		{
			try {
				try {
					chart2(request,response);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private void chart2(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, JSONException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("utf-8");
		String test1=request.getParameter("test");
		
		int test = Integer.parseInt(test1);


		System.out.println(test);
		String sql="select province,count(*) from class group by province";
		if(test==2)
		{
			
			String list = request.getParameter("list");
			
			sql="select city,count(*) from class where province='"+list+"' group by city";
		}
		if(test==3)
		{
			
			String list = request.getParameter("list");
			sql="select area,count(*) from class where city='"+list+"' group by area";
		}
		JSONObject obj =new JSONObject();
		Connection con = DBUtil.getConection();
		PreparedStatement pre = null;
		ResultSet rs = null;
		pre = con.prepareStatement(sql);
		rs = pre.executeQuery();
		while(rs.next())
		{
			obj.append(rs.getString(1),rs.getInt(2));
					
		}
	PrintWriter out = response.getWriter();
		out.print(obj);
	}
	private void chart1(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, JSONException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("utf-8");
		JSONObject obj =new JSONObject();
		Connection con = DBUtil.getConection();
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql="select province,count(*) from class group by province";
		pre = con.prepareStatement(sql);
		rs = pre.executeQuery();
		while(rs.next())
		{
			obj.append(rs.getString(1),rs.getInt(2));
					
		}
		
		
		PrintWriter out = response.getWriter();
		out.print(obj);
	}
	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
