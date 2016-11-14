package com.donkunny.member.persistence;

import java.util.List;

import com.donkunny.member.MemberVO;
import com.donkunny.member.TempMemberVO;
import com.donkunny.member.login.LoginDTO;

public interface MemberDAO {
	public void register(MemberVO vo) throws Exception;
	public MemberVO confirmLogin(LoginDTO dto) throws Exception;
	public void confirmMember(String id) throws Exception;
	public void deleteWaitingMember(String t_id) throws Exception;
	public void updateMemberInfo(MemberVO vo) throws Exception;
	public void deleteMember(String id) throws Exception;
	public void updateGrade(MemberVO vo) throws Exception;
	public MemberVO checkMemberInfo(MemberVO vo) throws Exception;
	public List<MemberVO> listmembers() throws Exception;
}
