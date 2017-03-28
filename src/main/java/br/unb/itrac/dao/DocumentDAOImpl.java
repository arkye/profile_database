package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.unb.itrac.model.Document;

public class DocumentDAOImpl implements DocumentDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(DocumentDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addDocument(Document document) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(document);
		logger.info("[Document][ADD]:" + document);
	}

	@Override
	public void updateDocument(Document document) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(document);
		logger.info("[Document][UPDATE]:" + document);
	}

	@Override
	public List<Document> listDocuments() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Document> documents = session.createQuery("from Document").list();
		for (Document document : documents) {
			logger.info("[Document][LIST]:" + document);
		}
		return documents;
	}

	@Override
	public Document getDocumentById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Document document = (Document) session.load(Document.class, new Integer(id));
		logger.info("[Document][GET_BY_ID]:" + document);
		return document;
	}

	@Override
	public void removeDocument(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Document document = (Document) session.load(Document.class, new Integer(id));
		if (document != null) {
			session.remove(document);
			logger.info("[Document][REMOVE]:" + document);
		}
	}

}
