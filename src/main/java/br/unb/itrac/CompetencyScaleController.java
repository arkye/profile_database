package br.unb.itrac;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.unb.itrac.model.CompetencyCategory;
import br.unb.itrac.model.CompetencyScale;
import br.unb.itrac.model.ScaleOption;
import br.unb.itrac.service.CompetencyCategoryService;
import br.unb.itrac.service.CompetencyScaleService;
import br.unb.itrac.service.ScaleOptionService;

@Controller
public class CompetencyScaleController {

	private CompetencyScaleService competencyScaleService;
	private ScaleOptionService scaleOptionService;
	private CompetencyCategoryService competencyCategoryService;

	@Autowired(required = true)
	@Qualifier(value = "competencyScaleService")
	public void setCompetencyScaleService(CompetencyScaleService competencyScaleService) {
		this.competencyScaleService = competencyScaleService;
	}

	@Autowired(required = true)
	@Qualifier(value = "scaleOptionService")
	public void setScaleOptionService(ScaleOptionService scaleOptionService) {
		this.scaleOptionService = scaleOptionService;
	}
	
	@Autowired(required = true)
	@Qualifier(value = "competencyCategoryService")
	public void setCompetencyCategoryService(CompetencyCategoryService competencyCategoryService) {
		this.competencyCategoryService = competencyCategoryService;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(List.class, "scaleOptions", new CustomCollectionEditor(List.class) {
			protected Object convertElement(Object element) {
				if (element instanceof String) {
					ScaleOption scaleOption = scaleOptionService
							.getScaleOptionById(Integer.parseInt(element.toString()));
					return scaleOption;
				}
				return null;
			}
		});
	}

	@RequestMapping(value = "/competency-scales", method = RequestMethod.GET)
	public String listCompetencyScales(Model model) {
		model.addAttribute("competencyScale", new CompetencyScale());
		model.addAttribute("scaleOptions", this.scaleOptionService.listScaleOptions());
		model.addAttribute("competencyScales", this.competencyScaleService.listCompetencyScales());
		return "competency-scales";
	}

	@RequestMapping(value = "/competency-scales/add", method = RequestMethod.POST)
	public String addCompetencyScale(@ModelAttribute("competencyScale") CompetencyScale competencyScale) {
		if (competencyScale.getId() == 0) {
			this.competencyScaleService.addCompetencyScale(competencyScale);
		} else {
			this.competencyScaleService.updateCompetencyScale(competencyScale);
		}
		return "redirect:/competency-scales";
	}

	@RequestMapping("/competency-scales/remove/{id}")
	public String removeCompetencyScale(@PathVariable("id") int id) {
		List<CompetencyCategory> competencyCategories = competencyCategoryService.listCompetencyCategories();
		if(competencyCategories != null && !competencyCategories.isEmpty()) {
			for(CompetencyCategory competencyCategory : competencyCategories) {
				if(competencyCategory.getCompetencyScale().getId() == id) {
					competencyCategory.setCompetencyScale(null);
					competencyCategoryService.updateCompetencyCategory(competencyCategory);
				}
			}
		}
		this.competencyScaleService.removeCompetencyScale(id);
		return "redirect:/competency-scales";
	}

	@RequestMapping("/competency-scales/edit/{id}")
	public String editCompetencyScale(@PathVariable("id") int id, Model model) {
		model.addAttribute("competencyScale", competencyScaleService.getCompetencyScaleById(id));
		model.addAttribute("scaleOptions", this.scaleOptionService.listScaleOptions());
		model.addAttribute("competencyScales", this.competencyScaleService.listCompetencyScales());
		return "competency-scales";
	}
}
