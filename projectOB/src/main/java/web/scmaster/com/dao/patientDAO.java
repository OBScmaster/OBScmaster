package web.scmaster.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.AisleSensorLog;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;
import web.scmaster.com.vo.SensorLog;

@Repository
public class patientDAO {
	
	@Autowired
	SqlSession sqlsession;

	
	public Patient selectPatient(String id){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.selectPatient(id);
		
	}
	
	public Patient selectPatientByPTNO(int pt_no){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.selectPatientByPTNO(pt_no);
		
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
	
	public Nurse showNurse(int nurse_no){
	
	patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
	return mapper.showNurse(nurse_no);	
	}
	
	public List<SensorLog> showLogList(String ipaddress,String today){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
			
			return mapper.showSensorLog(ipaddress,today);
			
		}
	
	
	public List<Patient> patientlist(int nurse_no){
		
		patientMapper mapper = sqlsession.getMapper(patientMapper.class);
		
		return mapper.patientList(nurse_no);
		
	}

}
