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
     String title=request.getParameter("title");
     String content=request.getParameter("content");
     
     String sql="update board set title=?, content=? where id=?";
     
     PreparedStatement pstmt=conn.prepareStatement(sql);
     pstmt.setString(1, title);
     pstmt.setString(2, content);
     pstmt.setString(3, id);
     
     pstmt.executeUpdate();
     
     response.sendRedirect("content.jsp?id="+id);
     
     pstmt.close();
     conn.close();
     
     
     
     
%>     