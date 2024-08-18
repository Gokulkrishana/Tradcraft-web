package com.rg.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.valves.rewrite.InternalRewriteMap.UpperCase;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	Connection con = null;
	PreparedStatement ptst = null;
	ResultSet res = null;
	String url = null;
	String username = null;
	String password = null;
	
	@Override
		public void init(ServletConfig config) throws ServletException {
			ServletContext sc = config.getServletContext();
			url = sc.getInitParameter("url");
			username = sc.getInitParameter("uname");
			password = sc.getInitParameter("password");
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(url, username, password);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String uname = request.getParameter("name");
		String upwd = request.getParameter("password");
		
		String query = "SELECT uname,password FROM REGISTER WHERE UNAME = ? AND PASSWORD = ?";
		
		try {
			ptst = con.prepareStatement(query);
			ptst.setString(1, uname);
			ptst.setString(2, upwd);
			res = ptst.executeQuery();
			if(res.next()) {
				if(res.getString(1).equals("ADMIN")) {
					HttpSession hs = request.getSession();
					hs.setAttribute("uname", res.getString(1));
					
					response.sendRedirect("Admin.jsp");
				}else {
					HttpSession hs = request.getSession();
					hs.setAttribute("uname", res.getString(1));
					hs.setAttribute("password", res.getString(2));
					response.sendRedirect("User.jsp");
				}
			}else {
				response.sendRedirect("Relogin.jsp");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
