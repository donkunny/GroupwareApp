package com.donkunny.member.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.donkunny.member.MemberVO;
import com.donkunny.member.TempMemberVO;
import com.donkunny.member.login.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	SqlSession session; 
	
	private static String namespace ="com.donkunny.mapper.MemberMapper";
	
	@Override
	public void register(TempMemberVO tvo) throws Exception {
		session.insert(namespace+".register", tvo);
	}

	@Override
	public MemberVO confirmLogin(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".confirmLogin", dto);
	}

	@Override
	public void confirmMember(int tno) throws Exception {
		session.insert(namespace+".confirmMember", tno);
	}

	@Override
	public void deleteWaitingMember(int tno) throws Exception {
		session.delete(namespace+".deleteWatingMember", tno);
	}

	@Override
	public void updateMemberInfo(MemberVO mvo) throws Exception {
		session.update(namespace+".updateMemberInfo", mvo);
	}

	@Override
	public void deleteMember(int rno) throws Exception {
		session.delete(namespace+".deleteMember", rno);
	}

	@Override
	public void updateGrade(MemberVO mvo) throws Exception {
		session.update(namespace+".updateGrade", mvo);
	}

	@Override
	public void readTMember(int tno) throws Exception {
		session.selectOne(namespace+".selectTMember", tno);
	}

	@Override
	public MemberVO checkMemberInfo(MemberVO vo) throws Exception {
		return session.selectOne(namespace+".memberInfo", vo);
	}
	
}
