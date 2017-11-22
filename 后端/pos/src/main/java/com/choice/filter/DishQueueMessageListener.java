package com.choice.filter;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

public class DishQueueMessageListener implements MessageListener {
    @Override
    public void onMessage(Message message) {
        TextMessage tm = (TextMessage) message;
        try {
            System.out.println("DishQueueMessageListener监听到了应用消息："
                    + tm.getText());
            System.out.println("打印菜品信息");
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
}
