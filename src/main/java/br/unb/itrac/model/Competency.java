package br.unb.itrac.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Competency {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@ManyToOne(cascade=CascadeType.REFRESH)
	private CompetencyCategory competencyCategory;
	
	@ManyToMany(cascade=CascadeType.REFRESH)
	private List<Person> people;

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

	public CompetencyCategory getCompetencyCategory() {
		return competencyCategory;
	}

	public void setCompetencyCategory(CompetencyCategory competencyCategory) {
		this.competencyCategory = competencyCategory;
	}

	public List<Person> getPeople() {
		return people;
	}

	public void setPeople(List<Person> people) {
		this.people = people;
	}
	
	@Override
	public String toString() {
		String toString = "(" + id + ") - " + name + ": " + description;
		if(competencyCategory != null) {
			toString += " with CompetencyCategory: " + competencyCategory.getName();
		}
		if(people != null && !people.isEmpty()) {
			toString += " and People: ";
			for(Person person : people) {
				toString += " " + person.getFirstName() + " " + person.getLastName();
			}
		}
		return toString;
	}
}
