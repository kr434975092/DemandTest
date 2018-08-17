package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DBUtil;

public class RegDao {
	public static int register(String name,String id,String kind,String pass) {
		int flag = 1;
		int count = 0;
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql = "insert into info(name,infoid,pk,password,status) values(?,?,?,?,?)";
		String sql1 = "select count(*) from info where infoid = ?";
		
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql1);
			pre.setString(1,id);
			rs = pre.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
			if(count>=1)flag = 0;
			else{
				pre = con.prepareStatement(sql);
				pre.setString(1,name);
				pre.setString(2,id);
				pre.setString(3,kind);
				pre.setString(4,pass);
				pre.setInt(5,0);
				pre.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		if(flag==0)return 0;
		else return flag;
	}
}
