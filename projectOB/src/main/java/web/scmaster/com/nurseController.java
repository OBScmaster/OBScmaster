package web.scmaster.com;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import web.scmaster.com.dao.nurseDAO;
import web.scmaster.com.dao.patientDAO;
import web.scmaster.com.util.FileService;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;


@SessionAttributes("nurse")
@Controller
public class nurseController {
	
	final String patientUploadPath = "/patientfile";
	final String nurseUploadPath = "/nursefile";

	@Autowired
	private nurseDAO nursedao;
	
	@Autowired
	private patientDAO pationtdao;
	
	@RequestMapping(value = "managerNurseInput", method = RequestMethod.GET)
	public String managerNurseInput() {
	
		return "/manager/managerNurseInput";	
	
	}
	
	@RequestMapping(value = "managerPatientInput", method = RequestMethod.GET)
	public String managerPatientInput() {
	
		return "/manager/managerPatientInput";	
	
	}
	
	@RequestMapping(value = "managerLogin", method = RequestMethod.GET)
	public String managerLogin() {
	
		return "/manager/managerPage";		
	
	}

	
	@RequestMapping(value="managerLogin", method=RequestMethod.POST)
	public String selectNurseById(String id, String password,Model model, HttpSession session){
		
		Nurse n=nursedao.selectNurseById(id);
		
		if(n!=null){
			
			if(n.getPassword().equals(password)){
				
				session.setAttribute("nurse", n);
				
				return "/manager/managerPage";
				
			
			
			}else{			
				model.addAttribute("PWnotMatch","패스워드가 맞지 않습니다");
				return "home";	
			
			}
			}
			
			model.addAttribute("whywhywhy","왜 그런지 모르겠네");
		return "home";
	}
	
	@RequestMapping(value="nurseInput", method=RequestMethod.GET)
	public String nurseInput(){
		return "/manaer/managerNurseInput";
	}
	
	@RequestMapping(value="nursePatientInput", method=RequestMethod.POST)
	public String nursePatientInput(Patient patient, MultipartFile upload){
		
		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, patientUploadPath);
			patient.setOriginalphoto(upload.getOriginalFilename());
			patient.setSavedphoto(savedfile);
		}
		
		int result = nursedao.insertPatient(patient);
		
		
		return "redirect:managerLogin";
	}
	
	@RequestMapping(value="scheduleInput", method=RequestMethod.GET)
	public String scheduleInput(){
		return "/manager/scheduleInput";
	}
	
	@ResponseBody
	@RequestMapping(value="patientInput", method=RequestMethod.GET)
	public Patient patientInput(int pt_no){
		
		Patient p=pationtdao.selectPatientByPTNO(pt_no);
		
		return p;
	}

}
