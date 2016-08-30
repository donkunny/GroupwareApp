package com.donkunny.member.service;

import com.donkunny.member.MemberVO;
import com.donkunny.member.TempMemberVO;
import com.donkunny.member.login.LoginDTO;

public interface MemberService {
	public void register(TempMemberVO tvo) throws Exception;
	public MemberVO confirmLogin(LoginDTO dto) throws Exception;
	public void approveMember(int tno) throws Exception;
	public void updateMemberInfo(MemberVO mvo) throws Exception;
	public void deleteMember(int rno) throws Exception;
	public void updateGrade(MemberVO mvo) throws Exception;
	public void readTMember(int tno) throws Exception;
	public MemberVO checkMemberInfo(MemberVO mvo) throws Exception;
}
