package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.unb.itrac.model.CompetencyScale;

public class CompetencyScaleDAOImpl implements CompetencyScaleDAO {

	private static final Logger logger = LoggerFactory.getLogger(CompetencyScaleDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addCompetencyScale(CompetencyScale competencyScale) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(competencyScale);
		logger.info("CompetencyScale saved successfully, CompetencyScale Details=" + competencyScale);
	}

	@Override
	public void updateCompetencyScale(CompetencyScale competencyScale) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(competencyScale);
		logger.info("CompetencyScale updated successfully, CompetencyScale Details=" + competencyScale);
	}

	@Override
	public List<CompetencyScale> listCompetencyScales() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<CompetencyScale> competencyScales = session.createQuery("from CompetencyScale").list();
		for (CompetencyScale competencyScale : competencyScales) {
			logger.info("ComptencyScale List::" + competencyScale);
		}
		return competencyScales;
	}

	@Override
	public CompetencyScale getCompetencyScaleById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		CompetencyScale competencyScale = (CompetencyScale) session.load(CompetencyScale.class, new Integer(id));
		logger.info("CompetencyScale loaded successfully, CompetencyScale details=" + competencyScale);
		return competencyScale;
	}

	@Override
	public void removeCompetencyScale(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		CompetencyScale competencyScale = (CompetencyScale) session.load(CompetencyScale.class, new Integer(id));
		if (competencyScale != null) {
			session.remove(competencyScale);
			logger.info("CompetencyScale removed successfully, CompetencyScale details=" + competencyScale);
		}
	}
}
