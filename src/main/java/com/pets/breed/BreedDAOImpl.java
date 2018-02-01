package com.pets.breed;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class BreedDAOImpl implements BreedDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public void insert(Breed b) {
		sessionFactory.getCurrentSession().save(b);
	}

	public void update(Breed b) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(b);
	}

	public void delete(int bid) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("delete from Breed where id = :somevalue").setInteger("somevalue", bid).executeUpdate();
	}

	public Breed getBreed(int bid) {
		// TODO Auto-generated method stub
		return (Breed) sessionFactory.getCurrentSession().get(Breed.class, bid);
	}

	public List<Breed> getBreed() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Breed").list();
	}

}
