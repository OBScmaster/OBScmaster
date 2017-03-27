package web.scmaster.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.Admin;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;


@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public int insertRoom(Room room){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.insertRoom(room);
		
	}
	
	public int deleteRoom(String room_no){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.deleteRoom(room_no);
		
	}
	
	public Admin selectAdmin(String id){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.selectAdmin(id);
		
	}
	
	public Nurse selectNurseById(String id){
		
		nurseMapper mapper = sqlsession.getMapper(nurseMapper.class);
		
		return mapper.selectNurseById(id);
		
	}
	
	public Patient selectPatient(String id){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.selectPatient(id);
		
	}
	
	public int insertNurse(Nurse nurse){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.insertNurse(nurse);
		
	}

	public int insertPatient(Patient patient){
	
	AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
	
	return mapper.insertPatient(patient);
	
	}

}
