package com.rg.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Edituserprofile
 */
@WebServlet("/Edituserprofile")
public class Edituserprofile extends HttpServlet {
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
		
		String uname = request.getParameter("uname");
		String mail = request.getParameter("mail");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String pnumber = request.getParameter("pnumber");
		String upwd = request.getParameter("password");
		String usern = request.getParameter("usern");
		
		System.out.println(usern);
		
		String query = "UPDATE REGISTER SET uname=? ,email = ?, address = ? , city = ?, phonenumber = ?, password=? WHERE uname=?";
		
		try {
			ptst = con.prepareStatement(query);
			ptst.setString(1, uname);
			ptst.setString(2, mail);
			ptst.setString(3, address);
			ptst.setString(4, city);
			ptst.setString(5, pnumber);
			ptst.setString(6, upwd);
			ptst.setString(7, usern);
			int row = ptst.executeUpdate();
			if(row > 0) {
				try {
					Thread.sleep(3000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				response.sendRedirect("Relogin.jsp");
			}else {
				try {
					Thread.sleep(3000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				response.sendRedirect("Editprofile.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
