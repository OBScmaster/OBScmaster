package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;

import web.scmaster.com.vo.Bedtime;
import web.scmaster.com.vo.DR_OP;
import web.scmaster.com.vo.DailyCleaning;
import web.scmaster.com.vo.DailyShower;
import web.scmaster.com.vo.DailyWash;
import web.scmaster.com.vo.Exercise;
import web.scmaster.com.vo.Meal;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Special;

public interface nurseMapper {
	
	public Nurse selectNurseById(String id);
	public int insertPatient(Patient patient);
	public int updateNurse(Nurse nurse);
	public int deleteNurse(int nurse_no);
	public List<Patient> patientList(int nurse_no);
	public List<HashMap<String, Object>> showMeal(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showExercise(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showDailyCleaning(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showDailyWash(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showDailyShower(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showBedTime(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showDr_op(HashMap<String, Object> map);
	public List<HashMap<String, Object>> showSpecial(HashMap<String, Object> map);
	public void enrollMeal(Meal meal);
	public void enrollExercise(Exercise exercise);
	public void enrollDailyCleaning(DailyCleaning dailyCleaning);
	public void enrollDailyWash(DailyWash dailywash);
	public void enrollDailyShower(DailyShower dailyshower);
	public void enrollBedTime(Bedtime bedtime);
	public void enrollDr_op(DR_OP dr_op);
	public void enrollSpecial(Special special);
	public void delMeal(Meal meal);
	public void delExercise(Exercise exercise);
	public void delDailycleaning(DailyCleaning dailycleaning);
	public void delDailyWash(DailyWash dailywash);
	public void delDailyShower(DailyShower dailyshower);
	public void delBedTime(Bedtime bedtime);
	public void delDr_op(DR_OP dr_op);
	public void delSpecial(Special special);
	public List<HashMap<String, Object>> showUpdateMeal(Meal meal);
	public List<HashMap<String, Object>> showUpdateExercise(Exercise exercise);
	public List<HashMap<String, Object>> showUpdateDailycleaning(DailyCleaning dailycleaning);
	public List<HashMap<String, Object>> showUpdateDailyWash(DailyWash dailywash);
	public List<HashMap<String, Object>> showUpdateDailyShower(DailyShower dailyshower);
	public List<HashMap<String, Object>> showUpdateBedTime(Bedtime bedtime);
	public List<HashMap<String, Object>> showUpdateDr_op(DR_OP dr_op);
	public List<HashMap<String, Object>> showUpdateSpecial(Special special);
	public void updateMeal(Meal meal);
	public void updateExercise(Exercise exercise);
	public void updateDailyCleaning(DailyCleaning dailycleaning);
	public void updateDailyWash(DailyWash dailywash);
	public void updateDailyShower(DailyShower dailyshower);
	public void updateBedTime(Bedtime bedtime);
	public void updateDr_op(DR_OP dr_op);
	public void updateSpecial(Special special);
}
