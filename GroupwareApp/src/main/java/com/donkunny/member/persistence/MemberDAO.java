package com.donkunny.member.persistence;

import com.donkunny.member.MemberVO;
import com.donkunny.member.TempMemberVO;
import com.donkunny.member.login.LoginDTO;

public interface MemberDAO {
	public void register(TempMemberVO vo) throws Exception;
	public MemberVO confirmLogin(LoginDTO dto) throws Exception;
	public void confirmMember(int tno) throws Exception;
	public void deleteWaitingMember(int tno) throws Exception;
	public void updateMemberInfo(MemberVO vo) throws Exception;
	public void deleteMember(int rno) throws Exception;
	public void updateGrade(MemberVO vo) throws Exception;
	public void readTMember(int tno) throws Exception;
}
