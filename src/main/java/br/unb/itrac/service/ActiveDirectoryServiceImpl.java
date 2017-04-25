package br.unb.itrac.service;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

import br.unb.itrac.model.User;

public class ActiveDirectoryServiceImpl implements ActiveDirectoryService {

	private final String DOMAIN_NAME;
	private final String SERVER_NAME;
	private final String[] USER_ATTRIBUTES;

	public ActiveDirectoryServiceImpl() {
		DOMAIN_NAME = "mc.intranet";
		SERVER_NAME = "";
		String[] userAttributes = { "a", "b" };
		USER_ATTRIBUTES = userAttributes;
	}

	@Override
	public LdapContext getConnection(String username, String password) throws NamingException {

		LdapContext context = null;
		try {
			context = new InitialLdapContext(bindData(username, password), null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return context;
	}

	private Hashtable<String, String> bindData(String username, String password) {
		Hashtable<String, String> props = new Hashtable<>();

		props.put(Context.SECURITY_PRINCIPAL, getPrincipalName(username));
		props.put(Context.SECURITY_CREDENTIALS, password);

		String ldapURL = "ldap://" + SERVER_NAME + "." + DOMAIN_NAME + "/";
		props.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		props.put(Context.PROVIDER_URL, ldapURL);

		return props;
	}

	@Override
	public User getUser(String username, LdapContext context) {

		SearchControls controls = new SearchControls();
		controls.setSearchScope(SearchControls.SUBTREE_SCOPE);
		controls.setReturningAttributes(USER_ATTRIBUTES);

		User user = null;
		try {
			NamingEnumeration<SearchResult> answer = context.search(getDomainNameDC(), getUserQuery(username),
					controls);
			if (answer.hasMore()) {
				Attributes attributes = answer.next().getAttributes();
				user = new User(attributes);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		}

		return user;
	}

	private String getUserQuery(String username) {
		return "(& (userPrincipalName=" + getPrincipalName(username) + ")(objectClass=user))";
	}

	private String getDomainNameDC() {
		StringBuilder buffer = new StringBuilder();
		for(String token : DOMAIN_NAME.split("\\.")) {
			if(token.length() != 0) {
				if(token.length() > 0) {
					buffer.append(",");
				}
				buffer.append("DC=").append(token);
			}
		}
		return buffer.toString();
	}

	private String getPrincipalName(String username) {
		return username + "@" + DOMAIN_NAME;
	}

}
