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

public class MsDao {
	public static void msInfo(Info infoMsg) {
		Connection con = null;
		PreparedStatement pre = null;
		String sql = "update info set "
		+"year = ?,"   //1 int
		+ "month = ?,"  //2 int
		+ "ig = ?,"     //3
		+ "level = ?,"  //4
		+ "pcc = ?,"    //5
		+ "cls = ?,"    //6
		+ "kind = ?,"   //7
		+ "jj = ?,"     //8
		+ "cid = ?,"    //9 int
		+ "did = ?,"    //10 int
		+ "web = ?,"    //11
		+ "url = ?,"    //12
		+ "p = ?,"      //13
		+ "e = ?,"      //14
		+ "status = ?" //15 int
		+" where infoid = ?";  //16
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql);
			pre.setInt(1,infoMsg.getYear());
			pre.setInt(2,infoMsg.getMonth());
			pre.setString(3,infoMsg.getIg());
			pre.setString(4, infoMsg.getLevel());
			pre.setString(5, infoMsg.getPlace());
			pre.setString(6, infoMsg.getCls());
			pre.setString(7, infoMsg.getKind());
			pre.setString(8, infoMsg.getJj());
			pre.setInt(9, infoMsg.getCid());
			System.out.println(infoMsg.getCid());
			pre.setInt(10,infoMsg.getDid());
			pre.setString(11, infoMsg.getWeb());
			pre.setString(12, infoMsg.getUrl());
			pre.setString(13, infoMsg.getP());
			pre.setString(14, infoMsg.getE());
			pre.setInt(15, infoMsg.getStatus());
			pre.setString(16, infoMsg.getInfoid());
			pre.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return;
	}
	
	public static int company(Company company) {
		int flag = 0;
		int id = -1;
		String sql1 = "select id from company where infoid = ?";
		String sql2 = "update company set name = ?,"
				+"clr = ?,"
				+"code = ?,"
				+"phone = ?,"
				+"kind = ?"
				+" where infoid = ?";
		String sql3 = "insert into company"
				+"(name,clr,code,phone,kind,infoid) values"
				+"(?,?,?,?,?,?)";
		String sql4 = "select max(id) from company";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql1);
			pre.setString(1,company.getInfoid());
			rs = pre.executeQuery();
			while(rs.next()) {
				flag = 1;
				id = rs.getInt("id");
			}
			if(flag==1) {
				pre = con.prepareStatement(sql2);
				pre.setString(1,company.getName());
				pre.setString(2, company.getClr());
				pre.setString(3, company.getCode());
				pre.setString(4, company.getPhone());
				pre.setString(5, company.getKind());
				pre.setString(6, company.getInfoid());
				pre.executeUpdate();
			}else {
				pre = con.prepareStatement(sql3);
				pre.setString(1,company.getName());
				pre.setString(2, company.getClr());
				pre.setString(3, company.getCode());
				pre.setString(4, company.getPhone());
				pre.setString(5, company.getKind());
				pre.setString(6, company.getInfoid());
				pre.executeUpdate();
				pre = con.prepareStatement(sql4);
				rs = pre.executeQuery();
				while(rs.next()) {
					id = rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return id;
	}
	
	public static int dsave(Director director) {
		int flag = 0;
		int id = -1;
		String sql1 = "select id from director where infoid = ?";
		String sql2 = "update director set name = ?,"
				+"degree = ?,"
				+"sex = ?,"
				+"year = ?,"
				+"month = ?,"
				+"title = ?,"
				+"record = ?,"
				+"majoy = ?,"
				+"email = ?,"
				+"phone = ?,"
				+"telephone = ?"
				+" where infoid = ?";
		String sql3 = "insert into director"
				+"(name,degree,sex,year,month,title,"
				+"record,majoy,email,phone,telephone,infoid) values"
				+"(?,?,?,?,?,?,?,?,?,?,?,?)";
		String sql4 = "select max(id) from director";
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql1);
			pre.setString(1,director.getInfoid());
			rs = pre.executeQuery();
			while(rs.next()) {
				flag = 1;
				id = rs.getInt("id");
			}
			if(flag==1) {
				pre = con.prepareStatement(sql2);
				pre.setString(1,director.getName());
				pre.setString(2, director.getDegree());
				pre.setString(3, director.getSex());
				pre.setInt(4, director.getYear());
				pre.setInt(5, director.getMonth());
				pre.setString(6, director.getTitle());
				pre.setString(7, director.getRecord());
				pre.setString(8, director.getMajoy());
				pre.setString(9, director.getEmail());
				pre.setString(10, director.getPhone());
				pre.setString(11, director.getTelephone());
				pre.setString(12,director.getInfoid());
				pre.executeUpdate();
			}else {
				pre = con.prepareStatement(sql3);
				pre.setString(1,director.getName());
				pre.setString(2, director.getDegree());
				pre.setString(3, director.getSex());
				pre.setInt(4, director.getYear());
				pre.setInt(5, director.getMonth());
				pre.setString(6, director.getTitle());
				pre.setString(7, director.getRecord());
				pre.setString(8, director.getMajoy());
				pre.setString(9, director.getEmail());
				pre.setString(10, director.getPhone());
				pre.setString(11, director.getTelephone());
				pre.setString(12,director.getInfoid());
				pre.executeUpdate();
				pre = con.prepareStatement(sql4);
				rs = pre.executeQuery();
				while(rs.next()) {
					id = rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return id;
	}
	public static void sisave(String infoid,String[]su) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql1 = "select count(*) from si where pid = ?";
		String sql2 = "delete from si where pid = ?";
		String sql3 = "insert into si(pid,name) values(?,?)";
		int flag = 0;
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql1);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			while(rs.next()) {
				flag = 1;
			}
			if(flag==1) {
				pre = con.prepareStatement(sql2);
				pre.setString(1,infoid);
				pre.executeUpdate();
			}
			
			for(int i = 0;i<3;i++) {
				pre = con.prepareStatement(sql3);
				pre.setString(1,infoid);
				pre.setString(2, su[i]);
				pre.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return ;
	}
	
	
	public static void fesave(String infoid,String[]su) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql1 = "select count(*) from ei where pid = ?";
		String sql2 = "delete from ei where pid = ?";
		String sql3 = "insert into ei(pid,name) values(?,?)";
		int flag = 0;
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql1);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			while(rs.next()) {
				flag = 1;
			}
			if(flag==1) {
				pre = con.prepareStatement(sql2);
				pre.setString(1,infoid);
				pre.executeUpdate();
			}
			
			for(int i = 0;i<3;i++) {
				pre = con.prepareStatement(sql3);
				pre.setString(1,infoid);
				pre.setString(2, su[i]);
				pre.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return ;
	}
	
	public static void cisave(String infoid,String[]su) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		String sql1 = "select count(*) from ci where pid = ?";
		String sql2 = "delete from ci where pid = ?";
		String sql3 = "insert into ci(pid,name) values(?,?)";
		int flag = 0;
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql1);
			pre.setString(1,infoid);
			rs = pre.executeQuery();
			while(rs.next()) {
				flag = 1;
			}
			if(flag==1) {
				pre = con.prepareStatement(sql2);
				pre.setString(1,infoid);
				pre.executeUpdate();
			}
			
			for(int i = 0;i<su.length;i++) {
				pre = con.prepareStatement(sql3);
				pre.setString(1,infoid);
				pre.setString(2, su[i]);
				System.out.println(su[i]);
				pre.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return ;
	}
	public static void updateKeys(String infoid,String newpass) {
		String sql1 = "update info set password = ? where infoid = ?";
		Connection con = null;
		PreparedStatement pre = null;		
		try {
			con = DBUtil.getConection();
			pre = con.prepareStatement(sql1);
			pre.setString(1,newpass);
			pre.setString(2, infoid);
			pre.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}finally {
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return;
	}
	public static List<Info> hehe(){
		List<Info>list = new ArrayList<Info>();
		Connection con = DBUtil.getConection();
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			pre = con.prepareStatement("select infoid,name from info where concat(name,kind,pk,pcc) like '%河北%'");
			rs = pre.executeQuery();
			while(rs.next()) {
				System.out.println("平台编号"+rs.getString("infoid")+" 平台名称"+rs.getString("name"));
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
			DBUtil.close(pre);
			DBUtil.close(con);
		}
		return list;
	}
	public static void main(String[]args) {
		List list = hehe();
		System.out.println(list.size());
	}
}
