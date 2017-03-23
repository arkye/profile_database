package br.unb.itrac.dao;

import java.util.List;

import br.unb.itrac.model.CompetencyCategory;

public interface CompetencyCategoryDAO {

	public void addCompetencyCategory(CompetencyCategory competencyCategory);

	public void updateCompetencyCategory(CompetencyCategory competencyCategory);

	public List<CompetencyCategory> listCompetencyCategories();

	public CompetencyCategory getCompetencyCategoryById(int id);

	public void removeCompetencyCategory(int id);
}
