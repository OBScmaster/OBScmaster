package web.scmaster.com;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import web.scmaster.com.dao.AdminDAO;
import web.scmaster.com.dao.nurseDAO;
import web.scmaster.com.dao.patientDAO;
import web.scmaster.com.util.FileService;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;


@SessionAttributes("nurse")
@Controller
public class nurseController {
	
	final String patientUploadPath = "/patientfile";
	final String nurseUploadPath = "/nursefile";

	@Autowired
	private nurseDAO nursedao;
	
	
	@Autowired
	private patientDAO pationtdao;
	
	@RequestMapping(value = "managerPatientInfo", method = RequestMethod.GET)
	public String managerPatientInfo() {
		
		return "/manager/managerPatientInfo";	
	
	}
	
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
	public String selectNurseById(String id, String password, Model model, HttpSession session){
		
		Nurse n = nursedao.selectNurseById(id);
		String nurseId = n.getId();
		
		if(n!=null){
			
			if(n.getPassword().equals(password)){
				
				session.setAttribute("nurseId", nurseId);
				model.addAttribute("nurse_no", n.getNurse_no());
				session.setAttribute("nurse_no", n.getNurse_no());
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
		
		if(patient.getNurse_no()==0){
			
			return "/manager/managerPatientInput";	
			
		}else{
		
		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, patientUploadPath);
			patient.setOriginalphoto(upload.getOriginalFilename());
			patient.setSavedphoto(savedfile);
		}
		
		int result = nursedao.insertPatient(patient);
		
		return "redirect:managerLogin";
		}
	
	}
	
	@RequestMapping(value="scheduleInput", method=RequestMethod.GET)
	public String scheduleInput(HttpSession session, Model model){
		String id = (String) session.getAttribute("nurseId");
		Nurse nurse = nursedao.selectNurseById(id);
		int nurse_no = nurse.getNurse_no();
		List<Patient> patientList = nursedao.patientList(nurse_no);
		model.addAttribute("patientList", patientList);
		return "/manager/scheduleInput";
	}
	
	@ResponseBody
	@RequestMapping(value="patientInput", method=RequestMethod.GET)
	public Patient patientInput(int pt_no){
		
		Patient p=pationtdao.selectPatientByPTNO(pt_no);
		
		return p;
	}

	@ResponseBody
	@RequestMapping(value="showMeal", method=RequestMethod.POST)
	public List<HashMap<String, Object>> showMeal(int pt_no, String today){
		List<HashMap<String, Object>> showMeal = new ArrayList<>();
		showMeal = nursedao.patientScheduleList(pt_no, today);
		return showMeal;
	}
	
	@ResponseBody
	@RequestMapping(value = "showExercise", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showExercise(int pt_no, String today){
		List<HashMap<String, Object>> showExercise = new ArrayList<>();
		showExercise = nursedao.showExercise(pt_no, today);
		return showExercise;
	}
}
