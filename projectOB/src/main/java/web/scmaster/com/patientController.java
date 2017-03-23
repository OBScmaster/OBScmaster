package web.scmaster.com;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.scmaster.com.dao.patientDAO;

import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;

@Controller
public class patientController {
	
	@Autowired
	private patientDAO patientdao;
	
	
	@RequestMapping(value="patientLogin", method=RequestMethod.POST)
	public String login(String id, String password, Model model, HttpSession session){
			model.addAttribute("whywhywhy",null);
		
			Patient p= patientdao.selectPatient(id);
					
			if(p!=null){
				
			if(p.getPpt_pw().equals(password)){
				
				model.addAttribute("id",id);
				session.setAttribute("id", p.getName());
				
				return "/protector/protectorPage";
				
			
			
			}else{			
				model.addAttribute("PWnotMatch","패스워드가 맞지 않습니다");
				return "home";	
			
			}
			}
			
			model.addAttribute("whywhywhy","왜 그런지 모르겠네");
		return "home";
		
		
		}
	
	@ResponseBody
	@RequestMapping(value="roomregist", method=RequestMethod.POST)
	public String regist(@RequestBody Room room){
	
		patientdao.insertRoom(room);		
		
		return "등록완료";
	}
	


	

}
