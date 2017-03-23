package br.unb.itrac.dao;

import java.util.List;

import br.unb.itrac.model.Person;

public interface PersonDAO {

	public void addPerson(Person person);

	public void updatePerson(Person person);

	public List<Person> listPeople();

	public Person getPersonById(int id);

	public void removePerson(int id);
}
