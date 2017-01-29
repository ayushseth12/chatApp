<%@ page language="java" import="java.sql.*, java.io.*" errorPage="" %>
<%
	String name=(String)request.getParameter("name");
	String email=(String)request.getParameter("email");
	String loginid=(String)request.getParameter("loginid");
	String password=(String)request.getParameter("password");
	String type=(String)request.getParameter("type");
	try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
	String insertquery = "insert into login values(?,?,?,?,?)" ;
    PreparedStatement pstate = con.prepareStatement(insertquery);
	pstate.setString(1,loginid);
	pstate.setString(2,name);
	pstate.setString(3,password);
	pstate.setString(4,email);
	pstate.setString(5,type);
	
	pstate.executeUpdate();
	pstate.close();
	con.close();
		RequestDispatcher rd=request.getRequestDispatcher("viewuser.jsp");
		rd.forward(request, response);
	}
	catch(Exception e){
		RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
		rd.forward(request, response);
	}
	
%>