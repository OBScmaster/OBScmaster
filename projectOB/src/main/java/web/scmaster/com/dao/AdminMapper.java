package web.scmaster.com.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.scmaster.com.vo.Admin;
import web.scmaster.com.vo.Nurse;
import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;

public interface AdminMapper {
	
	public int insertRoom(Room room);
	public List<Room> roomlist();
	public List<Nurse> nurselist();
	public int deleteRoom(String room_no);
	public Admin selectAdmin(String id);
	public Nurse selectNurseById(String id);
	public Patient selectPatient(String id);
	public int insertNurse(Nurse nurse);
	public int insertPatient(Patient patient);
	public int updatePatient(Patient patient);
	public List<Patient> patientlist();
	
	public int updatePatientaboutNurse(int pt_no, @Param("nurse_no")int nurse_no);
}
