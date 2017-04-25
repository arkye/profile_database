package br.unb.itrac.service;

import javax.naming.NamingException;
import javax.naming.ldap.LdapContext;

import br.unb.itrac.model.User;

public interface ActiveDirectoryService {

	LdapContext getConnection(String username, String password) throws NamingException;
	
	User getUser(String username, LdapContext context);
}
