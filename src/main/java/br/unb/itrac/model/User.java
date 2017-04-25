package br.unb.itrac.model;

import javax.naming.NamingException;
import javax.naming.directory.Attributes;

public class User {
	
	public User(Attributes attributes) throws NamingException {
		firstName = (String) attributes.get("firstName").get();
		lastName = (String) attributes.get("lastName").get();
		email = (String) attributes.get("email").get();
		displayName = (String) attributes.get("displayName").get();
	}
	
	private String firstName;
	
	private String lastName;
	
	private String email;
	
	private String displayName;

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public String getDisplayName() {
		return displayName;
	}
	
	
}
