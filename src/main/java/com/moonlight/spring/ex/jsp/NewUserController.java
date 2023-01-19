package com.moonlight.spring.ex.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moonlight.spring.ex.jsp.bo.NewUserBO;
import com.moonlight.spring.ex.jsp.model.NewUser;

@Controller
@RequestMapping("/jsp/user")
public class NewUserController {
	
	@Autowired
	private NewUserBO newuserBO;
	
	@GetMapping("/lastuser")
	public String lastUser(Model model) {
		
		NewUser lastUser = newuserBO.getLastUser();
		model.addAttribute("user", lastUser);
		model.addAttribute("title", "최근 사용자");
		
		return "jsp/lastuser";
	}
	
	// @RequestMapping(path="/add", method=RequestMethod.POST)
	// method에서 기본적으로 GET으로 되있음. POST로 변경하면 됨. 혹은 아래 방법으로
	
	// 원하는 방식에 따라 GetMapping이나 PostMapping으로 구분해서 진행
//	@ResponseBody
	@PostMapping("/add")
	public String addUser(
			@RequestParam("name") String name
			, @RequestParam("birthday") String birthday
			, @RequestParam("email") String email
			, @RequestParam("introduce") String introduce
			, Model model) {
		
//		int count = newuserBO.addUser(name, birthday, email, introduce);
//		return "삽입결과: " + count;
		
		NewUser user = new NewUser();
		user.setName(name);
		user.setYyyymmdd(birthday);
		user.setEmail(email);
		user.setIntroduce(introduce);
		
		newuserBO.addUserByObject(user);
		
		// 기존에 있는 responseBody 더 이상 필요없고 jsp 화면으로 가야함
		model.addAttribute("user", user);
		
		return "jsp/lastuser";
	}
	
	
	// 입력화면
	@GetMapping("/input")		// 이 화면에 접금할 때 get인지 post인지 결정함
	public String userInput() {
		return "jsp/userinput";
	}
}
