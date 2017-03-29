package web.scmaster.com;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import web.scmaster.com.dao.AdminDAO;
import web.scmaster.com.util.FileService;
import web.scmaster.com.vo.Admin;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;

@Controller
public class adminController {
	
	final String nurseUploadPath = "/nursefile";
	
	@Autowired
	private AdminDAO admindao;
	
	@RequestMapping(value = "adminLogin", method = RequestMethod.GET)
	public String adminLogin() {
	
		return "/admin/adminPage";			
	
	}
	
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
	
	@ResponseBody
	@RequestMapping(value="roomlist", method=RequestMethod.POST)
	public List<Room> roomlist(){
		List<Room> roomlist = admindao.roomlist();
		return roomlist;
	}
	@ResponseBody
	@RequestMapping(value="nurselist", method=RequestMethod.POST)
	public List<Nurse> nurselist(){
		List<Nurse> nurselist = admindao.nurselist();
		return nurselist;
	}
	
	
	@ResponseBody
	@RequestMapping(value="roomregist", method=RequestMethod.POST)
	public String regist(@RequestBody Room room){
	
		admindao.insertRoom(room);		
	
		return "등록완료";
	}
	
	
	@RequestMapping(value="insertNurse", method=RequestMethod.POST)
	public String insertNurse(Nurse nurse, MultipartFile upload){

		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, nurseUploadPath);
			nurse.setOriginalphoto(upload.getOriginalFilename());
			nurse.setSavedphoto(savedfile);
		}
		
		admindao.insertNurse(nurse);		
		
		return "redirect:adminLogin";
	}
	
	@RequestMapping(value="insertPatient", method=RequestMethod.POST)
	public String insertPatient(Patient patient, MultipartFile upload){
		
		System.out.println(patient);
		System.out.println("asdfasdfasdfasdf");
		System.out.println("asdfasdfasdfasdf");
		System.out.println("asdfasdfasdfasdf");
		System.out.println("asdfasdfasdfasdf");
		System.out.println("asdfasdfasdfasdf");
		System.out.println("asdfasdfasdfasdf");
		
		System.out.println(patient);
		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, nurseUploadPath);
			patient.setOriginalphoto(upload.getOriginalFilename());
			patient.setSavedphoto(savedfile);
		}
		
		int result = admindao.insertPatient(patient);
		System.out.println(result);
		
		return "redirect:adminLogin";
	}

}
