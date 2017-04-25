package br.unb.itrac;

import javax.naming.ldap.LdapContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.unb.itrac.model.User;
import br.unb.itrac.service.ActiveDirectoryService;
import br.unb.itrac.service.ActiveDirectoryServiceImpl;

@Controller
public class SessionController {

	// MOCK USER 1 - Role: Common User
	// username = "user" password = "user"
	// MOCK USER 2 - Role: Administrator
	// username = "admin" password = "admin"

	@RequestMapping(value = "/sign_in/attempt", method = RequestMethod.POST)
	public String performLogin(HttpSession session, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		if (username.equals("user") && password.equals("user")) {
			session.setAttribute("role", "user");
			return "redirect:/";
		} else if (username.equals("admin") && password.equals("admin")) {
			session.setAttribute("role", "admin");
			return "redirect:/";
		}
		
		try {
			ActiveDirectoryService adService = new ActiveDirectoryServiceImpl();
			LdapContext context = adService.getConnection(username, password);
			User user = adService.getUser(username, context);
			System.out.println(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("role", null);
		return "/sign_in";
	}

	@RequestMapping(value = "/sign_in")
	public String showSignIn() {
		return "/sign_in";
	}

	@RequestMapping("/sign_out")
	public String performLogout(HttpSession session) {
		session.invalidate();
		return "/sign_in";
	}
}
