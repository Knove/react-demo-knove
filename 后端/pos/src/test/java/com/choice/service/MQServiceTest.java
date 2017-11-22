package com.choice.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.choice.service.impl.MQServiceImpl;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/applicationContext-*.xml"})
public class MQServiceTest {
	@Autowired 
	private MQServiceImpl mqService;
	@Test
	public void testSendMessage() {
		mqService.sendMessage("hello");
	}

	@Test
	public void testReceive() {
		
	}

}
