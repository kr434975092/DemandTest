package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.Company;
import Bean.Director;
import Bean.Info;
import Util.DBUtil;


public class AdminDao {
	public static List<Info> getSimpleMsgList(int pageStart,int pageSize){
		List<Info>list = new ArrayList<Info>();
		String sql = "select * from info limit "+(pageStart-1)*pageSize+","+pageSize;
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setId(rs.getInt("id"));
				info.setInfoid(rs.getString("infoid"));
				info.setField(rs.getString("pk"));
				info.setName(rs.getString("name"));
				info.setStatus(rs.getInt("status"));
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			//e.printStackTrace();
			System.out.println(e.getMessage()+" AdminDao:getSimpleMsgList");
		}
		finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		
		return list;
	}
	
	public static int getListCount() {
		int count = 0;
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql = "select count(*) total from info";
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			if(rs.next())count = rs.getInt("total");
			else count = 0;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		
		return count;
	}
	
	public static int getListCount(String k1,String k2) {
		int count = 0;
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql = "select count(*) total from info where "+k1+" = ?";
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sql);
			pre.setString(1,k2);
			rs = pre.executeQuery();
			if(rs.next())count = rs.getInt("total");
			else count = 0;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		
		return count;
	}
	
	public static List<Info> getSimpleMsgList(int pageStart,int pageSize,String k1,String k2){
		List<Info>list = new ArrayList<Info>();
		String sql = "select * from info where "+k1+" = ? limit "+(pageStart-1)*pageSize+","+pageSize;
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sql);
			pre.setString(1,k2);
			rs = pre.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setId(rs.getInt("id"));
				info.setInfoid(rs.getString("infoid"));
				info.setField(rs.getString("pk"));
				info.setName(rs.getString("name"));
				info.setStatus(rs.getInt("status"));
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			//e.printStackTrace();
			System.out.println(e.getMessage()+" AdminDao:getSimpleMsgList");
		}
		finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		
		return list;
	}
	
	public static int getListCount(String su,String fa,String place,String skind1,String skind2) {
		int count = 0;
		String[]str = new String[5];
		for(int i = 0;i<5;++i)
			str[i] = "";
		StringBuffer sb = new StringBuffer("select count(*) total from info");
		if(!su.equals("  ")) {
			sb.append(" join si on info.infoid=si.pid");
			str[0] = " si.name like '%"+su+"%'";
		}
		if(!fa.equals("  ")) {
			sb.append(" join ei on info.infoid=ei.pid");
			str[1] = " ei.name like '%"+fa+"%'";
		}
		if(!place.equals("  "))str[2]=" pcc like '%"+place+"%'";
		if(!skind1.equals(""))str[3]=" kind='"+skind1+"'";
		if(!skind2.equals(""))str[4]=" pk='"+skind2+"'";
		int flag = 0;
		for(int i = 0;i<5;++i) {
			if(!str[i].equals("")) {
				flag = i;
				sb.append(" where");
				break;
			}
		}
		
		for(int i = 0;i<5;i++) {
			if(!str[i].equals("")) {
				if(i!=flag) {
					sb.append(" and");
					sb.append(str[i]);
				}else
					sb.append(str[i]);
			}
		}
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sb.toString());
			rs = pre.executeQuery();
			if(rs.next())count = rs.getInt("total");
			else count = 0;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			//e.printStackTrace();
			System.out.println(e.getMessage()+" AdminDao:getSelectMsgList1");
		}
		finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return count;
	}
	
	public static List<Info>getSelectMsgList(int pageStart,int pageSize,String su,String fa,String place,String skind1,String skind2){
		
		//su  代表学科
		//fa  代表行业
		//place 代表所属市县
		//skind1 代表建设类型
		//skind2 代表技术领域
		String[]str = new String[5];
		for(int i = 0;i<5;++i)
			str[i] = "";
		List<Info>list = new ArrayList<Info>();
		StringBuffer sb = new StringBuffer("select info.id,info.name,infoid,pk,status from info");
		if(!su.equals("  ")) {
			sb.append(" join si on info.infoid=si.pid");
			str[0] = " si.name like '%"+su+"%'";
		}
		if(!fa.equals("  ")) {
			sb.append(" join ei on info.infoid=ei.pid");
			str[1] = " ei.name like '%"+fa+"%'";
		}
		if(!place.equals("  "))str[2]=" pcc like '%"+place+"%'";
		if(!skind1.equals(""))str[3]=" kind='"+skind1+"'";
		if(!skind2.equals(""))str[4]=" pk='"+skind2+"'";
		int flag = 0;
		for(int i = 0;i<5;++i) {
			if(!str[i].equals("")) {
				flag = i;
				sb.append(" where");
				break;
			}
		}
		
		for(int i = 0;i<5;i++) {
			if(!str[i].equals("")) {
				if(i!=flag) {
					sb.append(" and");
					sb.append(str[i]);
				}else
					sb.append(str[i]);
			}
		}
		sb.append(" limit "+(pageStart-1)*pageSize+","+pageSize);
		//System.out.println(sb.toString());
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sb.toString());
			rs = pre.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setId(rs.getInt("info.id"));
				info.setInfoid(rs.getString("infoid"));
				info.setField(rs.getString("pk"));
				info.setName(rs.getString("info.name"));
				info.setStatus(rs.getInt("status"));
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			//e.printStackTrace();
			System.out.println(e.getMessage()+" AdminDao:getSelectMsgList2");
		}
		finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		
		return list;
	}
	
}
