package com.homestay.controller;
import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.*;
import java.util.ArrayList;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.homestay.model.Room;
import com.homestay.model.User;
import com.homestay.service.ICityDetails;
import com.homestay.service.IRoomService;
import com.homestay.service.IUserDetailsService;
@RunWith(SpringRunner.class)
@WebMvcTest(value= HomeController.class ,secure=false)

public class HomeControllerTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	@MockBean
	private IRoomService iRoomService;
	@MockBean
	private ICityDetails iCityDetails;
	@MockBean
	private IUserDetailsService iUserDetails;

	@Test
	public void GetCity_Test() throws Exception {
		ArrayList<String> cities= new ArrayList<>();
		cities.add("Charlotte");
		cities.add("San Jose");
		String inputInJson=this.mapToJson(cities);
		String URL="/city";
    	Mockito.when(iCityDetails.GetCity()).thenReturn(cities);
		RequestBuilder requestBuilder=MockMvcRequestBuilders.get(URL).accept(MediaType.APPLICATION_JSON)
				.content(inputInJson).contentType(MediaType.APPLICATION_JSON);
	    MvcResult result=mockMvc.perform(requestBuilder).andReturn();
		MockHttpServletResponse response=result.getResponse();
		String outputInJson=result.getResponse().getContentAsString();
		assertThat(outputInJson).isEqualTo(inputInJson);
		assertEquals(HttpStatus.OK.value(),response.getStatus());
	
	}
	
	private String mapToJson(ArrayList<String> cities) throws JsonProcessingException{
		ObjectMapper objectMapper= new ObjectMapper();
		return objectMapper.writeValueAsString(cities);
	}


	@Test
	public void getRoomDetailsTest() throws Exception{
		ArrayList<Room> r=new ArrayList<Room>();
		Room R=new Room();
		R.setCityId(1);
		R.setDistance("5");
		R.setId(1);
		R.setNoBathroom(2);
		R.setNoBedroom(2);
		R.setRoomName("Romm1");
		R.setRoomUrl("abc");
		r.add(R);
		
		String inputInJson=this.mapToJson(R);
		String URL="/rooms";
		Mockito.when(iRoomService.getRoomDetails()).thenReturn(r);
		RequestBuilder requestBuilder=MockMvcRequestBuilders.post(URL).accept(MediaType.APPLICATION_JSON)
				.content(inputInJson).contentType(MediaType.APPLICATION_JSON);
	
		MvcResult result=mockMvc.perform(requestBuilder).andReturn();
		MockHttpServletResponse response=result.getResponse();
		String outputInJson=result.getResponse().getContentAsString();
		//assertThat(outputInJson).isEqualTo(inputInJson);
		assertEquals(HttpStatus.OK.value(),response.getStatus());

	}
	
	private String mapToJson(Room r) throws JsonProcessingException{
			ObjectMapper objectMapper= new ObjectMapper();
			return objectMapper.writeValueAsString(r);
	}
	
	

	
		

		
		
	
	
	
}




