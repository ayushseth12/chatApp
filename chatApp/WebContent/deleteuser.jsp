<%@ page language="java" import="java.sql.*, java.io.*" errorPage="" %>
<%
	String[] names=request.getParameterValues("loginid");
	if (names!=null){	
	int i;
	try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
	String deletequery = "delete from login where loginid=?" ;
    PreparedStatement pstate = con.prepareStatement(deletequery);
	for(i=0;i<names.length;i++){
		pstate.setString(1,names[i]);
		pstate.executeUpdate();
	}
	pstate.close();
	con.close();
		RequestDispatcher rd=request.getRequestDispatcher("viewuser.jsp");
		rd.forward(request, response);
	}
	catch(Exception e){
		RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
		rd.forward(request, response);
	}	
	}
	else{
	RequestDispatcher rd=request.getRequestDispatcher("viewuser.jsp");
		rd.forward(request, response);
	}
%>