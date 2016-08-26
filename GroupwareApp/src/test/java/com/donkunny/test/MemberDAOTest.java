package com.donkunny.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.donkunny.member.MemberVO;
import com.donkunny.member.TempMemberVO;
import com.donkunny.member.login.LoginDTO;
import com.donkunny.member.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDAOTest {

	@Inject
	private MemberDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);
	
//	@Test
	public void testRegister() throws Exception {
		TempMemberVO temp = new TempMemberVO();
		temp.setT_id("testuser3");
		temp.setT_pwd("testpwd3");
		temp.setT_name("testname3");
		temp.setT_email("test3@gmail.com");
		temp.setT_tel("01012121214");
		temp.setT_birth("1990-01-03");
		dao.register(temp);
		
		logger.info(dao.toString());
	}
	
	// 화면에 id와 pwd를 등록했을 때 값을 정확히 찾아오는지 확인하는 테스트
	//	@Test
	public void testLoginConfirm() throws Exception {
		LoginDTO dto = new LoginDTO();
		dto.setId("admin");
		dto.setPwd("admin");
		
		logger.info(dao.confirmLogin(dto).toString());
	}
	
	// 관리자가 회원가입 승인 요청 확인하는 테스트
	// @Test
	public void testMemberConfirm() throws Exception {
		dao.confirmMember(1);
		dao.deleteWaitingMember(1);
	}
	
	// 회원 정보 수정 확인하는 테스트
	// @Test
	public void testUPdateMemberInfo() throws Exception {
		MemberVO member = new MemberVO();
		member.setMno(2);
		member.setId("edited");
		member.setPwd("edited");
		member.setName("edited");
		member.setBirth("1990-01-31");
		member.setEmail("edited@gmail.com");
		//member.setTel("01012345678");
		
		dao.updateMemberInfo(member);
	}
	
	//회원 탈퇴 확인하는 테스트
	// @Test
	public void testDeleteUpdate() throws Exception {
		dao.deleteMember(2);
	}
	
	// 회원 등급 변경하는 테스트
	// @Test
	public void testUpdateGrade() throws Exception {
		MemberVO member = new MemberVO();
		member.setMno(1);
		member.setGrade(1);
		dao.updateGrade(member);
	}
}
