package com.donkunny.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.donkunny.board.NoticeBoardVO;
import com.donkunny.board.paging.Criteria;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO{

	@Inject
	SqlSession session; 
	
	private static String namespace ="com.donkunny.mapper.noticeBoardMapper";
	
	@Override
	public void write(NoticeBoardVO nvo) throws Exception {
		session.insert(namespace+".write", nvo);
	}

	@Override
	public void modify(NoticeBoardVO nvo) throws Exception {
		session.update(namespace+".modify", nvo);
	}

	@Override
	public void delete(int nno) throws Exception {
		session.delete(namespace+".delete", nno);
	}

	@Override
	public NoticeBoardVO read(int nno) throws Exception {
		return session.selectOne(namespace+".read", nno);
	}

	@Override
	public List<NoticeBoardVO> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}

	@Override
	public List<NoticeBoardVO> listPage(Criteria cri) throws Exception {
		return session.selectList(namespace+".listPage", cri);
	}

	@Override
	public int countPaging() throws Exception {
		return session.selectOne(namespace+".countPaging");
	}
	
}
