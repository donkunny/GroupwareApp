package com.donkunny.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.donkunny.member.MemberVO;
import com.donkunny.member.TempMemberVO;
import com.donkunny.member.login.LoginDTO;
import com.donkunny.member.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public MemberVO confirmLogin(LoginDTO dto) throws Exception {
		return dao.confirmLogin(dto);
	}

	@Override
	public void approveMember(String t_id) throws Exception {
		dao.confirmMember(t_id);
		dao.deleteWaitingMember(t_id);
	}

	@Override
	public void updateMemberInfo(MemberVO mvo) throws Exception {
		dao.updateMemberInfo(mvo);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		dao.deleteMember(id);
	}

	@Override
	public void updateGrade(MemberVO mvo) throws Exception {
		dao.updateGrade(mvo);
	}

	@Override
	public MemberVO checkMemberInfo(MemberVO mvo) throws Exception {
		return dao.checkMemberInfo(mvo);
	}

	@Override
	public List<MemberVO> listMembers() throws Exception {
		return dao.listmembers();
	}
}