package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.unb.itrac.model.Contract;

public class ContractDAOImpl implements ContractDAO {

	private static final Logger logger = LoggerFactory.getLogger(ContractDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addContract(Contract contract) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(contract);
		logger.info("[Contract][ADD]:" + contract);
	}

	@Override
	public void updateContract(Contract contract) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(contract);
		logger.info("[Contract][UPDATE]:" + contract);
	}

	@Override
	public List<Contract> listContracts() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Contract> contracts = session.createQuery("from Contract").list();
		for (Contract contract : contracts) {
			logger.info("[Contract][LIST]:" + contract);
		}
		return contracts;
	}

	@Override
	public Contract getContractById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Contract contract = (Contract) session.load(Contract.class, new Integer(id));
		logger.info("[Contract][GET_BY_ID]:" + contract);
		return contract;
	}

	@Override
	public void removeContract(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Contract contract = (Contract) session.load(Contract.class, new Integer(id));
		if (contract != null) {
			session.remove(contract);
			logger.info("[Contract][REMOVE]:" + contract);
		}
	}
}
