package web.scmaster.com;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	final String patientUploadPath = "../../../../../webapp/resources/image/patientfile";
	final String nurseUploadPath = "/nursefile";
	
	@Autowired
	private AdminDAO admindao;
	
	
	@ResponseBody
	@RequestMapping(value = "nursename", method = RequestMethod.GET)
	public String nursename(int nurse_no) {
		
		return admindao.selectNurseByNurseno(nurse_no);
	
	}
	
	@RequestMapping(value = "adminNurseInfo", method = RequestMethod.GET)
	public String adminNurseInfo() {
	
		return "/admin/adminNurseInfo";	
	
	}
	
	@RequestMapping(value = "adminPatientInfo", method = RequestMethod.GET)
	public String adminPatientInfo() {
	
		return "/admin/adminPatientInfo";	
	
	}
	
	@RequestMapping(value = "adminPatientInput", method = RequestMethod.GET)
	public String adminPatientInput() {
	
		return "/admin/adminPatientInput";	
	
	}
	
	@RequestMapping(value = "adminNurseInput", method = RequestMethod.GET)
	public String adminNurseInput() {
	
		return "/admin/adminNurseInput";	
	
	}
	
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
				session.setAttribute("id",a.getId());
				
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
	@RequestMapping(value="roomregist", method=RequestMethod.POST)
	public String regist(@RequestBody Room room){
	
		admindao.insertRoom(room);		
	
		return "등록완료";
	}
	
	
	@RequestMapping(value="insertNurse", method=RequestMethod.POST)
	public String insertNurse(Nurse nurse, int pt_no, MultipartFile upload){

		if (!upload.isEmpty()){
			String savedfile = FileService.saveFile(upload, nurseUploadPath);
			nurse.setOriginalphoto(upload.getOriginalFilename());
			nurse.setSavedphoto(savedfile);
		}
		
		admindao.insertNurse(nurse);
		
		if(pt_no!=0){
		admindao.updatePatientaboutNurse(pt_no, nurse.getNurse_no());
		}
		
		return "redirect:adminLogin";
	}
	
	
	@RequestMapping(value="insertPatient", method=RequestMethod.POST)
	public String insertPatient(Patient patient, MultipartFile upload){

			if (!upload.isEmpty()) {
				String savedfile = FileService.saveFile(upload, patientUploadPath);
				patient.setOriginalphoto(upload.getOriginalFilename());
				patient.setSavedphoto(savedfile);
			}
			
			int result = admindao.insertPatient(patient);			
			
			return "redirect:adminLogin";
		
		
		
	}
	
	
	
	@RequestMapping(value="updatePatient", method=RequestMethod.POST)
	public String updatePatient(Patient patient, MultipartFile upload){
		if(patient.getNurse_no()==0){
			
			return "/admin/adminPatientInfo";	
			
		}else{
			
			if (!upload.isEmpty()) {
				String savedfile = FileService.saveFile(upload, patientUploadPath);
				patient.setOriginalphoto(upload.getOriginalFilename());
				patient.setSavedphoto(savedfile);
			}
			
			admindao.updatePatient(patient);			
			
			return "redirect:adminLogin";
		}
	}
	
	@RequestMapping(value="updateNurse", method=RequestMethod.POST)
	public String updateNurse(Nurse nurse, int pt_no, MultipartFile upload){
		
		System.out.println(pt_no);
		System.out.println(pt_no);
		System.out.println(pt_no);
		System.out.println(pt_no);
		
		System.out.println("asdfasdfasdf");
		
		System.out.println(nurse.getNurse_no());
		System.out.println(nurse.getNurse_no());
		System.out.println(nurse.getNurse_no());
		
		if(nurse.getNurse_no()==0){		
			return "/admin/adminNurseInfo";				
		}else{
			System.out.println();
			if(pt_no>0){
			
				System.out.println(nurse.getNurse_no());
				System.out.println(nurse.getNurse_no());
				System.out.println(nurse.getNurse_no());
				
				System.out.println("fasdfasdf");
				
				
				System.out.println(pt_no);
				System.out.println(pt_no);
				System.out.println(pt_no);
				System.out.println(pt_no);
				
				admindao.updatePatientaboutNurse(pt_no, nurse.getNurse_no());
			}
			
			if (!upload.isEmpty()) {
				String savedfile = FileService.saveFile(upload, patientUploadPath);
				nurse.setOriginalphoto(upload.getOriginalFilename());
				nurse.setSavedphoto(savedfile);
			}
			
			admindao.updateNurse(nurse);
			
			return "redirect:adminLogin";
		}
	}
	
	
		@ResponseBody
	   @RequestMapping(value="patientlist", method=RequestMethod.GET)
	   public List<Patient> patientlist(){
		   
		   List<Patient> patientlist = admindao.patientlist();
			   
	      return patientlist;
	   }
	
	@ResponseBody
	@RequestMapping(value="nurselist", method=RequestMethod.POST)
	 public List<Nurse> nurselist(){
		   
		   List<Nurse> nurselist = admindao.nurselist();
			   
	      return nurselist;
	   }
}
