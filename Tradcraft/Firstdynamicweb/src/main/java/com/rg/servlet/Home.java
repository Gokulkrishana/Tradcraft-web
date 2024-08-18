package com.rg.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

@MultipartConfig
/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
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
		
		String category = request.getParameter("category");
		String iname = request.getParameter("iname");
		Part file = request.getPart("ifile");
		String imageFileName = file.getSubmittedFileName();
		String path = "C:/Users/GOKUL S/eclipse-workspace/Exception_handle/Firstdynamicweb/src/main/webapp/images/"+imageFileName;
		
		try {
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = file.getInputStream();
			
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String query = "INSERT INTO IMG(IMAGEFILENAME,INAME,CATEGORY) VALUES(?,?,?)";
		try {
			ptst = con.prepareStatement(query);
			ptst.setString(1, imageFileName);
			ptst.setString(2, iname);
			ptst.setString(3, category);
			if(ptst.executeUpdate()>0) {
				HttpSession hs = request.getSession();
				hs.setAttribute("category", category);
				response.sendRedirect("Home.jsp");
			}else {
				System.out.println("failed to add");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("connection lost");
		}
		
	}

}
