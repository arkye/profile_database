package br.unb.itrac.service;

import java.util.List;

import javax.transaction.Transactional;

import br.unb.itrac.dao.PersonDAO;
import br.unb.itrac.dao.PersonDAOImpl;
import br.unb.itrac.model.Person;

public class PersonServiceImpl implements PersonService {

	private PersonDAO personDAO;

	public void setPersonDAO(PersonDAOImpl personDAO) {
		this.personDAO = personDAO;
	}

	@Override
	@Transactional
	public void addPerson(Person person) {
		this.personDAO.addPerson(person);
	}

	@Override
	@Transactional
	public void updatePerson(Person person) {
		this.personDAO.updatePerson(person);
	}

	@Override
	@Transactional
	public List<Person> listPeople() {
		return this.personDAO.listPeople();
	}

	@Override
	@Transactional
	public Person getPersonById(int id) {
		return this.personDAO.getPersonById(id);
	}

	@Override
	@Transactional
	public void removePerson(int id) {
		this.personDAO.removePerson(id);
	}
}
