package ayseth;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MainChatServlet
 */
@WebServlet("/MainChatServlet")
public class MainChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
	String chRoomPath;
	String roomListPath;
	String adminChatPath;
	
	public void init(){
		ServletContext servletContext=getServletContext();
		servletContext.setAttribute(chRoomPath, servletContext.getInitParameter("CHROOM_PATH"));
		servletContext.setAttribute(roomListPath, servletContext.getInitParameter("ROOMLIST_PATH"));
		servletContext.setAttribute(adminChatPath, servletContext.getInitParameter("ADMINCHAT_PATH"));
	}
    public MainChatServlet() {
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
		chRoomPath=(String) getServletContext().getAttribute("chRoomPath");
		roomListPath=(String) getServletContext().getAttribute("roomListPath");
		adminChatPath=(String) getServletContext().getAttribute("adminChatPath");
		HttpSession session=request.getSession();
		session.setAttribute("chRoomPath", chRoomPath);
		session.setAttribute("roomListPath",roomListPath);
		session.setAttribute("adminChatPath", adminChatPath);
		HashMap hashmap=null;
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
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
					rs.close();
					getServletContext().setAttribute("roomList", hashmap);
				}
			}
		con.close();
			
		}catch(SQLException e){
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher view=request.getRequestDispatcher("chat.jsp");
		view.forward(request, response);
	}
}
