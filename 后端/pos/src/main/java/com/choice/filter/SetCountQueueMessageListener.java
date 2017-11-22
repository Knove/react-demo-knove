package com.choice.filter;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

public class SetCountQueueMessageListener implements MessageListener{

			@Override
			public void onMessage(Message message) {
				// TODO Auto-generated method stub
				TextMessage tm = (TextMessage) message;
		        try {
		            System.out.println("SetCountQueueMessageListener监听到了应用消息："
		                    + tm.getText());
		            //do something ...
		            System.out.println("<<<本次订单完成，欢迎下次再来！>>>");
		        } catch (JMSException e) {
		            e.printStackTrace();
		        }
			}
			
		}

