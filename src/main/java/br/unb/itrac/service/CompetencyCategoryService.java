package br.unb.itrac.service;

import java.util.List;

import br.unb.itrac.model.CompetencyCategory;

public interface CompetencyCategoryService {

	public void addCompetencyCategory(CompetencyCategory competencyCategory);

	public void updateCompetencyCategory(CompetencyCategory competencyCategory);

	public List<CompetencyCategory> listCompetencyCategories();

	public CompetencyCategory getCompetencyCategoryById(int id);

	public void removeCompetencyCategory(int id);
}
