package web.scmaster.com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import web.scmaster.com.vo.Daily2;
import web.scmaster.com.vo.Exercise;
import web.scmaster.com.vo.Meal;


@Repository
public class dailyDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public Meal searchMeal(int pt_no, String today){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		
		Meal meal;
		
		meal = mapper.searchMeal(map);
		
		return meal;
	}
	
	public Exercise searchExercise(int pt_no, String today){
		
		HashMap<String , Object> map = new HashMap<>();
		map.put("pt_no", pt_no);
		map.put("today", today);
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		
		Exercise exercise;
		exercise = mapper.searchExercise(map);
		
		return exercise;
	}
}
