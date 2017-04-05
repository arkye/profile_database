package br.unb.itrac;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.unb.itrac.service.CollaboratorService;
import br.unb.itrac.service.CompetencyService;
import br.unb.itrac.service.ContractService;
import br.unb.itrac.service.ProfileService;

@Controller
public class HomeController {
	
	private ProfileService profileService;
	private CompetencyService competencyService;
	private ContractService contractService;
	private CollaboratorService collaboratorService;

	@Autowired(required = true)
	@Qualifier(value = "profileService")
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	@Autowired(required = true)
	@Qualifier(value = "competencyService")
	public void setCompetencyService(CompetencyService competencyService) {
		this.competencyService = competencyService;
	}

	@Autowired(required = true)
	@Qualifier(value = "contractService")
	public void setContractService(ContractService contractService) {
		this.contractService = contractService;
	}

	@Autowired(required = true)
	@Qualifier(value = "collaboratorService")
	public void setCollaboratorService(CollaboratorService collaboratorService) {
		this.collaboratorService = collaboratorService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showHome(Model model) {
		model.addAttribute("quantityOfProfiles", this.profileService.listProfiles().size());
		model.addAttribute("quantityOfContracts", this.contractService.listContracts().size());
		model.addAttribute("quantityOfCollaborators", this.collaboratorService.listCollaborators().size());
		model.addAttribute("quantityOfCompetencies", this.competencyService.listCompetencies().size());
		return "/index";
	}
}
