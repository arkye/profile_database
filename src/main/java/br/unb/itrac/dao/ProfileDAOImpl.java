package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.unb.itrac.model.Profile;

public class ProfileDAOImpl implements ProfileDAO {

	private static final Logger logger = LoggerFactory.getLogger(ProfileDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addProfile(Profile profile) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(profile);
		logger.info("[Profile][ADD]:" + profile);
	}

	@Override
	public void updateProfile(Profile profile) {
		Session session = this.sessionFactory.getCurrentSession();
		logger.info("1-" + profile.getContract().getCompetencies().size());
		session.update(profile);
		logger.info("2-" + profile.getContract().getCompetencies().size());
		logger.info("[Profile][UPDATE]:" + profile);
	}

	@Override
	public List<Profile> listProfiles() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Profile> profiles = session.createQuery("from Profile").list();
		for (Profile profile : profiles) {
			logger.info("[Profile][LIST]:" + profile);
		}
		return profiles;
	}

	@Override
	public Profile getProfileById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Profile profile = (Profile) session.load(Profile.class, new Integer(id));
		logger.info("[Profile][GET_BY_ID]:" + profile);
		return profile;
	}

	@Override
	public void removeProfile(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Profile profile = (Profile) session.load(Profile.class, new Integer(id));
		if (profile != null) {
			session.remove(profile);
			logger.info("[Profile][REMOVE]:" + profile);
		}
	}
	
	
}
