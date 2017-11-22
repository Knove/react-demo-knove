package com.choice.service;

import javax.jms.Destination;
import javax.jms.TextMessage;

public interface MQService {
	//向mq发送数据
	void sendMessage(final String msg);
	//从mq接收数据
	TextMessage receive(Destination destination);

}
