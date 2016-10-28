package com.donkunny.schedule.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.donkunny.board.paging.CriForSchedule;
import com.donkunny.board.paging.Criteria;
import com.donkunny.schedule.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
	
	@Inject
	SqlSession session;
	private static String namespace ="com.donkunny.mapper.scheduleMapper";
	
	@Override
	public void registerSchedule(ScheduleVO svo) throws Exception {
		session.insert(namespace+".registerSchedule", svo);
	}

	@Override
	public void modifySchedule(ScheduleVO svo) throws Exception {
		session.update(namespace+".modifySchedule", svo);
	}

	@Override
	public void deleteOneSchedule(int sno) throws Exception {
		session.delete(namespace+".deleteOneSchedule", sno);
	}

	@Override
	public ScheduleVO readOneSchedule(int sno) throws Exception {
		return session.selectOne(namespace+".readOneSchedule", sno);
	}

	@Override
	public List<ScheduleVO> readMySchedule() throws Exception {
		return session.selectList(namespace+".readMySchedule");
	}

	@Override
	public List<ScheduleVO> listPage(CriForSchedule cri) throws Exception {
		return session.selectList(namespace+".listPage", cri);
	}

	@Override
	public int countPaging() throws Exception {
		return session.selectOne(namespace+".countPaging");
	}
	
}
