package br.unb.itrac.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Person {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String firstName;

	private String lastName;

	private String position;

	private String company;

	private String phoneNumber;

	private String email;

	private String resumeLink;

	@ManyToMany(cascade = CascadeType.REFRESH)
	private List<Competency> competencies;

	@ManyToMany(cascade = CascadeType.REFRESH)
	private List<ScaleOption> scaleOptions;

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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getResumeLink() {
		return resumeLink;
	}

	public void setResumeLink(String resumeLink) {
		this.resumeLink = resumeLink;
	}

	public List<Competency> getCompetencies() {
		return competencies;
	}

	public void setCompetencies(List<Competency> competencies) {
		this.competencies = competencies;
	}

	public List<ScaleOption> getScaleOptions() {
		return scaleOptions;
	}

	public void setScaleOptions(List<ScaleOption> scaleOptions) {
		this.scaleOptions = scaleOptions;
	}

	@Override
	public String toString() {
		String toString = "(" + id + ") - " + firstName + " " + lastName + " (" + email + ")";
		if (competencies != null && !competencies.isEmpty()) {
			toString += " with Competencies: ";
			for (Competency competency : competencies) {
				toString += " " + competency.getName();
			}
		}
		return toString;
	}
}
