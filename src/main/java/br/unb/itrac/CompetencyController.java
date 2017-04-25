package br.unb.itrac;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String listCompetencies(Model model) {
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
	public String removeCompetency(@PathVariable("id") int id) {
		List<Profile> profiles = this.profileService.listProfiles();
		for (Profile profile : profiles) {
			List<Competency> competencies = new ArrayList<>();
			boolean hasProfile = false;
			for (Competency competency : profile.getCompetencies()) {
				if (competency.getId() != id) {
					competencies.add(competency);
				} else {
					hasProfile = true;
				}
			}
			if (hasProfile) {
				profile.setCompetencies(competencies);
				this.profileService.updateProfile(profile);
			}
		}

		List<Contract> contracts = this.contractService.listContracts();
		for (Contract contract : contracts) {
			List<Competency> competencies = new ArrayList<>();
			boolean hasProfile = false;
			for (Competency competency : contract.getCompetencies()) {
				if (competency.getId() != id) {
					competencies.add(competency);
				} else {
					hasProfile = true;
				}
			}
			if (hasProfile) {
				contract.setCompetencies(competencies);
				this.contractService.updateContract(contract);
			}
		}

		this.competencyService.removeCompetency(id);
		return "redirect:/competencies";
	}

	@RequestMapping("/competencies/edit/{id}")
	public String editCompetency(@PathVariable("id") int id, Model model) {
		model.addAttribute("competency", competencyService.getCompetencyById(id));
		model.addAttribute("competencies", this.competencyService.listCompetencies());
		return "/competency";
	}
}
