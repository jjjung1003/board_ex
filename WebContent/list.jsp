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
     
     String sql="";
     
     Statement stmt=conn.createStatement();
     ResultSet rs=stmt.executeQuery(sql);
%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#center {
    width:1000px;
    height:500px;
    margin:auto;
    margin-top:50px;
	}
	
	a {
		text-decoration:none;
	}
	.list_first {
		height:50px;	
	}
	.list_second {
		height:35px;
	}
	
	#center #table_a td {
	    border-top:3px solid #cccccc;
	    border-bottom:3px solid #cccccc;
	    height:40px;
  	}
	#center #table_b td {
	    border-bottom:1px dotted grey;
	    height:33px;
 	}
 	
</style>
</head>
<body>
	<div id="list" align="center">
	<table width="1000" align="center">
	  <tr id="table_a" align="center">
 		<td width="70" class="list_first"> 글번호 </td>
	    <td width="130" class="list_first"> 작성자 </td>	
	    <td width="580" class="list_first"> 제목 </td>	
	    <td width="70" class="list_first"> 조회수 </td>	    
        <td width="150" class="list_first"> 작성일 </td>
	  </tr>
	  <%
	  while(rs.next())
	  {
	  %>
	  <tr>
	    <td><%=rs.getString("id") %></td>
	    <td><%=rs.getString("name") %></td>
	    <td><%=rs.getString("title") %></td>
	    <td><%=rs.getString("readnum") %></td>
	    <td><%=rs.getString("writeday") %></td>	    
	  </tr>  
	  <%
	  }
	  %>
	</table> <br><br>
	</div>
</body>
</html>














