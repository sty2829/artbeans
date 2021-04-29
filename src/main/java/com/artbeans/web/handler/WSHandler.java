package com.artbeans.web.handler;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.artbeans.web.dto.ChatMsg;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class WSHandler extends TextWebSocketHandler{
	@Autowired
	private ObjectMapper om;
	private Set<WebSocketSession> sessionSet = Collections.synchronizedSet(new HashSet<>());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionSet.add(session);
	}	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionSet.remove(session);
		
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		ChatMsg cm = om.readValue(message.getPayload(), ChatMsg.class);
		log.info("msg=>{}",cm);
		Iterator<WebSocketSession> it = sessionSet.iterator();
		while(it.hasNext()) {
			WebSocketSession wss = it.next();
			wss.sendMessage(message);
		}
		
	}

}
