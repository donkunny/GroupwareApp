package com.donkunny.schedule.persistence;

import java.util.List;

import com.donkunny.schedule.ScheduleVO;

public interface ScheduleDAO {
	
	public void registerSchedule(ScheduleVO svo) throws Exception;
	public void modifySchedule(ScheduleVO svo) throws Exception;
	public void deleteOneSchedule(int sno) throws Exception;
	public ScheduleVO readOneSchedule(ScheduleVO svo) throws Exception;
	public List<ScheduleVO> readMySchedule() throws Exception;
}
