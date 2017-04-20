package web.scmaster.com;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	final String patientUploadPath = "/Users/kita/git/OBScmaster/projectOB/src/main/webapp/resources/image/patientfile";
	final String nurseUploadPath = "/Users/kita/git/OBScmaster/projectOB/src/main/webapp/resources/image/patientfile";
	List<HashMap<String, String>>patients = new ArrayList<>();
	
	@Autowired
	private AdminDAO admindao;
	
	
	@ResponseBody
	@RequestMapping(value = "nursename", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public String nursename(int nurse_no) {
		
		Nurse nurse = admindao.selectNurseByNurseno(nurse_no);
		return nurse.getName();
	
	}
	
	@RequestMapping(value = "adminNurseInfo", method = RequestMethod.GET)
	public String adminNurseInfo() {
	
		patients.clear();
		
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
	
		patients.clear();
		
		return "/admin/adminNurseInput";	
	
	}
	
	@RequestMapping(value = "adminLogin", method = RequestMethod.GET)
	public String adminLogin() {
	
		return "/admin/adminPage1";			
	
	}
	
	@RequestMapping(value = "adminLogin", method = RequestMethod.POST)
	public String adminLogin(String id, String password, Model model, HttpSession session) {
		
		Admin a = admindao.selectAdmin(id);
 		
	if(a!=null){
			
			if(a.getPassword().equals(password)){
				
				model.addAttribute("id",id);
				session.setAttribute("id",a.getId());
				
				return "/admin/adminPage1";
			
			}else{
				model.addAttribute("PWnotMatch","패스워드가 맞지 않습니다");
				return "mainPage";	
			
			}
			
		}else{
			
		model.addAttribute("whywhywhy","왜 그런지 모르겠네");
		
		return "mainPage";
		
		}
	
	}
	
	@RequestMapping(value = "adminLogout", method = RequestMethod.GET)
	public String adminLogout(HttpSession session){
		session.invalidate();
		return "redirect:/";
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
	public String insertNurse(Nurse nurse, MultipartFile upload, HttpServletRequest request){

		if (!upload.isEmpty()){
			String savedfile = FileService.saveFile(upload, nurseUploadPath);
			nurse.setOriginalphoto(upload.getOriginalFilename());
			nurse.setSavedphoto(savedfile);
		}
		
		admindao.insertNurse(nurse);
		Nurse n = admindao.selectNurseById(nurse.getId());
		String aa [] =  request.getParameterValues("pt_no");
		
			for(int i=0;i<aa.length;i++){		
			int pt_no=Integer.parseInt(aa[i]);			
			if(pt_no!=0){
			System.out.println(pt_no);
			System.out.println(n.getNurse_no());
			admindao.updatePatientaboutNurse(pt_no, n.getNurse_no());
			}
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
			
			admindao.insertPatient(patient);			
			
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
	public String updateNurse(Nurse nurse, MultipartFile upload, HttpServletRequest request){
		
		if(nurse.getNurse_no()==0){		
			return "/admin/adminNurseInfo";				
		}else{
			
			if (!upload.isEmpty()) {
				String savedfile = FileService.saveFile(upload, patientUploadPath);
				nurse.setOriginalphoto(upload.getOriginalFilename());
				nurse.setSavedphoto(savedfile);
			}
			
			admindao.updateNurse(nurse);
			
			String aa [] =  request.getParameterValues("pt_no");
			String bb [] =  request.getParameterValues("delPatient");
			
				if(bb!=null){
				for(int i=0;i<bb.length;i++){		
				int pt_no=Integer.parseInt(bb[i]);
			    admindao.updatePatientaboutNurse(pt_no, 0);
				}
				}
				for(int i=0;i<aa.length;i++){		
				int pt_no=Integer.parseInt(aa[i]);
			    admindao.updatePatientaboutNurse(pt_no, nurse.getNurse_no());
				}
			
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
	
	@ResponseBody
	@RequestMapping(value="addPatient", method=RequestMethod.GET)
	 public List<HashMap<String,String>> addPatient(String pt_no,String pt_name){
		HashMap<String,String> add = new HashMap<>();
		add.put("pt_no", pt_no);
		add.put("pt_name", pt_name);
		patients.add(add);
	    return patients;
	   }
	
	@ResponseBody
	@RequestMapping(value="removePatient", method=RequestMethod.GET)
	 public List<HashMap<String,String>> removePatient(String pt_name){
		
		patients.remove(patients.size()-1);
		
		return patients;
	   }
	
	@ResponseBody
	@RequestMapping(value="removePatientFromNurse", method=RequestMethod.GET)
	 public Patient removePatientFromNurse(String pt_no){
				
		return admindao.selectPatientBypt_no(pt_no);
		
	   }
	
	
}
