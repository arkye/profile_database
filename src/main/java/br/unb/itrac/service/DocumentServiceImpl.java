package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.DocumentDAO;
import br.unb.itrac.dao.DocumentDAOImpl;
import br.unb.itrac.model.Document;

public class DocumentServiceImpl implements DocumentService {
	
	private DocumentDAO documentDAO;

	public void setDocumentDAO(DocumentDAOImpl documentDAO) {
		this.documentDAO = documentDAO;
	}

	@Override
	@Transactional
	public void addDocument(Document document) {
		this.documentDAO.addDocument(document);
	}

	@Override
	@Transactional
	public void updateDocument(Document document) {
		this.documentDAO.updateDocument(document);
	}

	@Override
	@Transactional
	public List<Document> listDocuments() {
		return this.documentDAO.listDocuments();
	}

	@Override
	@Transactional
	public Document getDocumentById(int id) {
		return this.documentDAO.getDocumentById(id);
	}

	@Override
	@Transactional
	public void removeDocument(int id) {
		this.documentDAO.removeDocument(id);
	}
}
