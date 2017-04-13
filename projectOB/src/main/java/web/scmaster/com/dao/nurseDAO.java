package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.DailyCleaning;
import web.scmaster.com.vo.Exercise;
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
	
	public List<HashMap<String, Object>> showDailyCleaning(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showDailyCleaning(map);
	}
	
	public void enrollMeal(Meal meal){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollMeal(meal);
	}
	
	public void enrollExercise(Exercise exercise){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollExercise(exercise);
	}
	
	public void enrollDailyCleaning(DailyCleaning dailyCleaning){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollDailyCleaning(dailyCleaning);
	}
	
	public void delMeal(Meal meal){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.delMeal(meal);
	}
	
	public void delExercise(Exercise exercise){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.delExercise(exercise);
	}
	
	public void delDailycleaning(DailyCleaning dailycleaning){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.delDailycleaning(dailycleaning);
	}
	
	public List<HashMap<String, Object>> showUpdateMeal(Meal meal){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showUpdateMeal(meal);
	}
	
	public List<HashMap<String, Object>> showUpdateExercise(Exercise exercise){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showUpdateExercise(exercise);
	}
	
	public List<HashMap<String, Object>> showUpdateDailycleaning(DailyCleaning dailycleaning){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showUpdateDailycleaning(dailycleaning);
	}
	
	public void updateMeal(Meal meal){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.updateMeal(meal);
	}
	
	public void updateExercise(Exercise exercise){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.updateExercise(exercise);
	}
	
	public void updateDailyCleaning(DailyCleaning dailycleaning){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.updateDailyCleaning(dailycleaning);
	}
}
