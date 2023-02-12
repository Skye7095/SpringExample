package com.moonlight.spring.ex.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/ajax")
public class AjaxController {
		
	@GetMapping("/test")
	public String ajaxTest() {
		return "ajax/ajax";
	}
	
	@GetMapping("/request")
	@ResponseBody
	public Map<String, String> testRequest(){
		// json 데이터를 response에 담는다.
		Map<String, String> map= new HashMap<>();
		map.put("name", "유재석");
		map.put("age", "50");
		map.put("result", "success");
		
		return map;
	}
	

}
