package web.scmaster.com.dao;

import web.scmaster.com.vo.Patient;
import web.scmaster.com.vo.Room;

public interface patientMapper {
	
	public int insertRoom(Room room);
	public Patient selectPatient(String id);

}
