package com.donkunny.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.donkunny.board.NoticeBoardVO;
import com.donkunny.board.paging.Criteria;
import com.donkunny.board.persistence.NoticeBoardDAO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{

	@Inject
	private NoticeBoardDAO dao;
	
	@Override
	public void write(NoticeBoardVO nvo) throws Exception {
		dao.write(nvo);
	}

	@Override
	public void modify(NoticeBoardVO nvo) throws Exception {
		dao.modify(nvo);
	}

	@Override
	public void delete(int nno) throws Exception {
		dao.delete(nno);
	}

	@Override
	public NoticeBoardVO read(int nno) throws Exception {
		return dao.read(nno);
	}

	@Override
	public List<NoticeBoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<NoticeBoardVO> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}

	@Override
	public int countPaging() throws Exception {
		return dao.countPaging();
	}
	
}
