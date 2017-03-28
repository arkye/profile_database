package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.CompetencyDAO;
import br.unb.itrac.dao.CompetencyDAOImpl;
import br.unb.itrac.model.Competency;

public class CompetencyServiceImpl implements CompetencyService {

	private CompetencyDAO competencyDAO;

	public void setCompetencyDAO(CompetencyDAOImpl competencyDAO) {
		this.competencyDAO = competencyDAO;
	}

	@Override
	@Transactional
	public void addCompetency(Competency competency) {
		this.competencyDAO.addCompetency(competency);
	}

	@Override
	@Transactional
	public void updateCompetency(Competency competency) {
		this.competencyDAO.updateCompetency(competency);
	}

	@Override
	@Transactional
	public List<Competency> listCompetencies() {
		return this.competencyDAO.listCompetencies();
	}
	
	@Override
	@Transactional
	public List<Competency> listCompetenciesWithoutContract() {
		return this.competencyDAO.listCompetenciesWithoutContract();
	}

	@Override
	@Transactional
	public Competency getCompetencyById(int id) {
		return this.competencyDAO.getCompetencyById(id);
	}

	@Override
	@Transactional
	public void removeCompetency(int id) {
		this.competencyDAO.removeCompetency(id);
	}
}
