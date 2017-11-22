package com.choice.service.impl;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.network.jms.JmsTopicConnector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import com.choice.service.MQService;
@Service("MQService")
public class MQServiceImpl implements MQService{
	@Resource(name = "jmsTemplate")
	private JmsTemplate jmsTemplate;
	
	public void sendMessage(final String msg){
		Destination destination = jmsTemplate.getDefaultDestination();
        System.out.println(Thread.currentThread().getName()+" 向队列"+destination.toString()+"发送消息---------------------->"+msg);
        jmsTemplate.send(new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
                return session.createTextMessage(msg);
            }
        });
    }
	 public TextMessage receive(Destination destination){
	        TextMessage textMessage = (TextMessage) jmsTemplate.receive(destination);
	        try{
	            System.out.println("从队列" + destination.toString() + "收到了消息：\t"
	                    + textMessage.getText());
	        } catch (JMSException e) {
	            e.printStackTrace();
	        }
	        return textMessage;
	    }

}
