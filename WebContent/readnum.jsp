<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
     Class.forName("com.mysql.jdbc.Driver");
     String db="jdbc:mysql://localhost:3306/share";
     String user="root";
     String pw="1234";
     Connection conn=DriverManager.getConnection(db,user,pw);
     
  	 String id=request.getParameter("id");
  	 
  	 String sql="update board set readnum=readnum+1 where id="+id;
  	 
  	 Statement stmt=conn.createStatement();
  	 stmt.executeUpdate(sql);
  	 
     response.sendRedirect("content.jsp?id="+id);
     
     stmt.close();
     conn.close();
     
     
%>