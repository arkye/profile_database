package br.unb.itrac;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import br.unb.itrac.model.Collaborator;
import br.unb.itrac.model.Competency;
import br.unb.itrac.model.Contract;
import br.unb.itrac.model.Profile;
import br.unb.itrac.service.CollaboratorService;
import br.unb.itrac.service.CompetencyService;
import br.unb.itrac.service.ContractService;
import br.unb.itrac.service.ProfileService;

@Controller
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);

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

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Contract.class, "contract", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				Contract contract = contractService.getContractById(Integer.parseInt(text));
				setValue(contract);
			}
		});
	}

	@RequestMapping(value = "/profiles", method = RequestMethod.GET)
	public String listProfiles(Model model) {
		model.addAttribute("profile", new Profile());
		model.addAttribute("profiles", this.profileService.listProfiles());
		model.addAttribute("contracts", this.contractService.listContracts());
		return "profiles";
	}

	@RequestMapping(value = "/profiles/add", method = RequestMethod.POST)
	public String addProfile(@ModelAttribute("profile") Profile profile) {
		this.profileService.addProfile(profile);
		return "redirect:/profiles/edit/" + profile.getId();
	}

	@RequestMapping("/profiles/remove/{id}")
	public String removeProfile(@PathVariable("id") int id) {
		this.profileService.removeProfile(id);
		return "redirect:/profiles";
	}

	@RequestMapping("/profiles/edit/{id}")
	public String showProfile(@PathVariable("id") int id, Model model) {
		Profile profile = this.profileService.getProfileById(id);
		model.addAttribute("profile", profile);
		List<Competency> filteredCompetencies = new ArrayList<>();
		List<Competency> contractCompetencies = this.contractService.getContractById(profile.getContract().getId()).getCompetencies();
		for(Competency competency : contractCompetencies) {
			boolean hasCompetency = false;
			for(Competency profileCompetency : profile.getCompetencies()) {
				if(profileCompetency.getId() == competency.getId()) {
					hasCompetency = true;
					break;
				}
			}
			if(!hasCompetency) {
				filteredCompetencies.add(competency);
			}
		}
		model.addAttribute("profiles", this.profileService.listProfiles());
		model.addAttribute("contracts", this.contractService.listContracts());
		model.addAttribute("competencies", filteredCompetencies);
		model.addAttribute("collaborators", this.collaboratorService.listCollaboratorsWithoutThisProfile(profile));
		return "profile";
	}

	@RequestMapping(value = "/profiles/edit", method = RequestMethod.POST)
	public String editProfile(@ModelAttribute("profile") Profile profile) {
		Profile databaseProfile = this.profileService.getProfileById(profile.getId());
		profile.setCollaborators(databaseProfile.getCollaborators());
		if (profile.getContract().getId() == databaseProfile.getContract().getId()) {
			profile.setCompetencies(databaseProfile.getCompetencies());
		} else {
			profile.getCompetencies().clear();
		}
		this.profileService.updateProfile(profile);
		return "redirect:/profiles";
	}

	@RequestMapping("/profiles/edit/{id}/add/competency/{competency_id}")
	public String addCompetency(@PathVariable("id") int id, @PathVariable("competency_id") int competencyId) {
		Profile profile = this.profileService.getProfileById(id);
		Competency competency = this.competencyService.getCompetencyById(competencyId);
		profile.getCompetencies().add(competency);
		this.profileService.updateProfile(profile);
		return "redirect:/profiles/edit/" + id;
	}

	@RequestMapping("/profiles/edit/{id}/remove/competency/{competency_index}")
	public String removeCompetency(@PathVariable("id") int id, @PathVariable("competency_index") int competencyIndex) {
		Profile profile = this.profileService.getProfileById(id);
		profile.getCompetencies().remove(competencyIndex);
		this.profileService.updateProfile(profile);
		return "redirect:/profiles/edit/" + id;
	}

	@RequestMapping("/profiles/edit/{id}/add/collaborator/{collaborator_id}")
	public String addCollaborator(@PathVariable("id") int id, @PathVariable("collaborator_id") int collaboratorId) {
		Profile profile = this.profileService.getProfileById(id);
		Collaborator collaborator = this.collaboratorService.getCollaboratorById(collaboratorId);
		collaborator.getProfiles().add(profile);
		this.collaboratorService.updateCollaborator(collaborator);
		profile.getCollaborators().add(collaborator);
		this.profileService.updateProfile(profile);
		return "redirect:/profiles/edit/" + id;
	}

	@RequestMapping("/profiles/edit/{id}/remove/collaborator/{collaborator_index}")
	public String removeCollaborator(@PathVariable("id") int id,
			@PathVariable("collaborator_index") int collaboratorIndex) {
		Profile profile = this.profileService.getProfileById(id);
		Collaborator collaborator = profile.getCollaborators().get(collaboratorIndex);
		profile.getCollaborators().remove(collaboratorIndex);
		this.profileService.updateProfile(profile);
		List<Profile> profiles = new ArrayList<>();
		for(Profile collaboratorProfile : collaborator.getProfiles()) {
			if(collaboratorProfile.getId() != profile.getId()) {
				profiles.add(collaboratorProfile);
			}
		}
		collaborator.setProfiles(profiles);
		this.collaboratorService.updateCollaborator(collaborator);
		return "redirect:/profiles/edit/" + id;	
	}
}
