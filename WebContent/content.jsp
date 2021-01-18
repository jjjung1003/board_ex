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
	    <td> 작성자 </td>	
	    <td> 제목 </td>	
	    <td> 조회수 </td>	    
        <td> 작성일 </td>
	  </tr>

	  <tr>
	    <td><%=rs.getString("id") %></td>
	    <td><%=rs.getString("name") %></td>
	    <td><%=rs.getString("title") %></td>
	    <td><%=rs.getString("readnum") %></td>
	    <td><%=rs.getString("writeday") %></td>	    
	  </tr>  

	</table>
	<div><a href="../board/list.jsp"> 목록 </a></div>
	<div><a href="../board/update.jsp?id=<%=rs.getString("id")%>"> 수정 </a></div>
	<div><a href="../board/delete.jsp?id=<%=rs.getString("id")%>"> 삭제 </a></div>
	</div>
</body>
</html>