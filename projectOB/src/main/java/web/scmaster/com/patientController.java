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

import web.scmaster.com.dao.dailyDAO;
import web.scmaster.com.dao.patientDAO;
import web.scmaster.com.vo.Meal;

import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.SensorLog;

@Controller
public class patientController {
   
   @Autowired
   private patientDAO patientdao;
   @Autowired
   private dailyDAO dailydao;
   
   
   @RequestMapping(value="patientLogin", method=RequestMethod.POST)
   public String login(String id, String password, Model model, HttpSession session){
         model.addAttribute("whywhywhy",null);
      
         Patient p= patientdao.selectPatient(id);
               
         if(p!=null){
            
         if(p.getPpt_pw().equals(password)){
            
            session.setAttribute("id", p);
            
            return "/protector/protectorPage";
         
         }else{         
            model.addAttribute("PWnotMatch","패스워드가 맞지 않습니다");
            return "home";   
         
         }
         }
         
         model.addAttribute("whywhywhy","왜 그런지 모르겠네");
      return "home";
      }
   
   
   @RequestMapping(value="dailyschedule", method=RequestMethod.GET)
   public String dailyschedule(int pt_no,String today,Model model){
      
      List<HashMap<String, Object>> mealList = new ArrayList<>();
      mealList =  dailydao.mealList(pt_no, today);
      model.addAttribute("mealList", mealList);
      System.out.println(mealList);
      
      List<HashMap<String, Object>> exerciseList = new ArrayList<>();
      exerciseList = dailydao.exerciseList(pt_no, today);
      model.addAttribute("exerciseList", exerciseList);

      return "/protector/patientDaily";
   }
   
   @RequestMapping(value="showVideo", method=RequestMethod.GET)
   public String showVideo(int pt_no, Model model){
	   
      return "/protector/showVideo";
   }
   
   
   @ResponseBody
   @RequestMapping(value="showLog", method=RequestMethod.GET)
   public List<SensorLog> showLog(int pt_no, Model model){
	   
	   List<SensorLog> loglist = patientdao.showLogList(pt_no);
		   
      return loglist;
   }
   
   @ResponseBody
   @RequestMapping(value="patientList", method=RequestMethod.GET)
   public List<Patient> patientList(int nurse_no, Model model){
	   
	   List<Patient> patientList = patientdao.patientlist(nurse_no);
		   
      return patientList;
   }
   
}