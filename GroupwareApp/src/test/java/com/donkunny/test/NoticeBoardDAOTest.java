package com.donkunny.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.donkunny.board.NoticeBoardVO;
import com.donkunny.board.paging.Criteria;
import com.donkunny.board.persistence.NoticeBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class NoticeBoardDAOTest {

	@Inject
	private NoticeBoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardDAO.class);
	
	// @Test
	public void testWrite() throws Exception{
		NoticeBoardVO nvo = new NoticeBoardVO();
		nvo.setN_title("test title1");
		nvo.setN_content("test Content1");
		
		dao.write(nvo);
		// logger.info(nvo.toString());
		
	}
	
	// @Test
	public void testModify() throws Exception{
		NoticeBoardVO nvo = new NoticeBoardVO();
		nvo.setN_id("dddd");
		nvo.setNno(1);
		
		nvo.setN_title("test title_edited");
		nvo.setN_content("test Content_edited");
		
		dao.modify(nvo);
		
	}
	
	// @Test
	public void testRead() throws Exception {
		dao.read(1);
	}
	
	// @Test
	public void testDelete() throws Exception {
		NoticeBoardVO nvo = new NoticeBoardVO();
		nvo.setN_id("test");
		nvo.setNno(3);
		
		dao.delete(nvo.getNno());
	}
	
	//@Test
	public void testListAll() throws Exception {
		List<NoticeBoardVO> list = dao.listAll();
		
		for(NoticeBoardVO board: list){
			logger.info(board.toString());
		}
		
	}
	
	// @Test
	public void testListPage() throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<NoticeBoardVO> list = dao.listPage(cri);
		
		for(NoticeBoardVO nvo : list) {
			logger.info(nvo.getNno() + ": " + nvo.getN_title());
		}
	}
	
	@Test
	public void testCountPaging() throws Exception {
		logger.info(dao.countPaging() +"");
	}
}
