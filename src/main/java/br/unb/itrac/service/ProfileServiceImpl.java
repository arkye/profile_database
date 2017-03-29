package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.ProfileDAO;
import br.unb.itrac.dao.ProfileDAOImpl;
import br.unb.itrac.model.Profile;

public class ProfileServiceImpl implements ProfileService {

	private ProfileDAO profileDAO;

	public void setProfileDAO(ProfileDAOImpl profileDAO) {
		this.profileDAO = profileDAO;
	}

	@Override
	@Transactional
	public void addProfile(Profile profile) {
		this.profileDAO.addProfile(profile);
	}

	@Override
	@Transactional
	public void updateProfile(Profile profile) {
		this.profileDAO.updateProfile(profile);
	}

	@Override
	@Transactional
	public List<Profile> listProfiles() {
		return this.profileDAO.listProfiles();
	}

	@Override
	@Transactional
	public Profile getProfileById(int id) {
		return this.profileDAO.getProfileById(id);
	}

	@Override
	@Transactional
	public void removeProfile(int id) {
		this.profileDAO.removeProfile(id);
	}
}
