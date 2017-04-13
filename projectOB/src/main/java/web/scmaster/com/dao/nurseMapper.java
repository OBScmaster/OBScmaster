package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;

import web.scmaster.com.vo.DailyCleaning;
import web.scmaster.com.vo.Exercise;
import web.scmaster.com.vo.Meal;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;

public interface nurseMapper {
	
	public Nurse selectNurseById(String id);
	public int insertPatient(Patient patient);
	public int updateNurse(Nurse nurse);
	public int deleteNurse(int nurse_no);
	public List<Patient> patientList(int nurse_no);
	public List<HashMap<String, Object>> showMeal(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showExercise(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showDailyCleaning(HashMap<String, Object> map);
	public void enrollMeal(Meal meal);
	public void enrollExercise(Exercise exercise);
	public void enrollDailyCleaning(DailyCleaning dailyCleaning);
	public void delMeal(Meal meal);
	public void delExercise(Exercise exercise);
	public void delDailycleaning(DailyCleaning dailycleaning);
	public List<HashMap<String, Object>> showUpdateMeal(Meal meal);
	public List<HashMap<String, Object>> showUpdateExercise(Exercise exercise);
	public List<HashMap<String, Object>> showUpdateDailycleaning(DailyCleaning dailycleaning);
	public void updateMeal(Meal meal);
	public void updateExercise(Exercise exercise);
	public void updateDailyCleaning(DailyCleaning dailycleaning);
}
