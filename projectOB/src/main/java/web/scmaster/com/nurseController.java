package web.scmaster.com;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import web.scmaster.com.dao.AdminDAO;
import web.scmaster.com.dao.nurseDAO;
import web.scmaster.com.dao.patientDAO;
import web.scmaster.com.util.FileService;
import web.scmaster.com.vo.DailyCleaning;
import web.scmaster.com.vo.Exercise;
import web.scmaster.com.vo.Meal;
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
	
	@ResponseBody
	@RequestMapping(value = "showDailyCleaning", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showDailyCleaning(int pt_no, String today){
		List<HashMap<String, Object>> showDailyCleaning = new ArrayList<>();
		showDailyCleaning = nursedao.showDailyCleaning(pt_no, today);
		return showDailyCleaning;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollMeal", method = RequestMethod.POST)
	public List<HashMap<String, Object>> enrollMeal(Meal meal){
		nursedao.enrollMeal(meal);
		
		int pt_no = meal.getPt_no();
		String today = meal.getToday();
		
		List<HashMap<String, Object>> showMeal = new ArrayList<>();
		showMeal = nursedao.patientScheduleList(pt_no, today);
		return showMeal;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollExercise", method = RequestMethod.POST)
	public List<HashMap<String, Object>> enrollExercise(Exercise exercise){
		nursedao.enrollExercise(exercise);
		
		int pt_no = exercise.getPt_no();
		String today = exercise.getToday();
		
		List<HashMap<String, Object>> showExercise = new ArrayList<>();
		showExercise = nursedao.showExercise(pt_no, today);
		return showExercise;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollDailyCleaning", method = RequestMethod.POST)
	public List<HashMap<String, Object>> enrollDailyCleaning(DailyCleaning dailyCleaning){
		nursedao.enrollDailyCleaning(dailyCleaning);
		
		int pt_no = dailyCleaning.getPt_no();
		String today = dailyCleaning.getToday();
		
		List<HashMap<String, Object>> showDailyCleaning = new ArrayList<>();
		showDailyCleaning = nursedao.showDailyCleaning(pt_no, today);
		return showDailyCleaning;
	}
	
	@ResponseBody
	@RequestMapping(value = "delMeal", method = RequestMethod.POST)
	public List<HashMap<String, Object>> delMeal(Meal meal){
		nursedao.delMeal(meal);
		
		int pt_no = meal.getPt_no();
		String today = meal.getToday();
		
		List<HashMap<String, Object>> showMeal = new ArrayList<>();
		showMeal = nursedao.patientScheduleList(pt_no, today);
		return showMeal;
	}
	
	@ResponseBody
	@RequestMapping(value = "delExercise", method = RequestMethod.POST)
	public List<HashMap<String, Object>> delExercise(Exercise exercise){
		nursedao.delExercise(exercise);
		
		int pt_no = exercise.getPt_no();
		String today = exercise.getToday();
		
		List<HashMap<String, Object>> showExercise = new ArrayList<>();
		showExercise = nursedao.showExercise(pt_no, today);
		return showExercise;
	}
	
	@ResponseBody
	@RequestMapping(value = "delDailyCleaning", method = RequestMethod.POST)
	public List<HashMap<String, Object>> delDailyCleaning(DailyCleaning dailycleaning){
		nursedao.delDailycleaning(dailycleaning);
		
		int pt_no = dailycleaning.getPt_no();
		String today = dailycleaning.getToday();
		
		List<HashMap<String, Object>> showDailyCleaning = new ArrayList<>();
		showDailyCleaning = nursedao.showDailyCleaning(pt_no, today);
		return showDailyCleaning;
	}
	
	@ResponseBody
	@RequestMapping(value = "showUpdateMeal", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showUpdateMeal(Meal meal){
		List<HashMap<String, Object>> showMeal = new ArrayList<>();
		showMeal = nursedao.showUpdateMeal(meal);
		return showMeal;
	}
	
	@ResponseBody
	@RequestMapping(value = "showUpdateExercise", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showUpdateExercise(Exercise exercise){
		List<HashMap<String, Object>> showExercise = new ArrayList<>();
		showExercise = nursedao.showUpdateExercise(exercise);
		return showExercise;
	}
	
	@ResponseBody
	@RequestMapping(value = "showUpdateDailycleaning", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showUpdateDailycleaning(DailyCleaning dailycleaning){
		List<HashMap<String, Object>> showDailyCleaning = new ArrayList<>();
		showDailyCleaning = nursedao.showUpdateDailycleaning(dailycleaning);
		return showDailyCleaning;
	}
	
	@ResponseBody
	@RequestMapping(value = "updateMeal", method = RequestMethod.POST)
	public List<HashMap<String, Object>> updateMeal(Meal meal){
		nursedao.updateMeal(meal);
		
		int pt_no = meal.getPt_no();
		String today = meal.getToday();
		
		List<HashMap<String, Object>> showMeal = new ArrayList<>();
		showMeal = nursedao.patientScheduleList(pt_no, today);
		return showMeal;
	}
	
	@ResponseBody
	@RequestMapping(value = "updateExercise", method = RequestMethod.POST)
	public List<HashMap<String, Object>> updateExercise(Exercise exercise){
		nursedao.updateExercise(exercise);
		
		int pt_no = exercise.getPt_no();
		String today = exercise.getToday();
		
		List<HashMap<String, Object>> showExercise = new ArrayList<>();
		showExercise = nursedao.showExercise(pt_no, today);
		return showExercise;
	}
	
	@ResponseBody
	@RequestMapping(value = "updateDailyCleaning", method = RequestMethod.POST)
	public List<HashMap<String, Object>> updateDailyCleaning(DailyCleaning dailycleaning){
		nursedao.updateDailyCleaning(dailycleaning);
		
		int pt_no = dailycleaning.getPt_no();
		String today = dailycleaning.getToday();
		
		List<HashMap<String, Object>> showDailyCleaning = new ArrayList<>();
		showDailyCleaning = nursedao.showDailyCleaning(pt_no, today);
		return showDailyCleaning;
	}
}
