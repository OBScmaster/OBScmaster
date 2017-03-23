package web.scmaster.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;

@Repository
public class patientDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public int insertRoom(Room room){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.insertRoom(room);
		
	}
	
	public Patient selectPatient(String id){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.selectPatient(id);
		
	}
	
	public int insertPatient(Patient patient){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.insertPatient(patient);
		
	}
	
	public int updatePatient(Patient patient){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.updatePatient(patient);
		
	}
	
	public int deletePatient(int pt_no){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.deletePatient(pt_no);
		
	}
	
	public int changeNurse(int nurse_no){
		
	patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.changeNurse(nurse_no);
		
	}

}
