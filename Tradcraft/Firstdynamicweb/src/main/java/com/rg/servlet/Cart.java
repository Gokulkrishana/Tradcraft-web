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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
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
		String upwd = request.getParameter("password");
		String file = request.getParameter("path");
		String iname = request.getParameter("iname");
		
		String query = "INSERT INTO CART(username,password,imagefilename, iname) VALUES(?,?,?,?)";
		try {
			ptst = con.prepareStatement(query);
			ptst.setString(1, uname);
			ptst.setString(2, upwd);
			ptst.setString(3, file);
			ptst.setString(4, iname);
			int row = ptst.executeUpdate();
			if(row>0) {
				HttpSession hs = request.getSession();
				hs.setAttribute("uname", uname);
				hs.setAttribute("upwd", upwd);
				response.sendRedirect("Cart.jsp");
			}else {
				System.out.println("something wrong");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
