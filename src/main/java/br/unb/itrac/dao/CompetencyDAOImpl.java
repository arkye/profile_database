package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.unb.itrac.model.Competency;

public class CompetencyDAOImpl implements CompetencyDAO {

	private static final Logger logger = LoggerFactory.getLogger(CompetencyDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addCompetency(Competency competency) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(competency);
		logger.info("[Competency][ADD]:" + competency);
	}

	@Override
	public void updateCompetency(Competency competency) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(competency);
		logger.info("[Competency][UPDATE]:" + competency);
	}

	@Override
	public List<Competency> listCompetencies() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Competency> competencies = session.createQuery("from Competency").list();
		for (Competency competency : competencies) {
			logger.info("[Competency][LIST]:" + competency);
		}
		return competencies;
	}

	@Override
	public Competency getCompetencyById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Competency competency = (Competency) session.load(Competency.class, new Integer(id));
		logger.info("[Competency][GET_BY_ID]:" + competency);
		return competency;
	}

	@Override
	public void removeCompetency(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Competency competency = (Competency) session.load(Competency.class, new Integer(id));
		if (competency != null) {
			session.remove(competency);
			logger.info("[Competency][REMOVE]:" + competency);
		}
	}
}
