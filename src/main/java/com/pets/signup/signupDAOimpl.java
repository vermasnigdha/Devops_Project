package com.pets.signup;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class signupDAOimpl implements signupDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	public void insert(signup s) {
		
		sessionFactory.getCurrentSession().save(s);
		
	}

	public void update(signup s) {
		// TODO Auto-generated method stub
		
	}

	public void delete(int sid) {
		// TODO Auto-generated method stub
		
	}

	public signup getsignup(int sid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<signup> getsignup() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
