package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.Meal;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;

@Repository
public class nurseDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public Nurse selectNurseById(String id){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.selectNurseById(id);
		
	}
	
	public int insertPatient(Patient patient){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.insertPatient(patient);
		
	}
	
	public int updateNurse(Nurse nurse){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.updateNurse(nurse);
		
	}
	
	public int deleteNurse(int nurse_no){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.deleteNurse(nurse_no);
	}
	
	public List<Patient> patientList(int nurse_no){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.patientList(nurse_no);
	}
	
	public List<HashMap<String, Object>> patientScheduleList(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showMeal(map);
	}
	
	public List<HashMap<String, Object>> showExercise(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showExercise(map);
	}
	
	public List<HashMap<String, Object>> showCleaning(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showCleaning(map);
	}
	
	public void enrollMeal(Meal meal){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollMeal(meal);
	}
}
