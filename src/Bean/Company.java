package Bean;

import java.util.List;

import Dao.MenuDao;

public class Company {  //公司单位
	private int id;   //数据表中该依托单位的编号
	private String name;
	private String code;  //社会信用代码
	private String clr;  //法人代表姓名
	private String phone;  //办公电话
	private String kind;   //单位类型
	private String infoid;  
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getClr() {
		return clr;
	}
	public void setClr(String clr) {
		this.clr = clr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getInfoid() {
		return infoid;
	}
	public void setInfoid(String infoid) {
		this.infoid = infoid;
	}
	public static void main(String[]args) {
		List list = MenuDao.getInfo("GA20180407");
		Info info = (Info)(list.get(0));
		Company cp = (Company)(list.get(1));
		String[] ci = (String[])(list.get(2));
		String[] si = (String[])(list.get(3));
		String[] ei = (String[])(list.get(4));
		Director director = (Director)(list.get(5));
		if(info.getCid()==0)System.out.println("公司编号为0");
		if(info.getWeb()==null)System.out.println("网站为空");
		
		return;
		
	}
}
