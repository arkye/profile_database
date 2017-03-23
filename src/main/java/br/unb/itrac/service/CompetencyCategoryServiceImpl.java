package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.CompetencyCategoryDAO;
import br.unb.itrac.dao.CompetencyCategoryDAOImpl;
import br.unb.itrac.model.CompetencyCategory;

public class CompetencyCategoryServiceImpl implements CompetencyCategoryService {

	private CompetencyCategoryDAO competencyCategoryDAO;

	public void setCompetencyCategoryDAO(CompetencyCategoryDAOImpl competencyCategoryDAO) {
		this.competencyCategoryDAO = competencyCategoryDAO;
	}

	@Override
	@Transactional
	public void addCompetencyCategory(CompetencyCategory competencyCategory) {
		this.competencyCategoryDAO.addCompetencyCategory(competencyCategory);
	}

	@Override
	@Transactional
	public void updateCompetencyCategory(CompetencyCategory competencyCategory) {
		this.competencyCategoryDAO.updateCompetencyCategory(competencyCategory);
	}

	@Override
	@Transactional
	public List<CompetencyCategory> listCompetencyCategories() {
		return this.competencyCategoryDAO.listCompetencyCategories();
	}

	@Override
	@Transactional
	public CompetencyCategory getCompetencyCategoryById(int id) {
		return this.competencyCategoryDAO.getCompetencyCategoryById(id);
	}

	@Override
	@Transactional
	public void removeCompetencyCategory(int id) {
		this.competencyCategoryDAO.removeCompetencyCategory(id);
	}
}
