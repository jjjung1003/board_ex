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
     String id=request.getParameter("id");
     
     String sql="select * from board where id="+id;
     
     Statement stmt=conn.createStatement();
     ResultSet rs=stmt.executeQuery(sql);
     
     rs.next();
     
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#cont_fir {
		margin-top:100px;
		margin-bottom:100px;
	}

</style>
</head>
<body>
<div id="cont_fir" align="center">
	<table width="500" align="center">
	  <tr id="table_a">
 		<td> 글번호 </td>
 		<td><%=rs.getString("id") %></td>
 	  </tr>	
 	  <tr> 	  	
	    <td> 작성자 </td>	
	    <td><%=rs.getString("name") %></td>
	  </tr>	
 	  <tr>
	    <td> 제목 </td>	
	    <td><%=rs.getString("title") %></td>
	  </tr>	
 	  <tr>   
	    <td> 조회수 </td>	 
	    <td><%=rs.getString("readnum") %></td>  
	  </tr>	
 	  <tr>   
        <td> 작성일 </td>
        <td><%=rs.getString("writeday") %></td>	
      </tr>	
 	  <tr>  
        <td> 내용 </td>	
	    <td><%=rs.getString("content") %></td>
	  </tr>

	  <tr>
	    
	    
	    
	    
	        
	  </tr>  

	</table> <br><br>
	<span><a href="list.jsp"> 목록 </a></span>
	<span><a href="update.jsp?id=<%=rs.getString("id")%>"> 수정 </a></span>
	<span><a href="delete.jsp?id=<%=rs.getString("id")%>"> 삭제 </a></span>
	</div>
</body>
</html>