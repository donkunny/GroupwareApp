package com.donkunny.control;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.donkunny.proposal.service.ProposalService;

@Controller
@RequestMapping("/proposal/*")
public class ProposalController {

	@Inject
	ProposalService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void listMainProposal(Model model) throws Exception{
		// model.addAttribute(arg0, arg1)
	}

}
