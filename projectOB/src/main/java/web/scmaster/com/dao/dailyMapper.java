package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;

import web.scmaster.com.vo.DailyCleaning;
import web.scmaster.com.vo.DailyShower;
import web.scmaster.com.vo.DailyWash;
import web.scmaster.com.vo.Meal;

public interface dailyMapper {
	
	public List<HashMap<String, Object>> mealList(HashMap<String, Object> map);
	public List<HashMap<String, Object>> exerciseList(HashMap<String, Object> map);
	public DailyCleaning cleaning(HashMap<String, Object> map);
	public DailyWash wash(HashMap<String, Object> map);
	public DailyShower shower(HashMap<String, Object> map);
	public List<HashMap<String , Object>> bedList(HashMap<String, Object> map);
	public List<HashMap<String, Object>> dr_opList(HashMap<String, Object> map);
	public List<HashMap<String, Object>> specialList(HashMap<String, Object> map);

}
