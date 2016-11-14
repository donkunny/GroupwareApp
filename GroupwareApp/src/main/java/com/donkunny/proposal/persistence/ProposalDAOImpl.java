package com.donkunny.proposal.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.donkunny.board.paging.Criteria;
import com.donkunny.board.paging.SearchCriteria;
import com.donkunny.proposal.ProposalVO;

@Repository
public class ProposalDAOImpl implements ProposalDAO{

	@Inject
	SqlSession session;
	
	private static String namespace ="com.donkunny.mapper.proposalMapper";
	
	@Override
	public List<ProposalVO> listProposalPage(Criteria cri) throws Exception {
		// return session.selectList(namespace+".proposal_list", cri);
		return session.selectList(namespace+".searchProposal", cri);
	}

	@Override
	public ProposalVO detailProposal(int pno) throws Exception {
		return session.selectOne(namespace+".proposal_detail_list", pno);
	}

	@Override
	public void writeProposal(ProposalVO pvo) throws Exception {
		session.insert(namespace+".writeProposal", pvo);
	}

	@Override
	public void deleteProposal(int pno) throws Exception {
		session.delete(namespace+".deleteProposal", pno);
	}

	@Override
	public void modifyProposal(ProposalVO pvo) throws Exception {
		session.update(namespace+".updateProposal", pvo);
	}

	@Override
	public List<ProposalVO> searchProposal(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".searchProposal", cri);
	}

	@Override
	public int proposalSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".search_proposalCount");
	}

	@Override
	public int countPaging() throws Exception {
		return session.selectOne(namespace+".countPaging");
	}

	@Override
	public void submitProposal(ProposalVO pvo) throws Exception {
		session.update(namespace+".submitProposal", pvo);
	}

	@Override
	public List<ProposalVO> listByStatusAndID(Criteria cri) throws Exception {
		return session.selectList(namespace+".listByStatusAndID", cri);
	}

	@Override
	public void acceptOrReject(ProposalVO pvo) throws Exception {
		session.update(namespace + ".acceptOrReject", pvo);
	}

	@Override
	public int countByStatusAndID(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".countByStatusAndID",cri);
	}

	@Override
	public List<ProposalVO> listByStatus(Criteria cri) throws Exception {
		return session.selectList(namespace+".listByStatus", cri);
	}

	@Override
	public int countByStatus(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".countByStatus", cri);
	}

	@Override
	public List<ProposalVO> listByStatusAndAcceptor(Criteria cri) throws Exception {
		return session.selectList(namespace+".listByStatusAndAcceptor", cri);
	}

	@Override
	public int countByStatusAndAcceptor(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".countByStatusAndAcceptor", cri);
	}

	@Override
	public List<ProposalVO> listByID(Criteria cri) throws Exception {
		return session.selectList(namespace+".listByID", cri);
	}

	@Override
	public int countByID(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".countByID", cri);
	}

	@Override
	public List<ProposalVO> listNotByStatus(Criteria cri) throws Exception {
		return session.selectList(namespace+".listNotByStatus", cri);
	}

	@Override
	public int countNotByStatus(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".countNotByStatus", cri);
	}

	@Override
	public void submitProposalwithID(ProposalVO pvo) throws Exception {
		session.update(namespace+".submitProposalwithID", pvo);
	}
}