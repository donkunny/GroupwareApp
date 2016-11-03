package com.donkunny.proposal.service;

import java.util.List;

import com.donkunny.board.paging.Criteria;
import com.donkunny.board.paging.SearchCriteria;
import com.donkunny.proposal.ProposalVO;

public interface ProposalService {
	public List<ProposalVO> listProposalPage(Criteria cri) throws Exception;
	public ProposalVO detailProposal(int pno) throws Exception;
	public void writeProposal(ProposalVO pvo) throws Exception;
	public void deleteProposal(int pno) throws Exception;
	public void modifyProposal(ProposalVO pvo) throws Exception;
	public int countPaging() throws Exception;
	public void submitProposal(ProposalVO pvo) throws Exception;
	public void submitProposalwithID(ProposalVO pvo) throws Exception;
	public void acceptOrReject(ProposalVO pvo) throws Exception;
	
	
	public List<ProposalVO> listByStatusAndID(Criteria cri) throws Exception;
	public int countByStatusAndID(SearchCriteria cri) throws Exception;
	public List<ProposalVO> listByStatus(Criteria cri) throws Exception;
	public int countByStatus(SearchCriteria cri) throws Exception;
	public List<ProposalVO> listByStatusAndAcceptor(Criteria cri) throws Exception;
	public int countByStatusAndAcceptor(SearchCriteria cri) throws Exception;
	public List<ProposalVO> listByID(Criteria cri) throws Exception;
	public int countByID(SearchCriteria cri) throws Exception;
	public List<ProposalVO> listNotByStatus(Criteria cri) throws Exception;
	public int countNotByStatus(SearchCriteria cri) throws Exception;
	
	// Searching function
	public List<ProposalVO>	searchProposal(SearchCriteria cri) throws Exception;
	public int proposalSearchCount(SearchCriteria cri) throws Exception;
}
