package Bean;

import java.util.List;

import Dao.MenuDao;

public class Company {  //��˾��λ
	private int id;   //���ݱ��и����е�λ�ı��
	private String name;
	private String code;  //������ô���
	private String clr;  //���˴�������
	private String phone;  //�칫�绰
	private String kind;   //��λ����
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
		if(info.getCid()==0)System.out.println("��˾���Ϊ0");
		if(info.getWeb()==null)System.out.println("��վΪ��");
		
		return;
		
	}
}
