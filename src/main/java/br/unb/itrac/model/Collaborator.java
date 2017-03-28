package br.unb.itrac.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class Collaborator {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String firstName;

	private String lastName;

	@OneToOne(cascade=CascadeType.REMOVE)
	private Document resume;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Document getResume() {
		return resume;
	}

	public void setResume(Document resume) {
		this.resume = resume;
	}

	@Override
	public String toString() {
		return "(" + id + ") - " + firstName + " " + lastName;
	}
}
