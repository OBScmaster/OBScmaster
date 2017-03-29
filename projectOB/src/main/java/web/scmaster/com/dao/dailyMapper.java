package web.scmaster.com.dao;

import java.util.HashMap;

import web.scmaster.com.vo.Exercise;
import web.scmaster.com.vo.Meal;

public interface dailyMapper {
	
	public Meal searchMeal(HashMap<String, Object> map);
	public Exercise searchExercise(HashMap<String, Object> map);
	
}
