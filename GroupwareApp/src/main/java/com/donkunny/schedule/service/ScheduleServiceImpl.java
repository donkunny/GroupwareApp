package com.donkunny.schedule.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.donkunny.board.paging.CriForSchedule;
import com.donkunny.board.paging.Criteria;
import com.donkunny.schedule.ScheduleVO;
import com.donkunny.schedule.persistence.ScheduleDAO;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Inject
	ScheduleDAO dao;
	
	@Override
	public void registerSchedule(ScheduleVO svo) throws Exception {
		dao.registerSchedule(svo);
	}

	@Override
	public void modifySchedule(ScheduleVO svo) throws Exception {
		dao.modifySchedule(svo);
	}

	@Override
	public void deleteOneSchedule(int sno) throws Exception {
		dao.deleteOneSchedule(sno);
	}

	@Override
	public ScheduleVO readOneSchedule(ScheduleVO svo) throws Exception {
		return dao.readOneSchedule(svo);
	}

	@Override
	public List<ScheduleVO> readAllMySchedule() throws Exception {
		return dao.readMySchedule();
	}

	@Override
	public List<ScheduleVO> listPage(CriForSchedule cri) throws Exception {
		return dao.listPage(cri);
	}

	@Override
	public int countPaging() throws Exception {
		return dao.countPaging();
	}

}
