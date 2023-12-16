package com.example.renderDemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class RenderDemoApplication {

	@RequestMapping("/")
	String index(){
		return "Hello World!";
	}

	public static void main(String[] args) {
		SpringApplication.run(RenderDemoApplication.class, args);
	}

}
