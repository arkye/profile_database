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
import br.unb.itrac.model.CompetencyCategory;
import br.unb.itrac.service.CompetencyService;
import br.unb.itrac.service.CompetencyCategoryService;

@Controller
public class CompetencyController {

	private CompetencyService competencyService;
	private CompetencyCategoryService competencyCategoryService;

	@Autowired(required = true)
	@Qualifier(value = "competencyService")
	public void setCompetencyService(CompetencyService competencyService) {
		this.competencyService = competencyService;
	}

	@Autowired(required = true)
	@Qualifier(value = "competencyCategoryService")
	public void setCompetencyCategoryService(CompetencyCategoryService competencyCategoryService) {
		this.competencyCategoryService = competencyCategoryService;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(CompetencyCategory.class, "competencyCategory", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				CompetencyCategory competencyCategory = competencyCategoryService.getCompetencyCategoryById(Integer.parseInt(text));
				setValue(competencyCategory);
			}
		});
	}

	@RequestMapping(value = "/competencies", method = RequestMethod.GET)
	public String listCompetencies(Model model) {
		model.addAttribute("competency", new Competency());
		model.addAttribute("competencyCategories", this.competencyCategoryService.listCompetencyCategories());
		model.addAttribute("competencies", this.competencyService.listCompetencies());
		return "competencies";
	}

	@RequestMapping(value = "/competencies/add", method = RequestMethod.POST)
	public String addCompetency(@ModelAttribute("competency") Competency competency) {
		if (competency.getId() == 0) {
			this.competencyService.addCompetency(competency);
		} else {
			this.competencyService.updateCompetency(competency);
		}
		return "redirect:/competencies";
	}

	@RequestMapping("/competencies/remove/{id}")
	public String removeCompetency(@PathVariable("id") int id) {
		this.competencyService.removeCompetency(id);
		return "redirect:/competencies";
	}

	@RequestMapping("/competencies/edit/{id}")
	public String editCompetency(@PathVariable("id") int id, Model model) {
		model.addAttribute("competency", competencyService.getCompetencyById(id));
		model.addAttribute("competencyCategories", this.competencyCategoryService.listCompetencyCategories());
		model.addAttribute("competencies", this.competencyService.listCompetencies());
		return "competencies";
	}
}
