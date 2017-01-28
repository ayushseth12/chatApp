package ayseth;

import java.io.IOException;
import java.util.HashMap;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AdminChatServlet
 */

public class AdminChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HashMap hashmap=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql//localhost:3306/chat","root","root");
			synchronized (getServletContext()) {
				hashmap=(HashMap) getServletContext().getAttribute("roomList");
	if(hashmap==null){
					hashmap =new HashMap();
					Statement stmt=con.createStatement();
					String query="select * from chatrooms";
					ResultSet rs=stmt.executeQuery(query);
					while(rs.next()){
						hashmap.put(rs.getString(1), new ChatRoom(rs.getString(1),rs.getString(2),4));			
					}
				
			}
			
		}
			String rooms[] = request.getParameterValues("remove");
	        synchronized(hashmap){
	            if(rooms != null){
					String deletequery = "delete from chatrooms where roomname=?" ;
					PreparedStatement pstate = con.prepareStatement(deletequery);
	                for(int i = 0; i < rooms.length; i++){				 	
						pstate.setString(1,rooms[i]);
						pstate.executeUpdate();
						hashmap.remove(rooms[i]);				
	                }
					pstate.close();	
	            }
	        }
	        //adding room.
			String roomname = request.getParameter("roomname");
	        String roomdesc = request.getParameter("roomdescr");
			
	        if(roomname != null && roomname.length() > 0){
	            synchronized(hashmap){
						String deletequery = "insert into chatrooms values(?, ?)" ;
						PreparedStatement pstate = con.prepareStatement(deletequery);
						pstate.setString(1,roomname);
						pstate.setString(2,roomdesc);
						pstate.executeUpdate();
						pstate.close();
						hashmap.put(roomname, new ChatRoom (roomname, roomdesc, 4));
	            }
	        }
			con.close();
			}catch(SQLException e){
			e.printStackTrace();	
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		RequestDispatcher view=request.getRequestDispatcher("AdminChatServlet.jsp");
		view.forward(request, response);
			
		
	}

}
