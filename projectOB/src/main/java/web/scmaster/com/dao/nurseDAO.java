package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public List<HashMap<String, Object>> showDailyWash(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showDailyWash(map);
	}
	
	public List<HashMap<String, Object>> showDailyShower(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showDailyShower(map);
	}
	
	public List<HashMap<String, Object>> showBedTime(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showBedTime(map);
	}
	
	public List<HashMap<String, Object>> showDr_op(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showDr_op(map);
	}
	
	public List<HashMap<String, Object>> showSpecial(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showSpecial(map);
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
	
	public void enrollDailyWash(DailyWash dailywash){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollDailyWash(dailywash);
	}
	
	public void enrollDailyShower(DailyShower dailyshower){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollDailyShower(dailyshower);
	}
	
	public void enrollBedTime(Bedtime bedtime){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollBedTime(bedtime);
	}
	
	public void enrollDr_op(DR_OP dr_op){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollDr_op(dr_op);
	}
	
	public void enrollSpecial(Special special){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.enrollSpecial(special);
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
	
	public void delDailyWash(DailyWash dailywash){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.delDailyWash(dailywash);
	}
	
	public void delDailyShower(DailyShower dailyshower){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.delDailyShower(dailyshower);
	}
	
	public void delBedTime(Bedtime bedtime){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.delBedTime(bedtime);
	}
	
	public void delDr_op(DR_OP dr_op){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.delDr_op(dr_op);
	}
	
	public void delSpecial(Special special){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.delSpecial(special);
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
	
	public List<HashMap<String, Object>> showUpdateDailyWash(DailyWash dailywash){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showUpdateDailyWash(dailywash);
	}
	
	public List<HashMap<String, Object>> showUpdateDailyShower(DailyShower dailyshower){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showUpdateDailyShower(dailyshower);
	}
	
	public List<HashMap<String, Object>> showUpdateBedTime(Bedtime bedtime){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showUpdateBedTime(bedtime);
	}
	
	public List<HashMap<String, Object>> showUpdateDr_op(DR_OP dr_op){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showUpdateDr_op(dr_op);
	}
	
	public List<HashMap<String, Object>> showUpdateSpecial(Special special){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.showUpdateSpecial(special);
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
	
	public void updateDailyWash(DailyWash dailywash){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.updateDailyWash(dailywash);
	}
	
	public void updateDailyShower(DailyShower dailyshower){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.updateDailyShower(dailyshower);
	}
	
	public void updateBedTime(Bedtime bedtime){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.updateBedTime(bedtime);
	}
	
	public void updateDr_op(DR_OP dr_op){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.updateDr_op(dr_op);
	}
	
	public void updateSpecial(Special special){
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		mapper.updateSpecial(special);
	}
}
