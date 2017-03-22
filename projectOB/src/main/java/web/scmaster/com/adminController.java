package web.scmaster.com;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class adminController {
	
	@RequestMapping(value = "adminLogin", method = RequestMethod.POST)
	public String adminLogin(String id, String password) {
		
		if(password.equals("admin")){

		return "/adminPage";
		
		}
		
		return "home";
		
		}

}
