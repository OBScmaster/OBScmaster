package web.scmaster.com.dao;

import web.scmaster.com.vo.Nurse;

public interface nurseMapper {
	
	public Nurse selectNurseById(String id);
	public int updateNurse(Nurse nurse);
	public int deleteNurse(int nurse_no);

}
