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

import com.donkunny.board.NoticeBoardVO;
import com.donkunny.board.paging.Criteria;
import com.donkunny.board.paging.PageMaker;
import com.donkunny.board.service.NoticeBoardService;

@Controller
@RequestMapping("/nboard/*")
public class NoticeBoardController {

	@Inject
	NoticeBoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
/*	
	@RequestMapping(value="/listAll")
	public void listAll(Model model) throws Exception{
		model.addAttribute("list", service.listAll());
	}
*/	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		// logger.info(cri.toString());
		// logger.info(service.countPaging()+"");
		model.addAttribute("list", service.listPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPagination(service.countPaging());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("nno") int nno, @ModelAttribute("cri")Criteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		model.addAttribute(service.read(nno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modify(@RequestParam("nno") int nno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("modify get...");
		model.addAttribute(service.read(nno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(NoticeBoardVO nvo, Model model, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("modify post...");
		service.modify(nvo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		// model.addAttribute(service.read(nvo.getNno()));
		return "redirect:/nboard/listPage";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("nno")int nno, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("delete post...");
		service.delete(nno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/nboard/listPage";
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public void register(NoticeBoardVO nvo) throws Exception {
		logger.info("register get...");
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String registerPOST(NoticeBoardVO nvo) throws Exception{
		logger.info("register post...");
		service.write(nvo);
		return "redirect:/nboard/listAll";
	}
	
}
