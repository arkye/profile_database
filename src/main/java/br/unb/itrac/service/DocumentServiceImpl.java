package br.unb.itrac.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
	public Document addDocument(String name, CommonsMultipartFile file) {
		Document document = new Document();
		document.setName(name);
		document.setFileName(file.getOriginalFilename());
		document.setFile(file.getBytes());
		this.documentDAO.addDocument(document);
		return document;
	}

	@Override
	@Transactional
	public Document updateDocument(int id, String name, CommonsMultipartFile file) {
		Document document = getDocumentById(id);
		document.setName(name);
		if (!file.isEmpty()) {
			document.setFileName(file.getOriginalFilename());
			document.setFile(file.getBytes());
		}
		this.documentDAO.updateDocument(document);
		return document;
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

	@Override
	@Transactional
	public void serveDocument(int id, HttpServletResponse response) throws Exception {
		Document document = getDocumentById(id);
		byte[] file = document.getFile();
		if(file.length > 0) {
			response.setContentLength(file.length);
			response.getOutputStream().write(file);
		} else {
			throw new Exception("O documento não existe.");
		}
		
	}
}
