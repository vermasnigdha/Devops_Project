package com.pets.breed;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Breed {

	@Id @GeneratedValue( strategy = GenerationType.AUTO )
	private int id;
	private String name;
	private int average_weight;
	private String price;
	private int qty;
	
	@Transient
	private MultipartFile f;
	private String imagePath;
	
	public MultipartFile getF() {
		return f;
	}

	public void setF(MultipartFile f) {
		this.f = f;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAverage_weight() {
		return average_weight;
	}
	
	public void setAverage_weight(int average_weight) {
		this.average_weight = average_weight;
	}
	
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
	public Breed() {
		super();
	}
	
}
