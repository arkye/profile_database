package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.unb.itrac.model.CompetencyCategory;

public class CompetencyCategoryDAOImpl implements CompetencyCategoryDAO {

	private static final Logger logger = LoggerFactory.getLogger(CompetencyCategoryDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addCompetencyCategory(CompetencyCategory competencyCategory) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(competencyCategory);
		logger.info("[CompetencyCategory][ADD]:" + competencyCategory);
	}

	@Override
	public void updateCompetencyCategory(CompetencyCategory competencyCategory) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(competencyCategory);
		logger.info("[CompetencyCategory][UPDATE]:" + competencyCategory);
	}

	@Override
	public List<CompetencyCategory> listCompetencyCategories() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<CompetencyCategory> competencyCategories = session.createQuery("from CompetencyCategory").list();
		for (CompetencyCategory competencyCategory : competencyCategories) {
			logger.info("[CompetencyCategory][LIST]:" + competencyCategory);
		}
		return competencyCategories;
	}

	@Override
	public CompetencyCategory getCompetencyCategoryById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		CompetencyCategory competencyCategory = (CompetencyCategory) session.load(CompetencyCategory.class, new Integer(id));
		logger.info("[CompetencyCategory][GET_BY_ID]:" + competencyCategory);
		return competencyCategory;
	}

	@Override
	public void removeCompetencyCategory(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		CompetencyCategory competencyCategory = (CompetencyCategory) session.load(CompetencyCategory.class, new Integer(id));
		if (competencyCategory != null) {
			session.remove(competencyCategory);
			logger.info("[CompetencyCategory][REMOVE]:" + competencyCategory);
		}
	}
}
