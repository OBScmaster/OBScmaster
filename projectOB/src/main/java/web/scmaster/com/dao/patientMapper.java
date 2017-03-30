package web.scmaster.com.dao;

import java.util.List;



import web.scmaster.com.vo.Patient;

import web.scmaster.com.vo.SensorLog;

public interface patientMapper {
	
	public Patient selectPatient(String id);
	public Patient selectPatientByPTNO(int pt_no);
	public int insertPatient(Patient patient);
	public int updatePatient(Patient patient);
	public int deletePatient(int pt_no);
	public int changeNurse(int nurse_no);
	public List<SensorLog> showSensorLog(int pt_no);
	public List<Patient> patientList(int nurse_no);
	
}
