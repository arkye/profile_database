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
		logger.info("ScaleOption saved successfully, Scale Option Details="+scaleOption);
	}

	@Override
	public void updateScaleOption(ScaleOption scaleOption) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(scaleOption);
		logger.info("ScaleOption updated successfully, Scale Option Details="+scaleOption);		
	}

	@Override
	public List<ScaleOption> listScaleOptions() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<ScaleOption> scaleOptions = session.createQuery("from ScaleOption").list();
		for(ScaleOption scaleOption : scaleOptions) {
			logger.info("Scale Option List::"+scaleOption);
		}
		return scaleOptions;
	}

	@Override
	public ScaleOption getScaleOptionById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ScaleOption scaleOption = (ScaleOption) session.load(ScaleOption.class, new Integer(id));
		logger.info("ScaleOption loaded successfully, ScaleOption details="+scaleOption);
		return scaleOption;
	}

	@Override
	public void removeScaleOption(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		ScaleOption scaleOption = (ScaleOption) session.load(ScaleOption.class, new Integer(id));
		if(null != scaleOption) {
			session.delete(scaleOption);
		}
		logger.info("ScaleOption deleted successfully, ScaleOption details="+scaleOption);
	}

}
