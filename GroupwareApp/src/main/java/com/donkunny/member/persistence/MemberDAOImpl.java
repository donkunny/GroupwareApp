package com.donkunny.member.persistence;

import java.util.List;

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
	public void confirmMember(String t_id) throws Exception {
		session.insert(namespace+".confirmMember", t_id);
	}

	@Override
	public void deleteWaitingMember(String t_id) throws Exception {
		session.delete(namespace+".deleteWatingMember", t_id);
	}

	@Override
	public void updateMemberInfo(MemberVO mvo) throws Exception {
		session.update(namespace+".updateMemberInfo", mvo);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		session.delete(namespace+".deleteMember", id);
	}

	@Override
	public void updateGrade(MemberVO mvo) throws Exception {
		session.update(namespace+".updateGrade", mvo);
	}

	@Override
	public MemberVO checkMemberInfo(MemberVO mvo) throws Exception {
		return session.selectOne(namespace+".memberInfo", mvo);
	}

	@Override
	public List<MemberVO> listmembers() throws Exception {
		return session.selectList(namespace+".listMembers");
	}
	
}
