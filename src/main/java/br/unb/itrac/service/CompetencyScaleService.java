package br.unb.itrac.service;

import java.util.List;

import br.unb.itrac.model.CompetencyScale;

public interface CompetencyScaleService {

	public void addCompetencyScale(CompetencyScale competencyScale);

	public void updateCompetencyScale(CompetencyScale competencyScale);

	public List<CompetencyScale> listCompetencyScales();

	public CompetencyScale getCompetencyScaleById(int id);

	public void removeCompetencyScale(int id);
}
