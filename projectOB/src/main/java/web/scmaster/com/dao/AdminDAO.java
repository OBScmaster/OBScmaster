package web.scmaster.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.scmaster.com.vo.Admin;


@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	public Admin selectAdmin(String id){
		
		AdminMapper mapper = sqlsession.getMapper(AdminMapper.class);
		
		return mapper.selectAdmin(id);
		
	}

}
