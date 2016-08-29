package com.donkunny.control;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.donkunny.board.service.NoticeBoardService;

@Controller
@RequestMapping("/nboard/*")
public class NoticeBoardController {

	@Inject
	NoticeBoardService service;
	
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
		model.addAttribute(service.read(nno));
	}
	
}
