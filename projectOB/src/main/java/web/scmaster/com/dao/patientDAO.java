package web.scmaster.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.Room;

@Repository
public class patientDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public int insertRoom(Room room){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.insertRoom(room);
		
	}

}
