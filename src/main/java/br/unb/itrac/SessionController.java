package br.unb.itrac;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SessionController {
	
	// MOCK USER 1 - Role: Common User
	// username = "user" password = "user"
	// MOCK USER 2 - Role: Administrator
	// username = "admin" password = "admin"

	@RequestMapping(value = "/sign_in", method = RequestMethod.POST)
	public String performLogin(HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password) {
		if(username.equals("user") && password.equals("user")) {
			session.setAttribute("role", "user");
			return "redirect:/profiles";
		} else if(username.equals("admin") && password.equals("admin")) {
			session.setAttribute("role", "admin");
			return "redirect:/profiles";
		}
		session.setAttribute("role", null);
		return "redirect:/";
	}
	
	@RequestMapping("/sign_out")
	public String performLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
