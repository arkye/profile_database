package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.CompetencyScaleDAO;
import br.unb.itrac.dao.CompetencyScaleDAOImpl;
import br.unb.itrac.model.CompetencyScale;

public class CompetencyScaleServiceImpl implements CompetencyScaleService {

	private CompetencyScaleDAO competencyScaleDAO;

	public void setCompetencyScaleDAO(CompetencyScaleDAOImpl competencyScaleDAO) {
		this.competencyScaleDAO = competencyScaleDAO;
	}

	@Override
	@Transactional
	public void addCompetencyScale(CompetencyScale competencyScale) {
		this.competencyScaleDAO.addCompetencyScale(competencyScale);
	}

	@Override
	@Transactional
	public void updateCompetencyScale(CompetencyScale competencyScale) {
		this.competencyScaleDAO.updateCompetencyScale(competencyScale);
	}

	@Override
	@Transactional
	public List<CompetencyScale> listCompetencyScales() {
		return this.competencyScaleDAO.listCompetencyScales();
	}

	@Override
	@Transactional
	public CompetencyScale getCompetencyScaleById(int id) {
		return this.competencyScaleDAO.getCompetencyScaleById(id);
	}

	@Override
	@Transactional
	public void removeCompetencyScale(int id) {
		this.competencyScaleDAO.removeCompetencyScale(id);
	}
}
