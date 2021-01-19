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
     String name=request.getParameter("name");
     
     String sql="select * from board order by id desc";
     
     Statement stmt=conn.createStatement();
     ResultSet rs=stmt.executeQuery(sql);
%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#list_fir {
		margin-top:100px;
		margin-bottom:100px;
	}

</style>
</head>
<body>
	<div id="list_fir" align="center">
	<table width="500" align="center">
	  <tr id="table_a">
 		<td> 글번호 </td>
	    <td> 작성자 </td>	
	    <td> 제목 </td>	
	    <td> 조회수 </td>	    
        <td> 작성일 </td>
	  </tr>
	  <%
	  while(rs.next())
	  {
	  %>
	  <tr>
	    <td><%=rs.getString("id") %></td>
	    <td><%=rs.getString("name") %></td>
	    <td><a href="readnum.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("title") %></a></td>
	    <td><%=rs.getString("readnum") %></td>
	    <td><%=rs.getString("writeday") %></td>	    
	  </tr>  
	  <%
	  }
	  %>
	</table> <br><br>
	<a href="write.jsp"> 글쓰기 </a>
	</div>
</body>
</html>














