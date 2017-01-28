package ayseth;

public class ChatRoom {

	private String chatRoomName;
	private String roomDescription;
	private int roomSize;
	public ChatRoom(String chatRoomName, String roomDescription, int roomSize) {
		this.chatRoomName = chatRoomName;
		this.roomDescription = roomDescription;
		this.roomSize = roomSize;
	}	
	public String getChatRoomName() {
		return chatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}
	public String getRoomDescription() {
		return roomDescription;
	}
	public void setRoomDescription(String roomDescription) {
		this.roomDescription = roomDescription;
	}
	public int getRoomSize() {
		return roomSize;
	}
	public void setRoomSize(int roomSize) {
		this.roomSize = roomSize;
	}
		
}
