package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.ScaleOptionDAO;
import br.unb.itrac.dao.ScaleOptionDAOImpl;
import br.unb.itrac.model.ScaleOption;

public class ScaleOptionServiceImpl implements ScaleOptionService {

	private ScaleOptionDAO scaleOptionDAO;

	public void setScaleOptionDAO(ScaleOptionDAOImpl scaleOptionDAO) {
		this.scaleOptionDAO = scaleOptionDAO;
	}

	@Override
	@Transactional
	public void addScaleOption(ScaleOption scaleOption) {
		this.scaleOptionDAO.addScaleOption(scaleOption);
	}

	@Override
	@Transactional
	public void updateScaleOption(ScaleOption scaleOption) {
		this.scaleOptionDAO.updateScaleOption(scaleOption);
	}

	@Override
	@Transactional
	public List<ScaleOption> listScaleOptions() {
		return this.scaleOptionDAO.listScaleOptions();
	}

	@Override
	@Transactional
	public ScaleOption getScaleOptionById(int id) {
		return this.scaleOptionDAO.getScaleOptionById(id);
	}

	@Override
	@Transactional
	public void removeScaleOption(int id) {
		this.scaleOptionDAO.removeScaleOption(id);
	}
}
