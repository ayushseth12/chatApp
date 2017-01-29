<%@ page language="java" import="java.sql.*, java.io.*, ayseth.*, java.util.*" errorPage="" %>
<html>
<head>
<title>AysethMessenger.com/Admin Console/Configuring Chat Rooms</title>
<%
String chRoomPath = (String)session.getAttribute("chRoomPath");
String roomListPath = (String)session.getAttribute("roomListPath");
String adminChatPath = (String)session.getAttribute("adminChatPath");
%>
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
	<table align="center"><tr align="center">
	<td height="25" width="120" bgcolor="#728DCF"><a href="adduser.jsp">Add Users</td>
	<td height="25" width="120" bgcolor="#728DCF"><a href="viewuser.jsp">View Users</a></td>
	<td height="25" width="120" bgcolor="#993366">Configure Rooms</td>
	<td height="25" width="120" bgcolor="#728DCF"><a href="logout.jsp">Logout</a></td></tr></table>
	<form method="post" action="<%=response.encodeURL(adminChatPath)%>">
	<%
		HashMap hashmap = (HashMap)getServletContext().getAttribute("roomList");
		if(hashmap != null){
		    Iterator iterator = hashmap.keySet().iterator();
            if(!iterator.hasNext()){
				out.println("No Room Configured.");
            } 
			else{
				out.println("To Remove a Room check it and press Update RoomList");
                ChatRoom  chatroom;
                for(; iterator.hasNext(); out.println("<br><input type=checkbox name=remove value='" + chatroom.getChatRoomName() + "'>" + chatroom.getChatRoomName() )){
				    String s = (String)iterator.next();
                    chatroom = (ChatRoom )hashmap.get(s);
                }
			}
        }
	%>
	<p align="center">Enter Name and Description for new Chat Room.</p>
	<table align="center" bgcolor="#728DCF">
	  <tr>
	    <td>Name</td>
	  	<td><input name=roomname size=25 class="smalltext"></td>
	  </tr>
	  <tr>
	  	<td >Subject</td>
	  	<td><textarea name=roomdescr cols=25 rows=4 class="smalltext"></textarea></td>
		</tr>
	  </table>
	  <p>&nbsp;</p>
	  <div align="center">
	  <input type=submit value="Update RoomList">
	  </div>
	  </form>
	</td>
  </tr>
  <tr><td align="center">&nbsp;</td></tr></table> 
</body></html>
