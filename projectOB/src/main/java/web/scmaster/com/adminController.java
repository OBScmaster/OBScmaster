package web.scmaster.com;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.scmaster.com.dao.AdminDAO;
import web.scmaster.com.vo.Admin;

@Controller
public class adminController {
	
	@Autowired
	private AdminDAO admindao;
	
	@RequestMapping(value = "adminLogin", method = RequestMethod.POST)
	public String adminLogin(String id, String password, Model model, HttpSession session) {
		
		Admin a = admindao.selectAdmin(id);
 		
	if(a!=null){
			
			if(a.getPassword().equals(password)){
				
				model.addAttribute("id",id);
				session.setAttribute("id", a.getId());
				
				return "/admin/adminPage";
				
			
			
			}else{			
				model.addAttribute("PWnotMatch","패스워드가 맞지 않습니다");
				return "home";	
			
			}
			}
			
			model.addAttribute("whywhywhy","왜 그런지 모르겠네");
		return "home";	
		
	
	}

}
