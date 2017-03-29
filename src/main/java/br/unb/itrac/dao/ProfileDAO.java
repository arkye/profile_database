package br.unb.itrac.dao;

import java.util.List;

import br.unb.itrac.model.Profile;

public interface ProfileDAO {

	public void addProfile(Profile profile);

	public void updateProfile(Profile profile);

	public List<Profile> listProfiles();

	public Profile getProfileById(int id);

	public void removeProfile(int id);
}
