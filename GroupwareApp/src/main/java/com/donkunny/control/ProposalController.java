package com.donkunny.control;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.donkunny.board.paging.Criteria;
import com.donkunny.board.paging.PageMaker;
import com.donkunny.board.paging.SearchCriteria;
import com.donkunny.member.service.MemberService;
import com.donkunny.proposal.ProposalVO;
import com.donkunny.proposal.service.ProposalService;

@Controller
@RequestMapping("/proposal/*")
public class ProposalController {

	@Inject
	ProposalService service;

	@Inject
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void listMainProposal(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		logger.info("proposal main...");
		
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/registerProposal", method=RequestMethod.GET)
	public void registerProposal(ProposalVO pvo, Model model, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("proposal register get...");
		model.addAttribute("acceptors", memberService.listMembers());
	}
	
	@RequestMapping(value="registerProposalPOST", method=RequestMethod.POST)
	public String registerProposalPOST(ProposalVO pvo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("proposal register post..");
		if(pvo.getP_acceptor().equals(pvo.getP_writer())){
			rttr.addFlashAttribute("error", "기안자와 승인자가 같습니다.");
			return "redirect:/proposal/registerProposal";
		} else{
			service.writeProposal(pvo);
			rttr.addAttribute("page", 1);
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			return "redirect:/proposal/main";
		}
	}
	
	@RequestMapping(value="/readProposal", method=RequestMethod.GET)
	public void readProposal(@RequestParam("pno")int pno, @ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		model.addAttribute(service.detailProposal(pno));
	}
}
