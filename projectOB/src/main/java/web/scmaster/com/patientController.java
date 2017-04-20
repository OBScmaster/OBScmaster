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
import web.scmaster.com.vo.DailyCleaning;
import web.scmaster.com.vo.DailyShower;
import web.scmaster.com.vo.DailyWash;

import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.SensorLog;

@Controller
public class patientController {
   
   @Autowired
   private patientDAO patientdao;
   @Autowired
   private dailyDAO dailydao;
   
   @RequestMapping(value="patientLogin", method=RequestMethod.GET)
   public String login(){
	   
        return "/protector/protectorPage";
        
      }
   
   
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
            return "mainPage";   
         
         	}
         }
         
         model.addAttribute("whywhywhy","왜 그런지 모르겠네");
      return "mainPage";
      }
   
   @RequestMapping(value = "protectorLogout", method = RequestMethod.GET)
   public String protectorLogout(HttpSession session){
	   session.invalidate();
	   return "redirect:/";
   }
   
   
   @RequestMapping(value="dailyschedule", method=RequestMethod.GET)
   public String dailyschedule(int pt_no,String today,Model model){
      
      List<HashMap<String, Object>> mealList = new ArrayList<>();
      mealList =  dailydao.mealList(pt_no, today);
      model.addAttribute("mealList", mealList);
      
      List<HashMap<String, Object>> exerciseList = new ArrayList<>();
      exerciseList = dailydao.exerciseList(pt_no, today);
      model.addAttribute("exerciseList", exerciseList);
      
      DailyCleaning cleaning = dailydao.cleaning(pt_no, today);
      model.addAttribute("cleaning", cleaning);
      
      DailyWash wash = dailydao.wash(pt_no, today);
      model.addAttribute("wash", wash);
      
      DailyShower shower = dailydao.shower(pt_no, today);
      model.addAttribute("shower", shower);
      
      List<HashMap<String, Object>> bedList = new ArrayList<>();
      bedList = dailydao.bedList(pt_no, today);
      model.addAttribute("bedList", bedList);
      
      List<HashMap<String, Object>> dr_opList = new ArrayList<>();
      dr_opList = dailydao.dr_opList(pt_no, today);
      model.addAttribute("dr_opList", dr_opList);
      
      List<HashMap<String, Object>> specialList = new ArrayList<>();
      specialList = dailydao.specialList(pt_no, today);
      model.addAttribute("specialList", specialList);

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