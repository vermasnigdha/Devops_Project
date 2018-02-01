package com.pets.signup;

import java.util.List;

public interface signupDAO {

	void insert( signup s );
	void update( signup s );
	void delete( int sid );

	signup getsignup(int sid);
	List<signup> getsignup();
}
