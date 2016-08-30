package com.donkunny.board.persistence;

import java.util.List;

import com.donkunny.board.NoticeBoardVO;
import com.donkunny.board.paging.Criteria;

public interface NoticeBoardDAO {
	public void write(NoticeBoardVO nvo) throws Exception;
	public void modify(NoticeBoardVO nvo) throws Exception;
	public void delete(int nno) throws Exception;
	public NoticeBoardVO read(int nno) throws Exception;
	public List<NoticeBoardVO> listAll() throws Exception;
	public List<NoticeBoardVO> listPage(Criteria cri) throws Exception;
	public int countPaging() throws Exception;
}