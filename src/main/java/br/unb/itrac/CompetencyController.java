package br.unb.itrac;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.unb.itrac.model.Competency;
import br.unb.itrac.model.Contract;
import br.unb.itrac.model.Profile;
import br.unb.itrac.service.CompetencyService;
import br.unb.itrac.service.ContractService;
import br.unb.itrac.service.ProfileService;

@Controller
public class CompetencyController {

	private CompetencyService competencyService;
	private ProfileService profileService;
	private ContractService contractService;

	@Autowired(required = true)
	@Qualifier(value = "competencyService")
	public void setCompetencyService(CompetencyService competencyService) {
		this.competencyService = competencyService;
	}

	@Autowired(required = true)
	@Qualifier(value = "profileService")
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	@Autowired(required = true)
	@Qualifier(value = "contractService")
	public void setContractService(ContractService contractService) {
		this.contractService = contractService;
	}

	@RequestMapping(value = "/competencies", method = RequestMethod.GET)
	public String listCompetencies(Model model, @ModelAttribute("removal") Competency removal,
			@ModelAttribute("removed") Competency removed) {
		if (removal != null && removal.getId() != 0) {
			model.addAttribute("removal", removal);
		} else if (removed != null && removed.getId() != 0) {
			model.addAttribute("removed", removed);
		}
		model.addAttribute("competency", new Competency());
		model.addAttribute("competencies", this.competencyService.listCompetencies());
		return "/competencies";
	}

	@RequestMapping(value = "/competencies/add", method = RequestMethod.POST)
	public String addCompetency(@ModelAttribute("competency") Competency competency) {
		this.competencyService.addCompetency(competency);
		return "redirect:/competencies";
	}

	@RequestMapping(value = "/competencies/edit/save", method = RequestMethod.POST)
	public String saveCompetency(@ModelAttribute("competency") Competency competency) {
		this.competencyService.updateCompetency(competency);
		return "redirect:/competencies";
	}

	@RequestMapping("/competencies/remove/{id}")
	public String confirmToRemoveCompetency(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("removal", this.competencyService.getCompetencyById(id));
		return "redirect:/competencies";
	}

	@RequestMapping("/competencies/remove/{id}/confirm")
	public String removeCompetency(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
		try {
			Competency competency = this.competencyService.getCompetencyById(id);
			Contract contract = competency.getContract();
			if (contract != null) {
				List<Profile> profiles = this.profileService.listProfiles();
				for (Profile profile : profiles) {
					boolean hasCompetency = false;
					int index = 0;
					for (Competency profileCompetency : profile.getCompetencies()) {
						if (profileCompetency.getId() == id) {
							profile.getCompetencies().remove(index);
							hasCompetency = true;
							break;
						}
						index++;
					}
					if (hasCompetency) {
						this.profileService.updateProfile(profile);
					}
				}

				boolean hasCompetency = false;
				int index = 0;
				for (Competency contractCompetency : contract.getCompetencies()) {
					if (contractCompetency.getId() == id) {
						contract.getCompetencies().remove(index);
						hasCompetency = true;
						break;
					}
					index++;
				}
				if (hasCompetency) {
					this.contractService.updateContract(contract);
				}
			}
			this.competencyService.removeCompetency(id);
			redirectAttributes.addFlashAttribute("removed", competency);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/competencies";
	}

	@RequestMapping("/competencies/edit/{id}")
	public String editCompetency(@PathVariable("id") int id, Model model) {
		model.addAttribute("competency", competencyService.getCompetencyById(id));
		model.addAttribute("competencies", this.competencyService.listCompetencies());
		return "/competency";
	}
}
