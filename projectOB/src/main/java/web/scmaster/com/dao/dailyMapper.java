package web.scmaster.com.dao;

import web.scmaster.com.vo.Daily;

public interface dailyMapper {
	
	public Daily searchDaily(int pt_no, String date);

}
