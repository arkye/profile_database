package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.ContractDAO;
import br.unb.itrac.dao.ContractDAOImpl;
import br.unb.itrac.model.Contract;

public class ContractServiceImpl implements ContractService {

	private ContractDAO contractDAO;

	public void setContractDAO(ContractDAOImpl contractDAO) {
		this.contractDAO = contractDAO;
	}

	@Override
	@Transactional
	public void addContract(Contract contract) {
		this.contractDAO.addContract(contract);
	}

	@Override
	@Transactional
	public void updateContract(Contract contract) {
		this.contractDAO.updateContract(contract);
	}

	@Override
	@Transactional
	public List<Contract> listContracts() {
		return this.contractDAO.listContracts();
	}

	@Override
	@Transactional
	public Contract getContractById(int id) {
		return this.contractDAO.getContractById(id);
	}

	@Override
	@Transactional
	public void removeContract(int id) {
		this.contractDAO.removeContract(id);
	}
}
