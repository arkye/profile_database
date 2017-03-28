package br.unb.itrac.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class CompetencyScale {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@ManyToMany(cascade=CascadeType.REFRESH, fetch=FetchType.EAGER)
	private List<ScaleOption> scaleOptions;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<ScaleOption> getScaleOptions() {
		return scaleOptions;
	}

	public void setScaleOptions(List<ScaleOption> scaleOptions) {
		this.scaleOptions = scaleOptions;
	}

	@Override
	public String toString() {
		String toString = "(" + id + ") - " + name + ": " + description;
		if (scaleOptions != null && !scaleOptions.isEmpty()) {
			toString += " with ScaleOptions:";
			for (ScaleOption scaleOption : scaleOptions) {
				toString += " " + scaleOption.toString();
			}
		}
		return toString;
	}
}
