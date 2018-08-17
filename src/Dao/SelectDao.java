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

public class SelectDao {
	
	public static List<Info> resAjax(String[]key,String[]value,String[]orand,String[]lidu,String[]month,String[]year){
		List<Info>list = new ArrayList<Info>();
		String[]value1 = new String[value.length];
		int[]m = null;
		int[]y = null;
		int len = lidu.length;
		for(int i = 0;i<len;i++) {
			if(lidu[i].equals("1")&&value[i]!=null&&!value[i].equals("")) {
				value1[i] = ""+value[i].charAt(0);
				for(int j = 1;j<value[i].length();++j) {
					value1[i]+="%"+value[i].charAt(j);
				}
			}else if(lidu[i].equals("1")&&(value[i]==null||value[i].equals("")))value1[i] = "";
			else if(lidu[i].equals("2")&&value[i]!=null&&!value[i].equals(""))value1[i] = value[i];
			else if(lidu[i].equals("2")&&(value[i]==null||value[i].equals("")))value1[i] = "";
		}
		if(month!=null) {
			m = new int[2];
			y = new int[2];
			m[0] = Integer.parseInt(month[0]);
			m[1] = Integer.parseInt(month[1]);
			y[0] = Integer.parseInt(year[0]);
			y[1] = Integer.parseInt(year[1]);
		    int max = (m[0]>=m[1]?m[0]:m[1]);
		    int min = (m[0]<m[1]?m[0]:m[1]);
		    m[0] = min;
		    m[1] = max;
		    max = (y[0]>=y[1]?y[0]:y[1]);
		    min = (y[0]<y[1]?y[0]:y[1]);
		    y[0] = min;
		    y[1] = max;
		}
		len = key.length;
		StringBuffer sb = new StringBuffer("select name,infoid,pk,status from info where ");
		if(month!=null)sb.append("(");
		for(int i = 0;i<len;i++) {
			if(i>0&&orand[i-1].equals("and")) {
			    if(key[i].equals("random"))sb.append("and concat(name,kind,pk,pcc) like '%"+value1[i]+"%' ");
		    	else sb.append("and "+key[i]+" like '%"+value1[i]+"%' ");
			}else if(i>0&&orand[i-1].equals("or")) {
				if(key[i].equals("random"))sb.append("or concat(name,kind,pk,pcc) like '%"+value1[i]+"%' ");
		    	else sb.append("or "+key[i]+" like '%"+value1[i]+"%' ");
			}else if(i>0&&orand[i-1].equals("not")) {
				if(key[i].equals("random"))sb.append("and concat(name,kind,pk,pcc) not like '%"+value1[i]+"%' ");
		    	else sb.append("and "+key[i]+" not like '%"+value1[i]+"%' ");
			}else if(i==0){
				if(key[i].equals("random"))sb.append("concat(name,kind,pk,pcc) like '%"+value1[i]+"%' ");
		    	else sb.append(key[i]+" like '%"+value1[i]+"%' ");
			}
		}
		if(month!=null)sb.append(") and (year>="+y[0]+" and year<="+y[1]+" and month>="+m[0]+" and month<="+m[1]+")");
		Connection con = DBUtil.getConection();
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			pre = con.prepareStatement(sb.toString());
			rs = pre.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setInfoid(rs.getString("infoid"));
				info.setName(rs.getString("name"));
				info.setField(rs.getString("pk"));
				info.setStatus(rs.getInt("status"));
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}
	public static List<Info>resAjax2(String title,String params1,String params2,String params3,int op,String[]key,String[]value,String[]orand,String[]lidu,String[]month,String[]year){
		List<Info>list = new ArrayList<Info>();
		String[]value1 = new String[value.length];
		int[]m = null;
		int[]y = null;
		int len = lidu.length;
		for(int i = 0;i<len;i++) {
			if(lidu[i].equals("1")&&value[i]!=null&&!value[i].equals("")) {
				value1[i] = ""+value[i].charAt(0);
				for(int j = 1;j<value[i].length();++j) {
					value1[i]+="%"+value[i].charAt(j);
				}
			}else if(lidu[i].equals("1")&&(value[i]==null||value[i].equals("")))value1[i] = "";
			else if(lidu[i].equals("2")&&value[i]!=null&&!value[i].equals(""))value1[i] = value[i];
			else if(lidu[i].equals("2")&&(value[i]==null||value[i].equals("")))value1[i] = "";
		}
		if(month!=null) {
			m = new int[2];
			y = new int[2];
			m[0] = Integer.parseInt(month[0]);
			m[1] = Integer.parseInt(month[1]);
			y[0] = Integer.parseInt(year[0]);
			y[1] = Integer.parseInt(year[1]);
		    int max = (m[0]>=m[1]?m[0]:m[1]);
		    int min = (m[0]<m[1]?m[0]:m[1]);
		    m[0] = min;
		    m[1] = max;
		    max = (y[0]>=y[1]?y[0]:y[1]);
		    min = (y[0]<y[1]?y[0]:y[1]);
		    y[0] = min;
		    y[1] = max;
		}
		len = key.length;
		StringBuffer sb = new StringBuffer("select distinct info.infoid,name,pk,status from info");
		sb.append(" join "+title+" on "+title+".pid = info.infoid where ");
		if(month!=null)sb.append("(");
		if(op==1)sb.append("(suf = '"+params1+"') and (");
		if(op==2)sb.append("(suf = '"+params1+"' and sus = '"+params2+"') and (");
		if(op==3)sb.append("(suf = '"+params1+"' and sus = '"+params2+"' and sut = '"+params3+"') and (");
		for(int i = 0;i<len;i++) {
			if(i>0&&orand[i-1].equals("and")) {
			    if(key[i].equals("random"))sb.append("and concat(name,kind,pk,pcc) like '%"+value1[i]+"%' ");
		    	else sb.append("and "+key[i]+" like '%"+value1[i]+"%' ");
			}else if(i>0&&orand[i-1].equals("or")) {
				if(key[i].equals("random"))sb.append("or concat(name,kind,pk,pcc) like '%"+value1[i]+"%' ");
		    	else sb.append("or "+key[i]+" like '%"+value1[i]+"%' ");
			}else if(i>0&&orand[i-1].equals("not")) {
				if(key[i].equals("random"))sb.append("and concat(name,kind,pk,pcc) not like '%"+value1[i]+"%' ");
		    	else sb.append("and "+key[i]+" not like '%"+value1[i]+"%' ");
			}else if(i==0){
				if(key[i].equals("random"))sb.append("concat(name,kind,pk,pcc) like '%"+value1[i]+"%' ");
		    	else sb.append(key[i]+" like '%"+value1[i]+"%' ");
			}
		}
		sb.append(")");
		if(month!=null)sb.append(") and (year>="+y[0]+" and year<="+y[1]+" and month>="+m[0]+" and month<="+m[1]+")");
		//System.out.println(sb.toString());
		Connection con = DBUtil.getConection();
		PreparedStatement pre = null;
		ResultSet rs = null;
		try {
			pre = con.prepareStatement(sb.toString());
			rs = pre.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setInfoid(rs.getString("info.infoid"));
				info.setName(rs.getString("name"));
				info.setField(rs.getString("pk"));
				info.setStatus(rs.getInt("status"));
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

}
