package com.pets.breed;

import java.util.List;

public interface BreedDAO {

	void insert( Breed b );
	void update( Breed b );
	void delete( int bid );

	Breed getBreed(int bid);
	List<Breed> getBreed();
}
