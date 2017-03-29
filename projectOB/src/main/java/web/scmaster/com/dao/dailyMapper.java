package web.scmaster.com.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import web.scmaster.com.vo.Daily2;
import web.scmaster.com.vo.Exercise;
import web.scmaster.com.vo.Meal;

public interface dailyMapper {
	
	public Meal searchMeal(HashMap<String, Object> map);
	public Exercise searchExercise(HashMap<String, Object> map);
	
}
