package com.donkunny.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.donkunny.schedule.ScheduleVO;
import com.donkunny.schedule.persistence.ScheduleDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ScheduleDAOTest {
	
	@Inject
	private ScheduleDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleDAOTest.class);
	
	//@Test
	public void testRegisterSchedule() throws Exception{
		ScheduleVO svo = new ScheduleVO();
		svo.setS_id("test");
		//svo.setS_date("2015-04-02");
		svo.setS_title("test_title");
		svo.setS_content("today has no meetings");
		svo.setS_attendee("donkunny");
		svo.setS_place("Seoul station");
		svo.setS_type(0);
		
		dao.registerSchedule(svo);
	}
	
	// @Test
	public void testModifySchedule() throws Exception{
		ScheduleVO svo = new ScheduleVO();
		//svo.setS_date("2015-04-02");
		svo.setS_title("edited-title");
		svo.setS_content("today has no meetings-edited");
		svo.setS_attendee("donkunny");
		svo.setS_place("Seoul station");
		svo.setS_type(1);
		svo.setSno(1);

		dao.modifySchedule(svo);
	}
	
	// @Test
	public void testDeleteOneSchedule() throws Exception{
		dao.deleteOneSchedule(1);
	}
	
	// @Test
	public void testReadOneSchedule() throws Exception {
		ScheduleVO svo = new ScheduleVO();
		svo.setS_type(0);
		svo.setSno(3);
		
		dao.readOneSchedule(svo);
	}
	
	// @Test
	public void testListSchedule() throws Exception {
		logger.info(dao.readMySchedule().toString());
	}
	
}
