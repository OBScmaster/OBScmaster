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
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;

@Controller
public class patientController {
	
	@Autowired
	private patientDAO patientdao;
	
	@RequestMapping(value="Login", method=RequestMethod.POST)
	public String login(String id, String password, String divider, Model model, HttpSession session){
	
		if(divider.equals("manager")){
		
	
		model.addAttribute("id", id);
		session.setAttribute("id", id);
			
		return "/managerPage";
		
		}else{
			
		model.addAttribute("id",id);
		session.setAttribute("id", id);
		
		return "/protectorPage";
		
		}
		}
	
	@ResponseBody
	@RequestMapping(value="roomregist", method=RequestMethod.POST)
	public String regist(@RequestBody Room room){
	
		patientdao.insertRoom(room);		
		
		return "등록완료";
	}
	


	

}
