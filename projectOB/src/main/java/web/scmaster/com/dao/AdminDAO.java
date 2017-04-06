package web.scmaster.com.dao;

import java.util.HashMap;
import java.util.List;

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
	
	public List<Nurse> nurselist(){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.nurselist();
		
	}
	
	public List<Room> roomlist(){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.roomlist();
		
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
	
	public int updatePatientaboutNurse(int pt_no, int nurse_no){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.updatePatientaboutNurse(pt_no,nurse_no);
		
	}

	public int insertPatient(Patient patient){
	
	AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
	
	return mapper.insertPatient(patient);
		
	}
	
	public int updatePatient(Patient patient){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.updatePatient(patient);
		
	}
	
	
	 public List<Patient> patientlist(){
		   
		 AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
			   
	      return mapper.patientlist();
	   }
	 


}
