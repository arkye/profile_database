package br.unb.itrac;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.unb.itrac.model.Competency;
import br.unb.itrac.model.Person;
import br.unb.itrac.service.CompetencyService;
import br.unb.itrac.service.PersonService;

@Controller
public class PersonController {

	private PersonService personService;
	private CompetencyService competencyService;

	@Autowired(required = true)
	@Qualifier(value = "personService")
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	@Autowired(required = true)
	@Qualifier(value = "competencyService")
	public void setCompetencyService(CompetencyService competencyService) {
		this.competencyService = competencyService;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Competency.class, "competency", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				Competency competency = competencyService.getCompetencyById(Integer.parseInt(text));
				setValue(competency);
			}
		});
	}

	@RequestMapping(value = "/people", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("competencies", this.competencyService.listCompetencies());
		model.addAttribute("people", this.personService.listPeople());
		return "people";
	}

	@RequestMapping(value = "/people/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person person) {
		if (person.getId() == 0) {
			this.personService.addPerson(person);
		} else {
			this.personService.updatePerson(person);
		}
		return "redirect:/people";
	}

	@RequestMapping("/people/remove/{id}")
	public String removePerson(@PathVariable("id") int id) {
		this.personService.removePerson(id);
		return "redirect:/people";
	}

	@RequestMapping("/people/edit/{id}")
	public String editPerson(@PathVariable("id") int id, Model model) {
		model.addAttribute("person", personService.getPersonById(id));
		model.addAttribute("competencies", this.competencyService.listCompetencies());
		model.addAttribute("people", this.personService.listPeople());
		return "people";
	}
}
