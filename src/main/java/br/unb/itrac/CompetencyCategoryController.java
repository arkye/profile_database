package br.unb.itrac;

import java.beans.PropertyEditorSupport;
import java.util.List;

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
import br.unb.itrac.model.CompetencyScale;
import br.unb.itrac.service.CompetencyCategoryService;
import br.unb.itrac.service.CompetencyScaleService;
import br.unb.itrac.service.CompetencyService;

@Controller
public class CompetencyCategoryController {

	private CompetencyCategoryService competencyCategoryService;
	private CompetencyScaleService competencyScaleService;
	private CompetencyService competencyService;

	@Autowired(required = true)
	@Qualifier(value = "competencyCategoryService")
	public void setCompetencyCategoryService(CompetencyCategoryService competencyCategoryService) {
		this.competencyCategoryService = competencyCategoryService;
	}

	@Autowired(required = true)
	@Qualifier(value = "competencyScaleService")
	public void setCompetencyScaleService(CompetencyScaleService competencyScaleService) {
		this.competencyScaleService = competencyScaleService;
	}
	
	@Autowired(required = true)
	@Qualifier(value = "competencyService")
	public void setCompetencyService(CompetencyService competencyService) {
		this.competencyService = competencyService;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(CompetencyScale.class, "competencyScale", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				CompetencyScale competencyScale = competencyScaleService.getCompetencyScaleById(Integer.parseInt(text));
				setValue(competencyScale);
			}
		});
	}

	@RequestMapping(value = "/competency-categories", method = RequestMethod.GET)
	public String listCompetencyCategorys(Model model) {
		model.addAttribute("competencyCategory", new CompetencyCategory());
		model.addAttribute("competencyScales", this.competencyScaleService.listCompetencyScales());
		model.addAttribute("competencyCategories", this.competencyCategoryService.listCompetencyCategories());
		return "competency-categories";
	}

	@RequestMapping(value = "/competency-categories/add", method = RequestMethod.POST)
	public String addCompetencyCategory(@ModelAttribute("competencyCategory") CompetencyCategory competencyCategory) {
		if (competencyCategory.getId() == 0) {
			this.competencyCategoryService.addCompetencyCategory(competencyCategory);
		} else {
			this.competencyCategoryService.updateCompetencyCategory(competencyCategory);
		}
		return "redirect:/competency-categories";
	}

	@RequestMapping("/competency-categories/remove/{id}")
	public String removeCompetencyCategory(@PathVariable("id") int id) {
		List<Competency> competencies = competencyService.listCompetencies();
		if(competencies != null && !competencies.isEmpty()) {
			for(Competency competency : competencies) {
				if(competency.getCompetencyCategory().getId() == id) {
					competency.setCompetencyCategory(null);
					competencyService.updateCompetency(competency);
				}
			}
		}
		this.competencyCategoryService.removeCompetencyCategory(id);
		return "redirect:/competency-categories";
	}

	@RequestMapping("/competency-categories/edit/{id}")
	public String editCompetencyCategory(@PathVariable("id") int id, Model model) {
		model.addAttribute("competencyCategory", competencyCategoryService.getCompetencyCategoryById(id));
		model.addAttribute("competencyScales", this.competencyScaleService.listCompetencyScales());
		model.addAttribute("competencyCategories", this.competencyCategoryService.listCompetencyCategories());
		return "competency-categories";
	}
}
