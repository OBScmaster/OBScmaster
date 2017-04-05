package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.DailyCleaning;
import web.scmaster.com.vo.DailyShower;
import web.scmaster.com.vo.DailyWash;
import web.scmaster.com.vo.Meal;


@Repository
public class dailyDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public List<HashMap<String, Object>> mealList(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		return mapper.mealList(map);
	}
	
	public List<HashMap<String, Object>> exerciseList(int pt_no, String today){
		
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		
		return mapper.exerciseList(map);
	}
	
	public DailyCleaning cleaning(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		return mapper.cleaning(map);
	}
	
	public DailyWash wash(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		return mapper.wash(map);
	}
	
	public DailyShower shower(int pt_no, String today){
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		return mapper.shower(map);
	}
	
	public List<HashMap<String, Object>> bedList(int pt_no, String today){
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		return mapper.bedList(map);
	}
	
	public List<HashMap<String, Object>> dr_opList(int pt_no, String today){
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		return mapper.dr_opList(map);
	}
	
	public List<HashMap<String, Object>> specialList(int pt_no, String today){
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		return mapper.specialList(map);
	}
}
