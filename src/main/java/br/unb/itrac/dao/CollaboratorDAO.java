package br.unb.itrac.dao;

import java.util.List;

import br.unb.itrac.model.Collaborator;

public interface CollaboratorDAO {

	public void addCollaborator(Collaborator collaborator);

	public void updateCollaborator(Collaborator collaborator);

	public List<Collaborator> listCollaborators();

	public Collaborator getCollaboratorById(int id) throws Exception;

	public void removeCollaborator(int id);
}
