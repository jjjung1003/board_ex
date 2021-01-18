<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
     Class.forName("com.mysql.jdbc.Driver");
     String db="jdbc:mysql://localhost:3306/share";
     String user="root";
     String pw="1234";
     Connection conn=DriverManager.getConnection(db,user,pw);
     
     request.setCharacterEncoding("utf-8");
     String name=request.getParameter("name");
     String title=request.getParameter("title");
     String content=request.getParameter("content");
     
     String sql="insert into board(name,title,content,writeday)";
     sql=sql+" value(?,?,?,now())";
     
     PreparedStatement pstmt=conn.prepareStatement(sql);
     pstmt.setString(1,name);
     pstmt.setString(2,title);
     pstmt.setString(3,content);
     
     pstmt.executeUpdate();
     
     response.sendRedirect("list.jsp");
     pstmt.close();
     conn.close();
     
     
     
%>