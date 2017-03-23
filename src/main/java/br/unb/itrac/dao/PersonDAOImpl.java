package br.unb.itrac.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.unb.itrac.model.Person;

public class PersonDAOImpl implements PersonDAO {

	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addPerson(Person person) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(person);
		logger.info("[Person][ADD]:" + person);
	}

	@Override
	public void updatePerson(Person person) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(person);
		logger.info("[Person][UPDATE]:" + person);
	}

	@Override
	public List<Person> listPeople() {
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Person> people = session.createQuery("from Person").list();
		for (Person person : people) {
			logger.info("[Person][LIST]:" + person);
		}
		return people;
	}

	@Override
	public Person getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person person = (Person) session.load(Person.class, new Integer(id));
		logger.info("[Person][GET_BY_ID]:" + person);
		return person;
	}

	@Override
	public void removePerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person person = (Person) session.load(Person.class, new Integer(id));
		if (person != null) {
			session.remove(person);
			logger.info("[Person][REMOVE]:" + person);
		}
	}
}
