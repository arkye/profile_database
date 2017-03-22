package br.unb.itrac;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.unb.itrac.model.ScaleOption;
import br.unb.itrac.service.ScaleOptionService;

@Controller
public class ScaleOptionController {
	
	private ScaleOptionService scaleOptionService;
	
	@Autowired(required=true)
	@Qualifier(value="scaleOptionService")
	public void setScaleOptionService(ScaleOptionService scaleOptionService) {
		this.scaleOptionService = scaleOptionService;
	}
	
	@RequestMapping(value = "/scale-options", method = RequestMethod.GET)
	public String listScaleOptions(Model model) {
		model.addAttribute("scaleOption", new ScaleOption());
		model.addAttribute("scaleOptions", this.scaleOptionService.listScaleOptions());
		return "scale-options";
	}
	
	@RequestMapping(value = "/scale-options/add", method = RequestMethod.POST)
	public String addScaleOption(@ModelAttribute("scaleOption") ScaleOption scaleOption) {
		if(scaleOption.getId() == 0) {
			this.scaleOptionService.addScaleOption(scaleOption);
		} else {
			this.scaleOptionService.updateScaleOption(scaleOption);
		}
		return "redirect:/scale-options";
	}
	
	@RequestMapping("/scale-options/remove/{id}")
	public String removeScaleOption(@PathVariable("id") int id) {
		this.scaleOptionService.removeScaleOption(id);
		return "redirect:/scale-options";
	}
	
	@RequestMapping("/scale-options/edit/{id}")
	public String editScaleOption(@PathVariable("id") int id, Model model) {
		model.addAttribute("scaleOption", this.scaleOptionService.getScaleOptionById(id));
		model.addAttribute("listScaleOptions", this.scaleOptionService.listScaleOptions());
		return "scale-options";
	}
}
