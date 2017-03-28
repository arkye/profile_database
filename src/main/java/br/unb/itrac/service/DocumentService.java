package br.unb.itrac.service;

import java.util.List;

import br.unb.itrac.model.Document;

public interface DocumentService {
	
	public void addDocument(Document document);

	public void updateDocument(Document document);

	public List<Document> listDocuments();

	public Document getDocumentById(int id);

	public void removeDocument(int id);
}
