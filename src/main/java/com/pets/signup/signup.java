package com.pets.signup;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class signup {
	@Id @GeneratedValue( strategy = GenerationType.AUTO )
	private int id;
	@NotNull (message="Name cannot be Null")
	@NotEmpty (message="Name cannot be Empty")
	private String name;
	@Pattern (regexp="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.['com','co.in','co']+$", message="Email is not in correct format (***@abc.com)")
	private String email;
	private String address;
	private String password;
	@Pattern (regexp="^[7-9]{1}[0-9]{9}$", message="Phone number format must be as that of an Indian mobile number")
	private String phone;
	
	private String role="ROLE_USER";
	
	private boolean active = true;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public signup() {
		super();
	}
	

}
