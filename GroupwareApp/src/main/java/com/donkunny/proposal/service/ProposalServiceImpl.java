package com.donkunny.proposal.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.donkunny.board.paging.Criteria;
import com.donkunny.board.paging.SearchCriteria;
import com.donkunny.proposal.ProposalVO;
import com.donkunny.proposal.persistence.ProposalDAO;

@Service
public class ProposalServiceImpl implements ProposalService{

	@Inject
	ProposalDAO dao;
	
	@Override
	public List<ProposalVO> listProposalPage(Criteria cri) throws Exception {
		return dao.listProposalPage(cri);
	}

	@Override
	public ProposalVO detailProposal(int pno) throws Exception {
		return dao.detailProposal(pno);
	}

	@Override
	public void writeProposal(ProposalVO pvo) throws Exception {
		dao.writeProposal(pvo);	
	}

	@Override
	public void deleteProposal(int pno) throws Exception {
		dao.deleteProposal(pno);
	}

	@Override
	public void modifyProposal(ProposalVO pvo) throws Exception {
		dao.modifyProposal(pvo);
	}

	@Override
	public List<ProposalVO> searchProposal(SearchCriteria cri) throws Exception {
		return dao.searchProposal(cri);
	}

	@Override
	public int proposalSearchCount(SearchCriteria cri) throws Exception {
		return dao.proposalSearchCount(cri);
	}

	@Override
	public int countPaging() throws Exception {
		return dao.countPaging();
	}
}