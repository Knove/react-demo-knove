package com.choice.filter;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

public class QueueMessageListener implements MessageListener{

	@Override
	public void onMessage(Message message) {
		// TODO Auto-generated method stub
		TextMessage tm = (TextMessage) message;
        try {
            System.out.println("QueueMessageListener监听到了应用消息："
                    + tm.getText());
            //do something ...
            System.out.println("打印订单");
        } catch (JMSException e) {
            e.printStackTrace();
        }
		
	}

}
