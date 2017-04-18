package br.unb.itrac.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import br.unb.itrac.model.Document;

public interface DocumentService {
	
	public Document addDocument(String name, CommonsMultipartFile file);

	public Document updateDocument(int id, String name, CommonsMultipartFile file);
	
	public void serveDocument(int id, HttpServletResponse response) throws Exception;

	public List<Document> listDocuments();

	public Document getDocumentById(int id);

	public void removeDocument(int id);
}
