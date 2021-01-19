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
	String sql="select * from board";
	Statement stmt=conn.createStatement();
	
	ResultSet rs=stmt.executeQuery(sql);

	rs.next();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="cont_fir" align="center">
  <form method="post" action="update_ok.jsp">
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
	    <td> 조회수 </td>	 
	    <td><%=rs.getString("readnum") %></td>  
	  </tr>	
 	  <tr>   
        <td> 작성일 </td>
        <td><%=rs.getString("writeday") %></td>	
      </tr>	
      <tr>
	    <td> 제목 </td>	
	    <td><input type="text" name="title" value="<%=rs.getString("title") %>"></td>
	  </tr>
 	  <tr>  
        <td> 내용 </td>	
	    <td><textarea cols="50" rows="10" name="content" value="<%=rs.getString("content") %>"></textarea></td>
	  </tr>
	</table> <br><br>
  </form>
	</div>
</body>
</html>