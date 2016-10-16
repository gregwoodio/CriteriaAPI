package ca.sheridancollege.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import ca.sheridancollege.beans.Person;

public class DAO {

	SessionFactory sessionFactory = new Configuration()
			.configure("ca/sheridancollege/config/hibernate.cfg.xml")
			.buildSessionFactory();
	
	public void saveOrUpdate(Person person) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
				
		session.saveOrUpdate(person);
		
		session.getTransaction().commit();
		session.close();
	}
	
//	public List<Person> getAllPeople() {
//		Session session = sessionFactory.openSession();
//		session.beginTransaction();
//		
//		Query query = session.getNamedQuery("Person.asList");
//		List<Person> people = (List<Person>) query.getResultList();
//		
//		session.getTransaction().commit();
//		session.close();
//		
//		return people;
//	}
//	
//	public List<String> getPhoneNumber(String first, String last) {
//		Session session = sessionFactory.openSession();
//		session.beginTransaction();
//		
//		Query query = session.getNamedQuery("Person.phoneNumber");
//		query.setParameter("first", first);
//		query.setParameter("last", last);
//		List<String> phoneNumber = (List<String>) query.getResultList();
//		
//		session.getTransaction().commit();
//		session.close();
//		
//		return phoneNumber;
//	}
	
	public List<Person> queryByCriteria() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Person> criteria = criteriaBuilder.createQuery(Person.class);
		Root<Person> root = criteria.from(Person.class);
		
		List<Person> people = session.createQuery(criteria).getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return people;
	}
	
	public List<Person> queryByNameCriteria(String name) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Person> criteria = criteriaBuilder.createQuery(Person.class);
		Root<Person> root = criteria.from(Person.class);

		criteria.where(
				criteriaBuilder.or(
						criteriaBuilder.and(
								criteriaBuilder.equal(root.get("firstName"), name),
								criteriaBuilder.equal(root.get("lastName"), "Smith")
								),
						criteriaBuilder.like(root.get("email"), "%.com")
						)
				);
		criteria.orderBy(criteriaBuilder.desc(root.get("email")));
		
		List<Person> studentList = session.createQuery(criteria).getResultList();
		
		session.getTransaction().commit();
		session.close();
		
		return studentList;
	}
}
