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
 * Servlet implementation class Deleteimg
 */
@WebServlet("/Deleteimg")
public class Deleteimg extends HttpServlet {
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
		
		
		String iname = request.getParameter("iname");
		String path = request.getParameter("path");
		
		System.out.println(iname);
		System.out.println(path);
		String query = "DELETE FROM IMG WHERE imagefilename = ? AND iname = ?";
		
		try {
			ptst = con.prepareStatement(query);
			ptst.setString(1, path);
			ptst.setString(2, iname);
			int row = ptst.executeUpdate();
			if(row > 0) {
				response.sendRedirect("Admin.jsp");
			}else {
				out.println("Something wrong");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
