package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DBUtil;

public class LogDao {
	public static String[] login(String id,String password) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String[]info = null;
		
		int status = -1;
		String sql = "select * from info where infoid = ? and password = ?";
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sql);
			pre.setString(1,id);
			pre.setString(2,password);
			rs = pre.executeQuery();
			while(rs.next()) {
				info = new String[2];
				info[0] = rs.getString("name");
				status = rs.getInt("status");
				if(status==0)info[1] = "未完善";
				else info[1] = "已完善";
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return info;
	}
	
	
}
