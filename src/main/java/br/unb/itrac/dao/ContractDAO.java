package br.unb.itrac.dao;

import java.util.List;

import br.unb.itrac.model.Contract;

public interface ContractDAO {

	public void addContract(Contract contract);

	public void updateContract(Contract contract);

	public List<Contract> listContracts();

	public Contract getContractById(int id);

	public void removeContract(int id);
}
