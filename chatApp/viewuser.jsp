<%@ page language="java" import="java.sql.*, java.io.*, ayseth.*, java.util.*, java.text.*" errorPage="" %>
<html>
<%
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
   	Statement stmt = con.createStatement();
   	String selectquery = "select * from login";
   	ResultSet rs = stmt.executeQuery(selectquery);	
%>
<head>
<title>LetUsTalk.com/Admin Console/All User List</title>
<link href="mystyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="700" height="500" border="0" align="center" cellspacing="0" bgcolor="#476BC0">
  <tr>
	<td width="200" rowspan="2" valign="top">
		<%@ include file="menu.jsp"%> 
	</td>
	<td height="328" bgcolor="#476BC0" valign="top">
	<p>&nbsp;</p>
	  <p>&nbsp;</p> 
	<div align="center">
	<table align="center"><tr>
	<td height="25" width="120" bgcolor="#728DCF"><a href="adduser.jsp">Add Users</td>
	<td height="25" width="120" bgcolor="#993366">View Users</td>
	<td height="25" width="120" bgcolor="#728DCF"><a href="AdminChatServlet">Configure Rooms</a></td>
	<td height="25" width="120" bgcolor="#728DCF"><a href="logout.jsp">Logout</a></td></tr></table>
	<br/><br/>User Information.</div><br />
	<form name="form" method="post" action="deleteuser.jsp">
	<table align="center" width="100%">
	<tr bgcolor="#36559E" align="center">
	<td height="25">Name</td>
	<td>Login id</td>
	<td>Password</td>
	<td>E-Mail</td>
	<td>Type</td>
	</tr>
	<%
	while(rs.next()){
	out.println("<tr>");
	out.println("<td><input type=checkbox value="+rs.getString(1)+" name=loginid>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("</tr>");			
	}
	rs.close();
	con.close();
	%>
	<tr>
	<td colspan="5" align="center"><input type="submit" value="Delete User(s)" class="smalltext" /><br /><br />
	To Delete User(s) select them and click Delete User(s) Button.
	</td>
	</tr>
	</table>	
	</td></tr>
	<tr><td>&nbsp;</td></tr>
</table></body></html>
