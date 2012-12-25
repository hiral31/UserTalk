package org.usertalk.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

//import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.usertalk.dbConnection.*;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
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
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String uname=request.getParameter("txtuname");
		String password=request.getParameter("txtpassw");
		
		HttpSession session = request.getSession();
		
		String  sqlQuery="select * from user where email='"+uname+"' and password='"+password+"';";
		connection cnn=new connection();
		System.out.println("sqlQuery: "+ sqlQuery);
		rs=cnn.executeQueryStmt(sqlQuery);
		
		try {
			if(rs.next())
			{System.out.println("InresultSet: ");
				request.setAttribute("uname", uname);
				request.setAttribute("flag", "True");
		        session.setAttribute("usersession", uname);
				  
		        response.sendRedirect("home.jsp");
			}
			else
			{
				request.setAttribute("flag", "False");
				response.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		  
		  
		
			}

}
