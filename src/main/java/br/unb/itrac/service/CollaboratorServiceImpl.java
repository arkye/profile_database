package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.CollaboratorDAO;
import br.unb.itrac.dao.CollaboratorDAOImpl;
import br.unb.itrac.model.Collaborator;

public class CollaboratorServiceImpl implements CollaboratorService {

	private CollaboratorDAO collaboratorDAO;

	public void setCollaboratorDAO(CollaboratorDAOImpl collaboratorDAO) {
		this.collaboratorDAO = collaboratorDAO;
	}

	@Override
	@Transactional
	public void addCollaborator(Collaborator collaborator) {
		this.collaboratorDAO.addCollaborator(collaborator);
	}

	@Override
	@Transactional
	public void updateCollaborator(Collaborator collaborator) {
		this.collaboratorDAO.updateCollaborator(collaborator);
	}

	@Override
	@Transactional
	public List<Collaborator> listCollaborators() {
		return this.collaboratorDAO.listCollaborators();
	}

	@Override
	@Transactional
	public Collaborator getCollaboratorById(int id) {
		return this.collaboratorDAO.getCollaboratorById(id);
	}

	@Override
	@Transactional
	public void removeCollaborator(int id) {
		this.collaboratorDAO.removeCollaborator(id);
	}
}
