package br.unb.itrac.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;

@Entity
public class Profile {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Lob
	private String name;

	@Lob
	private String description;

	@Lob
	private String technicalQualifications;

	@OneToOne
	private Contract contract;

	@ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@OrderColumn
	private List<Competency> competencies;

	@ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@OrderColumn
	private List<Collaborator> collaborators;

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

	public String getTechnicalQualifications() {
		return technicalQualifications;
	}

	public void setTechnicalQualifications(String technicalKnowledge) {
		this.technicalQualifications = technicalKnowledge;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	public List<Competency> getCompetencies() {
		return competencies;
	}

	public void setCompetencies(List<Competency> competencies) {
		this.competencies = competencies;
	}

	public List<Collaborator> getCollaborators() {
		return collaborators;
	}

	public void setCollaborators(List<Collaborator> collaborators) {
		this.collaborators = collaborators;
	}

	@Override
	public String toString() {
		return "(" + id + ") - " + name;
	}
}
