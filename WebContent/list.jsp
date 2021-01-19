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
     
     int pager;
     	if(request.getParameter("pager")==null)
     		pager=1;
     	else
     		pager=Integer.parseInt(request.getParameter("pager"));
     	
     int index=(pager-1)*10;

     String sql="select * from board order by id desc limit "+index+", 10";
     
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
	
	<%
		String sql2="select count(*) as c from board";
	
		Statement stmt2=conn.createStatement();
		ResultSet rs2=stmt.executeQuery(sql2);
		
		rs2.next();
		
		int total=rs2.getInt("c");

		int page_cnt=total/10;
		
		if(total%10 == 0)
			page_cnt=page_cnt-1;
		
		page_cnt=page_cnt+1;
		
		int pstart=pager/10;
		
		if(pager%10 == 0)
			pstart=pstart-1;
		
		pstart=pstart*10+1;
		
		int pend=pstart+9;
		
		if(pend > page_cnt)
			pend=page_cnt;
				
		if(pstart != 1)
		  {
  	%>
	    	<a href="list.jsp?pager=<%=pstart-1%>">  << </a>
	    <%	
		  }
	    else
	    {
	    %>
	    <<
	    
	    <%
	    }

	    if(pager !=1)
	    {
	    %>	   
	  <a href="list.jsp?pager=<%=pager-1%>">  < </a>
	  <%
	    }
	    else
	    {	
	  %>
	  <
	  
	  <%
	    }
		
	    String chk="";
	    
	    for(int i=pstart; i<=pend; i++)
	    {
	    	if(pager == i)
	    		chk="style='color:red'";
	    	else
	    		chk="style='color:black'";	    	
	    	%>
	    	   	
	    <a href="list.jsp?pager=<%=i%>"<%=chk %>> <%=i %> </a>	
<%		
	  		}

	  		if(pager != page_cnt)
	  		{
	  	%>
	  	  
	  	  <a href="list.jsp?pager=<%=pager+1%>">  > </a>
	  	  <%
	  		}
	  		else
	  		{
	  	  %>
	  	  >
	  	  
	  	  <%
	  		}
	  	 
	  	  	if(pend != page_cnt)
	  	  	{
	  	  %>
	  	  <a href="list.jsp?pager=<%=pend+1%>">  >> </a> <p><br>
	  	  
	  	  <%
	  	  	}
	  	  	else
	  	  	{
	  	  %>
	  	  >>
	  	  
	  	  <%
	  	  	}
	  	  %>
	<div><a href="write.jsp"> 글쓰기 </a></div>
	</div>
</body>
</html>














