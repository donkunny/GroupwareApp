package com.donkunny.control;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.donkunny.board.NoticeBoardVO;
import com.donkunny.board.service.NoticeBoardService;

@Controller
@RequestMapping("/nboard/*")
public class NoticeBoardController {

	@Inject
	NoticeBoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
	
	@RequestMapping(value="/listAll")
	public void listAll(Model model) throws Exception{
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("nno") int nno, Model model) throws Exception {
		model.addAttribute(service.read(nno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modify(int nno, Model model) throws Exception{
		logger.info("modify get...");
		model.addAttribute(service.read(nno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(NoticeBoardVO nvo, Model model) throws Exception {
		logger.info("modify post...");
		service.modify(nvo);
		// model.addAttribute(service.read(nvo.getNno()));
		logger.info(nvo.toString());
		return "redirect:/nboard/read?nno=" + nvo.getNno();
	}
	
}
