package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.unb.itrac.model.Collaborator;

public class CollaboratorDAOImpl implements CollaboratorDAO {

	private static final Logger logger = LoggerFactory.getLogger(CollaboratorDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addCollaborator(Collaborator collaborator) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(collaborator);
		logger.info("[Collaborator][ADD]:" + collaborator);
	}

	@Override
	public void updateCollaborator(Collaborator collaborator) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(collaborator);
		logger.info("[Collaborator][UPDATE]:" + collaborator);
	}

	@Override
	public List<Collaborator> listCollaborators() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Collaborator> people = session.createQuery("from Collaborator").list();
		for (Collaborator collaborator : people) {
			logger.info("[Collaborator][LIST]:" + collaborator);
		}
		return people;
	}

	@Override
	public Collaborator getCollaboratorById(int id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Collaborator collaborator = (Collaborator) session.load(Collaborator.class, new Integer(id));
		logger.info("[Collaborator][GET_BY_ID]:" + collaborator);
		return collaborator;
	}

	@Override
	public void removeCollaborator(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Collaborator collaborator = (Collaborator) session.load(Collaborator.class, new Integer(id));
		if (collaborator != null) {
			session.remove(collaborator);
			logger.info("[Collaborator][REMOVE]:" + collaborator);
		}
	}
}
