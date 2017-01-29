<%@ page language="java" import="java.util.*, java.text.*" errorPage="" %>
<html>
<head>
<title>AysethMessenger.com/Login Error!</title>
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
	  <p>&nbsp;</p> <p>&nbsp;</p>
	<div align="center"><font size="+2">Login Failure</font></div>
	<br /><br />
	<div align="left">
	<%
	DateFormat df=new SimpleDateFormat("EEEE, dd MMMM, yyyy");
	String date=df.format(new Date());
	out.println(date+"&nbsp;&nbsp;<br>");
	String login = (String)session.getAttribute("login");
	%></div>
	<p>&nbsp;</p><p>&nbsp;</p>
	<div align="center">
	  <p>Either Your Login Id or the Password is wrong.<br />
	    Try with a valid Login Id and Password.</p>
	  <p>Please,	check the type of your login i.e. Admin or User. </p>
	</div>
	</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
 </table></body></html>