package web.scmaster.com.dao;

import web.scmaster.com.vo.Admin;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;

public interface AdminMapper {

	public Admin selectAdmin(String id);
	public Nurse selectNurseById(String id);
	public Patient selectPatient(String id);
	public int insertNurse(Nurse nurse);
	public int insertPatient(Patient patient);
}
