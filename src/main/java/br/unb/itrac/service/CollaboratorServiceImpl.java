package br.unb.itrac.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.CollaboratorDAO;
import br.unb.itrac.dao.CollaboratorDAOImpl;
import br.unb.itrac.model.Collaborator;
import br.unb.itrac.model.Profile;

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
	public List<Collaborator> listCollaboratorsWithoutThisProfile(Profile profile) {
		List<Collaborator> collaborators = this.collaboratorDAO.listCollaborators();
		List<Collaborator> filteredCollaborators = new ArrayList<>();
		for(Collaborator collaborator : collaborators) {
			boolean hasProfile = false;
			for(Profile collaboratorProfile : collaborator.getProfiles()) {
				if(collaboratorProfile.getId() == profile.getId()) {
					hasProfile = true;
					break;
				}
			}
			if(!hasProfile) {
				filteredCollaborators.add(collaborator);
			}
		}
		return filteredCollaborators;
	}

	@Override
	@Transactional
	public Collaborator getCollaboratorById(int id) throws Exception{
		return this.collaboratorDAO.getCollaboratorById(id);
	}

	@Override
	@Transactional
	public void removeCollaborator(int id) {
		this.collaboratorDAO.removeCollaborator(id);
	}
}
