package web.scmaster.com.dao;

import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;

public interface nurseMapper {
	
	public Nurse selectNurseById(String id);
	public int insertPatient(Patient patient);
	public int updateNurse(Nurse nurse);
	public int deleteNurse(int nurse_no);

}
