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


public class MenuDao {
	public static List getInfo(String infoid) {
		List list = new ArrayList<>();
		String sql1 = "select * from info where infoid = ?";
		String sql2 = "select * from ci where pid = ?";
		String sql3 = "select * from si where pid = ?";
		String sql4 = "select * from ei where pid = ?";
		String sql5 = "select * from director where infoid = ?";
		String sql6 = "select * from company where infoid = ?";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		Info info = new Info();
		Director dr = null;
		Company cp = null;
		String[]ci = new String[5];
		String[]si = new String[3];
		String[]ei = new String[3];
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql1);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			while(rs.next()) {
				info.setInfoid(infoid);
				info.setName(rs.getString("name"));
				info.setCls(rs.getString("cls"));
				info.setE(rs.getString("e"));
				info.setP(rs.getString("p"));
				info.setStatus(rs.getInt("status"));
				info.setYear(rs.getInt("year"));
				info.setMonth(rs.getInt("month"));
				info.setIg(rs.getString("ig"));
				info.setLevel(rs.getString("level"));
				info.setJj(rs.getString("jj"));
				info.setWeb(rs.getString("web"));
				info.setUrl(rs.getString("url"));
				info.setPlace(rs.getString("pcc"));
				info.setKind(rs.getString("kind"));
				info.setField(rs.getString("pk"));
				list.add(info);                    //1
			}
			pre = con.prepareStatement(sql2);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			int num = 0;
			while(rs.next()) {
				ci[num++] = rs.getString("name");
			}
			if(num==0) {
				pre = con.prepareStatement(sql6);
				pre.setString(1,infoid);
				rs = pre.executeQuery();
				while(rs.next()) {
					cp = new Company();
					cp.setInfoid(infoid);
					cp.setClr(rs.getString("clr"));
					cp.setCode(rs.getString("code"));
					cp.setName(rs.getString("name"));
					cp.setKind(rs.getString("kind"));
					cp.setPhone(rs.getString("phone"));
				}
				list.add(cp);                                 //2
				list.add(ci);                                 //3
			}
			else {
				list.add(cp);
				list.add(ci);
			}
			num = 0;
			pre = con.prepareStatement(sql3);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			while(rs.next()) {
				si[num++] = rs.getString("name");
			}
			list.add(si);                                           //4
			num = 0;
			pre = con.prepareStatement(sql4);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			while(rs.next()) {
				ei[num++] = rs.getString("name");
			}
			list.add(ei);                                                //5
			pre = con.prepareStatement(sql5);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			while(rs.next()) {
				dr = new Director();
				dr.setInfoid(infoid);
				dr.setDegree(rs.getString("degree"));
				dr.setEmail(rs.getString("email"));
				dr.setMajoy(rs.getString("majoy"));
				dr.setMonth(rs.getInt("month"));
				dr.setYear(rs.getInt("year"));
				dr.setName(rs.getString("name"));
				dr.setPhone(rs.getString("phone"));
				dr.setRecord(rs.getString("record"));
				dr.setSex(rs.getString("sex"));
				dr.setTelephone(rs.getString("telephone"));
				dr.setTitle(rs.getString("title"));
				
			}
			list.add(dr);                                               //6
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		
		return list;
	}
	public static String[] getSi(String infoid) {
		String[]si = new String[3];
		String sql3 = "select * from ei where pid = ?";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		int num = 0;
		
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql3);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			while(rs.next()) {
				si[num++] = rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		
		return si;
	}
	
	public static List<Info>getInfo(String k1,String k2){
		List<Info>list = new ArrayList<>();
		String sql1 = "select * from info where "+k1+" = ?";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		
		con = DBUtil.getConection();
		try {
			pre = con.prepareStatement(sql1);
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
			System.out.println("MenuDao geInfo(String,String)"+e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return list;
	}
	
	public static void main(String[]args) {
		List list = getInfo("GA20180407");
		if(list.get(1)!=null)System.out.println("这个不是空");
		Company company = list.get(1)==null?null:(Company)(list.get(1));
		return;
	}
}
