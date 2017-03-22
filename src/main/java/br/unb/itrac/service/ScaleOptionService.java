package br.unb.itrac.service;

import java.util.List;

import br.unb.itrac.model.ScaleOption;

public interface ScaleOptionService {
	
	public void addScaleOption(ScaleOption scaleOption);
	public void updateScaleOption(ScaleOption scaleOption);
	public List<ScaleOption> listScaleOptions();
	public ScaleOption getScaleOptionById(int id);
	public void removeScaleOption(int id);
}

