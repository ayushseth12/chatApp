<%@ page language="java" import="java.util.*, java.text.*" errorPage="" %>
<html>
<head>
<title>LetUsTalk.com/ Error</title>
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
	<div align="center"><font size="+2">Server Error!</font></div>
	<br /><br/>
	<div align="left">
	<%
	DateFormat df=new SimpleDateFormat("EEEE, dd MMMM, yyyy");
	String date=df.format(new Date());
	out.println(date+"<br>");
	%></div>
	<p>&nbsp;</p><p>&nbsp;</p>
	<div align="center">
	  <p>Some Server error has caused you to see this page.	  </p>
	  <p>Try your previous operation again after Re-Login.</p>
	  <p><a href="logout.jsp">Logoff</a></p>
	</div>
	</td></tr>
  <tr><td>&nbsp;</td></tr>
</table>
</body>
</html>