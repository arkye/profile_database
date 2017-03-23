package br.unb.itrac.dao;

import java.util.List;

import br.unb.itrac.model.CompetencyScale;

public interface CompetencyScaleDAO {

	public void addCompetencyScale(CompetencyScale competencyScale);

	public void updateCompetencyScale(CompetencyScale competencyScale);

	public List<CompetencyScale> listCompetencyScales();

	public CompetencyScale getCompetencyScaleById(int id);

	public void removeCompetencyScale(int id);
}
