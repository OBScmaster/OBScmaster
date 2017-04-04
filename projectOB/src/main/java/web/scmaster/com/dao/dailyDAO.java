package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
}
