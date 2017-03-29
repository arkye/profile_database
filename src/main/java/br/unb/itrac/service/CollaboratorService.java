package br.unb.itrac.service;

import java.util.List;

import br.unb.itrac.model.Collaborator;
import br.unb.itrac.model.Profile;

public interface CollaboratorService {

	public void addCollaborator(Collaborator collaborator);

	public void updateCollaborator(Collaborator collaborator);

	public List<Collaborator> listCollaborators();
	
	public List<Collaborator> listCollaboratorsWithoutThisProfile(Profile profile);

	public Collaborator getCollaboratorById(int id);

	public void removeCollaborator(int id);
}
