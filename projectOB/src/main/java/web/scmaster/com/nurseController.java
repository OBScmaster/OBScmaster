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
import web.scmaster.com.vo.Bedtime;
import web.scmaster.com.vo.DR_OP;
import web.scmaster.com.vo.DailyCleaning;
import web.scmaster.com.vo.DailyShower;
import web.scmaster.com.vo.DailyWash;
import web.scmaster.com.vo.Exercise;
import web.scmaster.com.vo.Meal;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;
import web.scmaster.com.vo.Special;


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
	@RequestMapping(value = "showDailyWash", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showDailyWash(int pt_no, String today){
		List<HashMap<String, Object>> showDailyWash = new ArrayList<>();
		showDailyWash = nursedao.showDailyWash(pt_no, today);
		return showDailyWash;
	}
	
	@ResponseBody
	@RequestMapping(value = "showDailyShower", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showDailyShower(int pt_no, String today){
		List<HashMap<String, Object>> showDailyShower = new ArrayList<>();
		showDailyShower = nursedao.showDailyShower(pt_no, today);
		return showDailyShower;
	}
	
	@ResponseBody
	@RequestMapping(value = "showBedTime", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showBedTime(int pt_no, String today){
		List<HashMap<String, Object>> showBedTime = new ArrayList<>();
		showBedTime = nursedao.showBedTime(pt_no, today);
		return showBedTime;
	}
	
	@ResponseBody
	@RequestMapping(value = "showDr_op", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showDr_op(int pt_no, String today){
		List<HashMap<String, Object>> showDr_op = new ArrayList<>();
		showDr_op = nursedao.showDr_op(pt_no, today);
		return showDr_op;
	}
	
	@ResponseBody
	@RequestMapping(value = "showSpecial", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showSpecial(int pt_no, String today){
		List<HashMap<String, Object>> showSpecial = new ArrayList<>();
		showSpecial = nursedao.showSpecial(pt_no, today);
		return showSpecial;
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
	@RequestMapping(value = "enrollDailyShower", method = RequestMethod.POST)
	public List<HashMap<String, Object>> enrollDailyShower(DailyShower dailyshower){
		nursedao.enrollDailyShower(dailyshower);
		
		int pt_no = dailyshower.getPt_no();
		String today = dailyshower.getToday();
		
		List<HashMap<String, Object>> showDailyShower = new ArrayList<>();
		showDailyShower = nursedao.showDailyShower(pt_no, today);
		return showDailyShower;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollDailyWash", method = RequestMethod.POST)
	public List<HashMap<String, Object>> enrollDailyWash(DailyWash dailywash){
		nursedao.enrollDailyWash(dailywash);
		
		int pt_no = dailywash.getPt_no();
		String today = dailywash.getToday();
		
		List<HashMap<String, Object>> showDailyWash = new ArrayList<>();
		showDailyWash = nursedao.showDailyWash(pt_no, today);
		return showDailyWash;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollBedTime", method = RequestMethod.POST)
	public List<HashMap<String, Object>> enrollBedTime(Bedtime bedtime){
		nursedao.enrollBedTime(bedtime);
		
		int pt_no = bedtime.getPt_no();
		String today = bedtime.getToday();
		
		List<HashMap<String, Object>> showBedTime = new ArrayList<>();
		showBedTime = nursedao.showBedTime(pt_no, today);
		return showBedTime;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollDr_op", method = RequestMethod.POST)
	public List<HashMap<String, Object>> enrollDr_op(DR_OP dr_op){
		nursedao.enrollDr_op(dr_op);
		
		int pt_no = dr_op.getPt_no();
		String today = dr_op.getToday();
		
		List<HashMap<String, Object>> showDr_op = new ArrayList<>();
		showDr_op = nursedao.showDr_op(pt_no, today);
		return showDr_op;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollSpecial", method = RequestMethod.POST)
	public List<HashMap<String, Object>> enrollSpecial(Special special){
		nursedao.enrollSpecial(special);
		
		int pt_no = special.getPt_no();
		String today = special.getToday();
		
		List<HashMap<String, Object>> showSpecial = new ArrayList<>();
		showSpecial = nursedao.showSpecial(pt_no, today);
		return showSpecial;
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
	@RequestMapping(value = "delDailyWash", method = RequestMethod.POST)
	public List<HashMap<String, Object>> delDailyWash(DailyWash dailywash){
		nursedao.delDailyWash(dailywash);
		
		int pt_no = dailywash.getPt_no();
		String today = dailywash.getToday();
		
		List<HashMap<String, Object>> showDailyWash= new ArrayList<>();
		showDailyWash = nursedao.showDailyWash(pt_no, today);
		return showDailyWash;
	}
	
	@ResponseBody
	@RequestMapping(value = "delDailyShower", method = RequestMethod.POST)
	public List<HashMap<String, Object>> delDailyShower(DailyShower dailyshower){
		nursedao.delDailyShower(dailyshower);
		
		int pt_no = dailyshower.getPt_no();
		String today = dailyshower.getToday();
		
		List<HashMap<String, Object>> showDailyShower= new ArrayList<>();
		showDailyShower = nursedao.showDailyShower(pt_no, today);
		return showDailyShower;
	}
	
	@ResponseBody
	@RequestMapping(value = "delBedTime", method = RequestMethod.POST)
	public List<HashMap<String, Object>> delBedTime(Bedtime bedtime){
		nursedao.delBedTime(bedtime);
		
		int pt_no = bedtime.getPt_no();
		String today = bedtime.getToday();
		
		List<HashMap<String, Object>> showBedTime= new ArrayList<>();
		showBedTime = nursedao.showBedTime(pt_no, today);
		return showBedTime;
	}
	
	@ResponseBody
	@RequestMapping(value = "delDr_op", method = RequestMethod.POST)
	public List<HashMap<String, Object>> delDr_op(DR_OP dr_op){
		nursedao.delDr_op(dr_op);
		
		int pt_no = dr_op.getPt_no();
		String today = dr_op.getToday();
		
		List<HashMap<String, Object>> showDr_op= new ArrayList<>();
		showDr_op = nursedao.showDr_op(pt_no, today);
		return showDr_op;
	}
	
	@ResponseBody
	@RequestMapping(value = "delSpecial", method = RequestMethod.POST)
	public List<HashMap<String, Object>> delSpecial(Special special){
		nursedao.delSpecial(special);
		
		int pt_no = special.getPt_no();
		String today = special.getToday();
		
		List<HashMap<String, Object>> showSpecial= new ArrayList<>();
		showSpecial = nursedao.showSpecial(pt_no, today);
		return showSpecial;
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
	@RequestMapping(value = "showUpdateDailyWash", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showUpdateDailyWash(DailyWash dailywash){
		List<HashMap<String, Object>> showDailyWash = new ArrayList<>();
		showDailyWash = nursedao.showUpdateDailyWash(dailywash);
		return showDailyWash;
	}
	
	@ResponseBody
	@RequestMapping(value = "showUpdateDailyShower", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showUpdateDailyShower(DailyShower dailyshower){
		List<HashMap<String, Object>> showDailyShower = new ArrayList<>();
		showDailyShower = nursedao.showUpdateDailyShower(dailyshower);
		return showDailyShower;
	}
	
	@ResponseBody
	@RequestMapping(value = "showUpdateBedTime", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showUpdateBedTime(Bedtime bedtime){
		List<HashMap<String, Object>> showBedTime = new ArrayList<>();
		showBedTime = nursedao.showUpdateBedTime(bedtime);
		return showBedTime;
	}
	
	@ResponseBody
	@RequestMapping(value = "showUpdateDr_op", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showUpdateDr_op(DR_OP dr_op){
		List<HashMap<String, Object>> showDr_op = new ArrayList<>();
		showDr_op = nursedao.showUpdateDr_op(dr_op);
		return showDr_op;
	}
	
	@ResponseBody
	@RequestMapping(value = "showUpdateSpecial", method = RequestMethod.POST)
	public List<HashMap<String, Object>> showUpdateSpecial(Special special){
		List<HashMap<String, Object>> showSpecial = new ArrayList<>();
		showSpecial = nursedao.showUpdateSpecial(special);
		return showSpecial;
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
	
	@ResponseBody
	@RequestMapping(value = "updateDailyWash", method = RequestMethod.POST)
	public List<HashMap<String, Object>> updateDailyWash(DailyWash dailywash){
		nursedao.updateDailyWash(dailywash);
		
		int pt_no = dailywash.getPt_no();
		String today = dailywash.getToday();
		
		List<HashMap<String, Object>> showDailyWash = new ArrayList<>();
		showDailyWash = nursedao.showDailyWash(pt_no, today);
		return showDailyWash;
	}
	
	@ResponseBody
	@RequestMapping(value = "updateDailyShower", method = RequestMethod.POST)
	public List<HashMap<String, Object>> updateDailyShower(DailyShower dailyshower){
		nursedao.updateDailyShower(dailyshower);
		
		int pt_no = dailyshower.getPt_no();
		String today = dailyshower.getToday();
		
		List<HashMap<String, Object>> showDailyShower = new ArrayList<>();
		showDailyShower = nursedao.showDailyShower(pt_no, today);
		return showDailyShower;
	}
	
	@ResponseBody
	@RequestMapping(value = "updateBedTime", method = RequestMethod.POST)
	public List<HashMap<String, Object>> updateBedTime(Bedtime bedtime){
		nursedao.updateBedTime(bedtime);
		
		int pt_no = bedtime.getPt_no();
		String today = bedtime.getToday();
		
		List<HashMap<String, Object>> showBedTime = new ArrayList<>();
		showBedTime = nursedao.showBedTime(pt_no, today);
		return showBedTime;
	}
	
	@ResponseBody
	@RequestMapping(value = "updateDr_op", method = RequestMethod.POST)
	public List<HashMap<String, Object>> updateDr_op(DR_OP dr_op){
		nursedao.updateDr_op(dr_op);
		
		int pt_no = dr_op.getPt_no();
		String today = dr_op.getToday();
		
		List<HashMap<String, Object>> showDr_op = new ArrayList<>();
		showDr_op = nursedao.showDr_op(pt_no, today);
		return showDr_op;
	}
	
	@ResponseBody
	@RequestMapping(value = "updateSpecial", method = RequestMethod.POST)
	public List<HashMap<String, Object>> updateSpecial(Special special){
		nursedao.updateSpecial(special);
		
		int pt_no = special.getPt_no();
		String today = special.getToday();
		
		List<HashMap<String, Object>> showSpecial = new ArrayList<>();
		showSpecial = nursedao.showSpecial(pt_no, today);
		return showSpecial;
	}
}
