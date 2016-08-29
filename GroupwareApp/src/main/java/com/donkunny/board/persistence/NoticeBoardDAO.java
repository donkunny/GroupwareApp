package com.donkunny.board.persistence;

import java.util.List;

import com.donkunny.board.NoticeBoardVO;

public interface NoticeBoardDAO {
	public void write(NoticeBoardVO nvo) throws Exception;
	public void modify(NoticeBoardVO nvo) throws Exception;
	public void delete(NoticeBoardVO nvo) throws Exception;
	public NoticeBoardVO read(int nno) throws Exception;
	public List<NoticeBoardVO> listAll() throws Exception;
}