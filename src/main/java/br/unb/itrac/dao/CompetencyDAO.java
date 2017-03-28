package br.unb.itrac.dao;

import java.util.List;

import br.unb.itrac.model.Competency;

public interface CompetencyDAO {

	public void addCompetency(Competency competency);

	public void updateCompetency(Competency competency);

	public List<Competency> listCompetencies();
	
	public List<Competency> listCompetenciesWithoutContract();

	public Competency getCompetencyById(int id);

	public void removeCompetency(int id);
}
