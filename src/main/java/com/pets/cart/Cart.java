package com.pets.cart;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.pets.breed.Breed;

@Entity
public class Cart {

	Breed b = new Breed();
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private int pid;
	private String shippAdd;
	private String billAdd;
	private int qty;
	private String username;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getShippAdd() {
		return shippAdd;
	}
	public void setShippAdd(String shippAdd) {
		this.shippAdd = shippAdd;
	}
	public String getBillAdd() {
		return billAdd;
	}
	public void setBillAdd(String billAdd) {
		this.billAdd = billAdd;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Cart() {
		super();
	}
	
}
