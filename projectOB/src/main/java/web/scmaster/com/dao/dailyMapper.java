package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;
import web.scmaster.com.vo.Meal;

public interface dailyMapper {
	
	public Meal searchMeal(HashMap<String, Object> map);
	public List<HashMap<String, Object>> exerciseList(HashMap<String, Object> map);
}
