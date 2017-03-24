package web.scmaster.com.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.scmaster.com.vo.Daily2;



public interface dailyMapper {
	
	public Daily2 searchDaily(@Param("pt_no")int pt_no, @Param("today")String today);

}
