package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import br.unb.itrac.model.ScaleOption;

@Repository
public class ScaleOptionDAOImpl implements ScaleOptionDAO {

	private static final Logger logger = LoggerFactory.getLogger(ScaleOptionDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addScaleOption(ScaleOption scaleOption) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(scaleOption);
		logger.info("[ScaleOption][ADD]:" + scaleOption);
	}

	@Override
	public void updateScaleOption(ScaleOption scaleOption) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(scaleOption);
		logger.info("[ScaleOption][UPDATE]:" + scaleOption);
	}

	@Override
	public List<ScaleOption> listScaleOptions() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<ScaleOption> scaleOptions = session.createQuery("from ScaleOption").list();
		for (ScaleOption scaleOption : scaleOptions) {
			logger.info("[ScaleOption][LIST]:" + scaleOption);
		}
		return scaleOptions;
	}

	@Override
	public ScaleOption getScaleOptionById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ScaleOption scaleOption = (ScaleOption) session.load(ScaleOption.class, new Integer(id));
		logger.info("[ScaleOption][GET_BY_ID]:" + scaleOption);
		return scaleOption;
	}

	@Override
	public void removeScaleOption(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ScaleOption scaleOption = (ScaleOption) session.load(ScaleOption.class, new Integer(id));
		if (scaleOption != null) {
			session.remove(scaleOption);
			logger.info("[ScaleOption][REMOVE]:" + scaleOption);
		}
	}
}
