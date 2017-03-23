package web.scmaster.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.Nurse;

@Repository
public class nurseDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public Nurse selectNurseById(String id){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.selectNurseById(id);
		
	}
	
	public int updateNurse(Nurse nurse){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.updateNurse(nurse);
		
	}
	
	public int deleteNurse(int nurse_no){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.deleteNurse(nurse_no);
	}
	

}
