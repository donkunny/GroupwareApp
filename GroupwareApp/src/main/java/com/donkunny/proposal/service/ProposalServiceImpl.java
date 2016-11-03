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

	@Override
	public void submitProposal(ProposalVO pvo) throws Exception {
		dao.submitProposal(pvo);
	}

	@Override
	public List<ProposalVO> listByStatusAndID(Criteria cri) throws Exception {
		return dao.listByStatusAndID(cri);
	}

	@Override
	public void acceptOrReject(ProposalVO pvo) throws Exception {
		dao.acceptOrReject(pvo);
	}

	@Override
	public int countByStatusAndID(SearchCriteria cri) throws Exception {
		return dao.countByStatusAndID(cri);
	}

	@Override
	public List<ProposalVO> listByStatus(Criteria cri) throws Exception {
		return dao.listByStatus(cri);
	}

	@Override
	public int countByStatus(SearchCriteria cri) throws Exception {
		return dao.countByStatus(cri);
	}

	@Override
	public List<ProposalVO> listByStatusAndAcceptor(Criteria cri) throws Exception {
		return dao.listByStatusAndAcceptor(cri);
	}

	@Override
	public int countByStatusAndAcceptor(SearchCriteria cri) throws Exception {
		return dao.countByStatusAndAcceptor(cri);
	}

	@Override
	public List<ProposalVO> listByID(Criteria cri) throws Exception {
		return dao.listByID(cri);
	}

	@Override
	public int countByID(SearchCriteria cri) throws Exception {
		return dao.countByID(cri);
	}

	@Override
	public List<ProposalVO> listNotByStatus(Criteria cri) throws Exception {
		return dao.listNotByStatus(cri);
	}

	@Override
	public int countNotByStatus(SearchCriteria cri) throws Exception {
		return dao.countNotByStatus(cri);
	}

	@Override
	public void submitProposalwithID(ProposalVO pvo) throws Exception {
		dao.submitProposalwithID(pvo);
	}
}