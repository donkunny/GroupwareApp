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
	
	@RequestMapping(value="/registerProposalPOST", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/readProposalPOST", method=RequestMethod.POST)
	public String readProposalPOST(ProposalVO pvo, @ModelAttribute("cri")SearchCriteria cri) throws Exception{
		// logger.info(pvo.toString());
		service.submitProposal(pvo);
		return "redirect:/proposal/main";
	}
	
	@RequestMapping(value="/waitinglist", method=RequestMethod.GET)
	public void readWaitingList(@ModelAttribute("cri")SearchCriteria cri, ProposalVO pvo, Model model) throws Exception {
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/completedlist", method=RequestMethod.GET)
	public void readCompletedList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/pendinglist", method=RequestMethod.GET)
	public void readPendingList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/resubmit", method=RequestMethod.GET)
	public void resubmit(@RequestParam("pno")int pno, @ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.detailProposal(pno));
	}
	
	@RequestMapping(value="/resubmitPOST", method=RequestMethod.POST)
	public String resubmitPOST(ProposalVO pvo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		service.modifyProposal(pvo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/proposal/main";
	}
	
	@RequestMapping(value="/publicProposal", method=RequestMethod.GET)
	public void publicProposal(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/waitingApprovalList", method=RequestMethod.GET)
	public void listWaitingApprovalList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/acceptOrRejectProposal", method=RequestMethod.GET)
	public void acceptOrReject(@RequestParam("pno")int pno, @ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.detailProposal(pno));
	}
	
	@RequestMapping(value="/acceptOrRejectProposal", method=RequestMethod.POST)
	public String acceptOrRejectPOST(ProposalVO pvo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		service.acceptOrReject(pvo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/proposal/entireApprovalList";
	}
	
	@RequestMapping(value="/acceptedApprovalList", method=RequestMethod.GET)
	public void acceptedApprovalList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/acceptedPendingList", method=RequestMethod.GET)
	public void acceptedPendingList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/entireApprovalList", method=RequestMethod.GET)
	public void entireApprovalList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listProposalPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.proposalSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
}
