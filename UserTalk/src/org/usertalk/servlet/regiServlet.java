package org.usertalk.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.usertalk.dbConnection.connection;

/**
 * Servlet implementation class regiServlet
 */
@WebServlet("/regiServlet")
public class regiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public regiServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("txtuname");
		String fname=request.getParameter("txtfname");
		String lname=request.getParameter("txtlname");
		String password=request.getParameter("txtpassw");
		String cpassword=request.getParameter("txtcpassw");
		String gender=request.getParameter("radiobutton");
		//String city=request.getParameter("selectCity");
		//String org=request.getParameter("selectOrg");
		String str_date=request.getParameter("Day")+"/"+request.getParameter("Month")+"/"+request.getParameter("Year");
		System.out.println("str_Date: "+str_date);
		SimpleDateFormat formater = new SimpleDateFormat("dd/MMM/yyyy");
		  String newdate=null;
		try {
			Date result =formater.parse(str_date);
			formater.applyPattern("yyyy/MM/dd");
			newdate=formater.format(result);
			System.out.println("date is"+newdate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  System.out.println("date is"+newdate);
		//String authString="abc";
		String  sqlQuery="insert into user(email,password,fname,lname,gender,birthdate) values('"+uname+"','"+password+"','"+fname+"','"+lname+"','"+gender+"','"+newdate+"');";
		  //String  sqlQuery="update user set password='111',firstname='rr1',lastname='bh1',gender='Female',birthdate='1990-03-03',cid=1,authstring='aaaaa' where username='rr' and status='N';"
		  //String  sqlQuery="update user set password='"+password+"',firstname='"+fname+"',lastname='"+lname+"',gender='"+gender+"',birthdate='"+newdate+"',cid="+city+",authstring='"+authString+"' where username='"+uname+"' and status='N';";
		connection cnn=new connection();
		System.out.println("sqlQuery: "+ sqlQuery);
		cnn.executeUpdateInsert(sqlQuery);
		
		  
		  
		
		request.setAttribute("uname", uname);
		response.sendRedirect("login.jsp");
		
		
	}

}
