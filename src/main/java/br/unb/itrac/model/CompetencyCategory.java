package br.unb.itrac.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class CompetencyCategory {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@ManyToOne(cascade=CascadeType.REFRESH, fetch=FetchType.EAGER)
	private CompetencyScale competencyScale;

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

	public CompetencyScale getCompetencyScale() {
		return competencyScale;
	}

	public void setCompetencyScale(CompetencyScale competencyScale) {
		this.competencyScale = competencyScale;
	}
	
	@Override
	public String toString() {
		String toString = "(" + id + ") - " + name + ": " + description;
		if(competencyScale != null) {
			toString += " with CompetencyScale: " + competencyScale.getName();
		}
		return toString;
	}
}
