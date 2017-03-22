package web.scmaster.com;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.scmaster.com.dao.nurseDAO;
import web.scmaster.com.vo.Nurse;



@Controller
public class nurseController {

	@Autowired
	private nurseDAO nursedao;

	
	@RequestMapping(value="managerLogin", method=RequestMethod.POST)
	public String selectNurseById(String id, String password,Model model, HttpSession session){
		
		Nurse n=nursedao.selectNurseById(id);
		
		if(n!=null){
			
			if(n.getPassword().equals(password)){
				
				model.addAttribute("id",id);
				session.setAttribute("id", n.getName());
				
				return "/managerPage";
				
			
			
			}else{			
				model.addAttribute("PWnotMatch","패스워드가 맞지 않습니다");
				return "home";	
			
			}
			}
			
			model.addAttribute("whywhywhy","왜 그런지 모르겠네");
		return "home";	
		
	
	}

}
