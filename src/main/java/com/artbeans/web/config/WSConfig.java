package com.artbeans.web.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.artbeans.web.handler.WSHandler;



@Configuration
@EnableWebSocket
public class WSConfig implements WebSocketConfigurer {
	@Autowired
	WSHandler wsh;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(wsh, "/chat");
		
	}

}
