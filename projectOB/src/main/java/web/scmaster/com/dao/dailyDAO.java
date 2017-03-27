package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import web.scmaster.com.vo.Daily2;


@Repository
public class dailyDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public Daily2 searchDaily(int pt_no, String today){
		
		dailyMapper mapper = sqlsession.getMapper(dailyMapper.class);
		
		return mapper.searchDaily(pt_no, today);
	}

}
