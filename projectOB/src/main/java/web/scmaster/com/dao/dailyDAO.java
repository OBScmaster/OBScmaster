package web.scmaster.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.Daily;

@Repository
public class dailyDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public Daily searchDaily(int pt_no, String date){
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		
		return mapper.searchDaily(pt_no, date);
	}

}
