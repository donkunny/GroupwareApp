package com.donkunny.schedule.service;

import java.util.List;

import com.donkunny.board.paging.CriForSchedule;
import com.donkunny.board.paging.Criteria;
import com.donkunny.schedule.ScheduleVO;

public interface ScheduleService {
	public void registerSchedule(ScheduleVO svo) throws Exception;
	public void modifySchedule(ScheduleVO svo) throws Exception;
	public void deleteOneSchedule(int sno) throws Exception;
	public ScheduleVO readOneSchedule(ScheduleVO svo) throws Exception;
	public List<ScheduleVO> readAllMySchedule() throws Exception;
	public List<ScheduleVO> listPage(CriForSchedule cri) throws Exception;
	public int countPaging() throws Exception;
}
