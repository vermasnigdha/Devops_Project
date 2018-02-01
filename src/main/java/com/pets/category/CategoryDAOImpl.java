package com.pets.category;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	public void insert(Category c) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(c);
	}

	public void update(Category c) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(c);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("delete from Category where id = :somevalue").setInteger("somevalue", id).executeUpdate();
	}

	public Category getCategory(int id) {
		// TODO Auto-generated method stub
		return (Category) sessionFactory.getCurrentSession().get(Category.class, id);
	}

	public List<Category> getCategory() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Category").list();
	}
	
}
