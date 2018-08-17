package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.Company;
import Bean.Director;
import Bean.Info;
import Dao.MsDao;

/**
 * Servlet implementation class MsServlet
 */

public class MsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int status = -1;
		if(request.getParameter("sb").equals("��ʱ����"))status = 0;
		else status = 1;
		String infoid = (String)(request.getSession().getAttribute("currentid"));
		String fyear = request.getParameter("year");
		String fmonth = request.getParameter("month");
		int year = 0;
		int month = 0;
		if(!("".equals(fyear))&&!(fyear==null))year = Integer.parseInt(fyear);
		if(!("".equals(fmonth))&&!(fmonth==null))month = Integer.parseInt(fmonth);
		//System.out.println(year+" "+month);
		String wh = request.getParameter("wh");
		String level = request.getParameter("level");
		String pcc = request.getParameter("province")+" "+request.getParameter("city")+" "+request.getParameter("country");
		String jj = request.getParameter("jj");
		String cls = request.getParameter("cls").equals("�޷����ʸ�")?"�޷����ʸ�":request.getParameter("cls1");
		//System.out.println(wh+" "+level+" "+" "+pcc+" "+jj+" "+cls);
		String kind = request.getParameter("kind");
		int did = -1;
		int cid = 0;
		if(kind.equals("�൥λ���Ϲ���")) {
			// //List<String>list = new ArrayList<String>();
			String[]lists = request.getParameterValues("gc");
			//for(int i = 0;i<lists.length;++i)
				//System.out.println(lists[i]);
			MsDao.cisave(infoid,lists);
		}else {
			String cname = request.getParameter("cname");
			String clr = request.getParameter("clr");
			String code = request.getParameter("code");
			String ctel = request.getParameter("ctel");
			String ckind = request.getParameter("ckind");
			//System.out.println(cname+" "+clr+" "+code+" "+ctel+" "+ckind);
			Company company = new Company();
			company.setName(cname);
			company.setClr(clr);
			company.setCode(code);
			company.setPhone(ctel);
			company.setKind(ckind);
			company.setInfoid(infoid);
			cid = MsDao.company(company);
		}
		String[]su = new String[3];
		su[0] = request.getParameter("һ��ѧ��1")+" "+request.getParameter("����ѧ��1")+" "+request.getParameter("����ѧ��1");
		su[1] = request.getParameter("һ��ѧ��2")+" "+request.getParameter("����ѧ��2")+" "+request.getParameter("����ѧ��2");
		su[2] = request.getParameter("һ��ѧ��3")+" "+request.getParameter("����ѧ��3")+" "+request.getParameter("����ѧ��3");
		//System.out.println(su[0]+" "+su[1]+" "+su[2]);
		MsDao.sisave(infoid,su);
		String[]fe = new String[3];
		fe[0] = request.getParameter("��ҵ11")+" "+request.getParameter("��ҵ21")+" "+request.getParameter("��ҵ31");
		fe[1] = request.getParameter("��ҵ12")+" "+request.getParameter("��ҵ22")+" "+request.getParameter("��ҵ32");
		fe[2] = request.getParameter("��ҵ13")+" "+request.getParameter("��ҵ23")+" "+request.getParameter("��ҵ33");
		//System.out.println(fe[0]+" "+fe[1]+" "+fe[2]);
		MsDao.fesave(infoid,fe);
		String dname = request.getParameter("dname");
		String dsex = request.getParameter("dsex");
		int dyear = Integer.parseInt(request.getParameter("dyear"));
		int dmonth = Integer.parseInt(request.getParameter("dmonth"));
		String dtitle = request.getParameter("dtitle");
		String drecord = request.getParameter("drecord");
		String degree = request.getParameter("degree");
		String majoy = request.getParameter("majoy");
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");
		String phone = request.getParameter("phone");
		Director director = new Director();
		director.setName(dname);
		director.setInfoid(infoid);
		director.setDegree(degree);
		director.setSex(dsex);
		director.setYear(dyear);
		director.setMonth(dmonth);
		director.setTitle(dtitle);
		director.setRecord(drecord);
		director.setMajoy(majoy);
		director.setEmail(email);
		director.setPhone(phone);
		director.setTelephone(telephone);
		did = MsDao.dsave(director);
		//System.out.println(dname+" "+dsex+" "+dyear+" "+dmonth+" "+dtitle+" "+drecord+" "+degree+" "+majoy+" "+email+" "+telephone+" "+phone);
		String web = request.getParameter("web");
		String url = request.getParameter("url");
		String p = request.getParameter("p");
		String e = request.getParameter("e");
		//System.out.println(web+" "+url+" "+p+" "+e);
		Info infoMsg = new Info();
		infoMsg.setInfoid(infoid);
		infoMsg.setYear(year);
		infoMsg.setMonth(month);
		infoMsg.setIg(wh);
		infoMsg.setLevel(level);
		infoMsg.setPlace(pcc);
		infoMsg.setCls(cls);
		infoMsg.setKind(kind);
		infoMsg.setJj(jj);
		infoMsg.setCid(cid);
		infoMsg.setDid(did);
		infoMsg.setWeb(web);
		infoMsg.setUrl(url);
		infoMsg.setP(p);
		infoMsg.setE(e);
		infoMsg.setStatus(status);
		MsDao.msInfo(infoMsg);
		//request.setAttribute("platname", arg1);
		String s = null;
		if(status==1) {
			s = "����ɻ�����Ϣ�";
			HttpSession session = request.getSession();
			session.removeAttribute("currentstatue");
			session.setAttribute("currentstatue","������");
		}
		else s = "�ѱ�����д����Ϣ";
		//request.setAttribute("showPage","text.jsp");
		request.setAttribute("msg",s);
		request.getRequestDispatcher("text.jsp").forward(request, response);
	}

}
