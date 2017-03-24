package web.scmaster.com.dao;

import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;

public interface patientMapper {
	
	public Patient selectPatient(String id);
	public int insertPatient(Patient patient);
	public int updatePatient(Patient patient);
	public int deletePatient(int pt_no);
	public int changeNurse(int nurse_no);

}
