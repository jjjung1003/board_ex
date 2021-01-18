<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<style>
	#center {
	    width:1000px;
	    height:400px;
	    margin:auto;
	    margin-top:50px;
	}
	#write_table {
		border:1px solid red;
	}
	#write_table a {
		text-decoration:none;
		color:black;
	}
	.write_first {

	}	
</style>

<div>
	<div id="write_table" align="center">
    <form method="post" action="write_ok.jsp">
	<table width="1000" align="center">
	  <tr>
	    <td class="write_first"> 이름 </td>
	    <td> <input type="text" size="20" name="name" placeholder="name"> </td>
	  </tr>
	  <tr>
	    <td class="write_first"> 제목 </td>
	    <td> <input type="text" size="70" name="title" placeholder="title"> </td>
	  </tr>
	  <tr>
	    <td class="write_first"> 내용 </td>
	    <td> <textarea cols="100" rows="30" name="content" placeholder="content"> </textarea> </td>
	  </tr>
	</table> <br><br>
		<div align="center"> <input type="submit" name="btn" value="등록하기">  </div>
		</form>
	</div>    
  </div>	
</div>