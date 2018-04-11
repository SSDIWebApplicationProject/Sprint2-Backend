package com.homestay.dao;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.homestay.connection.IConnection;
import com.homestay.model.Room;

public class SearchDaoTest {

	@Autowired
	IConnection Conn;
	
	@Test
	public void  getRoomDetailsTest() {
		Connection conn=null;
		ArrayList<String> cities= new ArrayList<>();
		PreparedStatement ps=null;
		ArrayList<Room> rooms= new ArrayList<>();
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/TestHomeStay","root","root");
		ps=conn.prepareStatement("select * from room "); 
		System.out.println(ps);
		ResultSet rs=ps.executeQuery(); 
		while (rs.next()) {
			int id = rs.getInt("room_id");
			String roomName = rs.getString("roomName");
			String distance = rs.getString("distance");
			int bedroom = rs.getInt("bedroom");
			int bathroom = rs.getInt("bathroom");
			int maxPeople = rs.getInt("maxPeople");
			int cityId = rs.getInt("cityId");
			String roomUrl = rs.getString("roomurl");
			Room room = new Room();
			room.setId(id);
			room.setDistance(distance);
			room.setMaxpeople(maxPeople);
			room.setNoBathroom(bathroom);
			room.setNoBedroom(bedroom);
			room.setRoomName(roomName);
			room.setRoomUrl(roomUrl);
			room.setCityId(cityId);
			rooms.add(room);
		    }
		  }
	    catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    assertEquals(5, rooms.size());
		
	}
	
	

}
