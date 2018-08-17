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
import Bean.DataM;
import Util.DBUtil;

public class Drill {

	public static List<DataM> getSuCount(String value1,String value2){  //先从基本的入手
		List<DataM>list = new ArrayList<DataM>();
		DataM data = null;
		if(value2!=null&&value1!=null) {
			String sql = "select sut,count(*) from suc where suf = ? and sus = ? group by sut";
			Connection con = null;
			PreparedStatement pre = null;
			ResultSet rs = null;
			con = DBUtil.getConection();
			try {
				pre = con.prepareStatement(sql);
				pre.setString(1,value1);
				pre.setString(2,value2);
				rs = pre.executeQuery();
				while(rs.next()) {
					data = new DataM();
					data.setTitle(rs.getString(1));
					data.setCount(rs.getInt(2));
					list.add(data);
				}
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				System.out.println(e.getMessage());
			}finally {
				DBUtil.close(rs);
				DBUtil.close(pre);
				DBUtil.close(con);
			}
			
		}
		if(value2==null&&value1!=null) {
			String sql = "select sus,count(*) from suc where suf = ? group by sus";
			Connection con = null;
			PreparedStatement pre = null;
			ResultSet rs = null;
			con = DBUtil.getConection();
			try {
				pre = con.prepareStatement(sql);
				pre.setString(1,value1);
				rs = pre.executeQuery();
				while(rs.next()) {
					data = new DataM();
					data.setTitle(rs.getString(1));
					data.setCount(rs.getInt(2));
					list.add(data);
				}
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				System.out.println(e.getMessage());
			}finally {
				DBUtil.close(rs);
				DBUtil.close(pre);
				DBUtil.close(con);
			}
			
		}
		if(value1==null) {
			String sql = "select suf,count(*) from suc group by suf";
			Connection con = null;
			PreparedStatement pre = null;
			ResultSet rs = null;
			con = DBUtil.getConection();
			try {
				pre = con.prepareStatement(sql);
				rs = pre.executeQuery();
				while(rs.next()) {
					data = new DataM();
					data.setTitle(rs.getString(1));
					data.setCount(rs.getInt(2));
					list.add(data);
				}
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				System.out.println(e.getMessage());
			}finally {
				DBUtil.close(rs);
				DBUtil.close(pre);
				DBUtil.close(con);
			}
		}
		return list;
	}
	
	public static List<DataM>getGroup(String key){
		List<DataM>list = new ArrayList<DataM>();
		String sql = "select suf,count(*) from "+key+" group by suf";
		System.out.println(sql);
		Connection con = DBUtil.getConection();
		PreparedStatement pre = null;
		ResultSet rs = null;
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()) {
				DataM data = new DataM();
				data.setTitle(rs.getString(1));
				data.setCount(rs.getInt(2));
				list.add(data);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return list;
	}
	
	public static List<DataM>getGroup1(String key,String[]list2){
		List<DataM>list = new ArrayList<DataM>();
		String sql = "select suf,count(*) from "+key+" ";
		if(list.size()==1) {
			sql+="where suf="+list2[0]+" group by sus";
		}else if(list.size()==2) {
			sql+="where suf="+list2[0]+"and sus="+list2[1]+" group by sut";
		}
		Connection con = DBUtil.getConection();
		PreparedStatement pre = null;
		ResultSet rs = null;
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()) {
				DataM data = new DataM();
				data.setTitle(rs.getString(1));
				data.setCount(rs.getInt(2));
				list.add(data);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return list;
	}
}
