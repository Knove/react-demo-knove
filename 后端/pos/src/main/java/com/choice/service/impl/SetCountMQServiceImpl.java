package com.choice.service.impl;

import com.choice.service.MQService;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.jms.*;

@Service("SetCountMQService")
public class SetCountMQServiceImpl implements MQService {
    @Resource(name = "jmsTemplateTwo")
    private JmsTemplate jmsTemplate;
    @Override
    public void sendMessage(String msg) {
        Destination destination = jmsTemplate.getDefaultDestination();
        System.out.println(Thread.currentThread().getName()+" 向队列"+destination.toString()+"发送消息---------------------->"+msg);
        jmsTemplate.send(new MessageCreator() {
            @Override
            public Message createMessage(Session session) throws JMSException {
                return session.createTextMessage(msg);
            }
        });
    }

    @Override
    public TextMessage receive(Destination destination) {
        TextMessage textMessage = (TextMessage) jmsTemplate.receive(destination);
        return textMessage;
    }
}
